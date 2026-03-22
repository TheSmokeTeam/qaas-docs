using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using QaaS.Docs.Generator.Cli;

namespace QaaS.Docs.Generator.Functions;

internal sealed record FunctionCatalog(IReadOnlyList<FunctionEntry> Entries);

internal sealed record FunctionEntry(
    string Product,
    string Group,
    string Subgroup,
    int Order,
    string Kind,
    string Signature,
    string Summary,
    string Remarks,
    string RelativePath,
    int LineNumber);

internal sealed record FunctionManifest(IReadOnlyList<FunctionManifestProduct> Products);

internal sealed record FunctionManifestProduct(string Product, IReadOnlyList<FunctionManifestType> Types);

internal sealed record FunctionManifestType(string File, string TypeName, string Group, string Subgroup);

internal static class FunctionCatalogBuilder
{
    internal static readonly string[] SupportedProducts = ["Runner", "Mocker", "Framework"];

    public static async Task<FunctionCatalog> BuildAsync(
        string manifestPath,
        string runnerRoot,
        string mockerRoot,
        string frameworkRoot)
    {
        var manifest = await LoadManifestAsync(manifestPath);
        var entries = new List<FunctionEntry>();

        foreach (var product in manifest.Products)
        {
            var productRoot = ResolveProductRoot(product.Product, runnerRoot, mockerRoot, frameworkRoot);
            foreach (var type in product.Types)
            {
                var filePath = Path.Combine(productRoot, type.File.Replace('/', Path.DirectorySeparatorChar));
                if (!File.Exists(filePath))
                {
                    throw new FileNotFoundException(
                        $"Function manifest entry points to a missing file: {filePath}",
                        filePath);
                }

                var text = await File.ReadAllTextAsync(filePath);
                var tree = CSharpSyntaxTree.ParseText(text, path: filePath);
                var root = await tree.GetRootAsync();
                var typeDeclaration = root.DescendantNodes()
                    .OfType<TypeDeclarationSyntax>()
                    .FirstOrDefault(candidate =>
                        string.Equals(candidate.Identifier.Text, type.TypeName, StringComparison.Ordinal));

                if (typeDeclaration is null)
                {
                    throw new InvalidOperationException(
                        $"Could not find type '{type.TypeName}' in '{filePath}'.");
                }

                var order = 0;
                foreach (var method in typeDeclaration.Members.OfType<MethodDeclarationSyntax>()
                             .Where(IsUserFacingMethod)
                             .OrderBy(method => method.SpanStart))
                {
                    var documentation = DocumentationCommentParser.Parse(method);
                    var lineNumber = method.GetLocation().GetLineSpan().StartLinePosition.Line + 1;
                    entries.Add(new FunctionEntry(
                        product.Product,
                        type.Group,
                        type.Subgroup,
                        order++,
                        "function",
                        SignatureFormatter.Format(typeDeclaration, method),
                        string.IsNullOrWhiteSpace(documentation.Summary)
                            ? "_No XML summary provided._"
                            : documentation.Summary,
                        documentation.Remarks,
                        Path.GetRelativePath(productRoot, filePath).Replace('\\', '/'),
                        lineNumber));
                }
            }
        }

        return new FunctionCatalog(entries
            .OrderBy(entry => entry.Product, StringComparer.Ordinal)
            .ThenBy(entry => entry.Group, StringComparer.Ordinal)
            .ThenBy(entry => entry.Subgroup, StringComparer.Ordinal)
            .ThenBy(entry => entry.Order)
            .ThenBy(entry => entry.Signature, StringComparer.Ordinal)
            .ToList());
    }

    private static bool IsUserFacingMethod(MethodDeclarationSyntax method)
    {
        return method.Modifiers.Any(modifier => modifier.IsKind(SyntaxKind.PublicKeyword));
    }

    private static string ResolveProductRoot(
        string product,
        string runnerRoot,
        string mockerRoot,
        string frameworkRoot)
    {
        return product switch
        {
            "Runner" => runnerRoot,
            "Mocker" => mockerRoot,
            "Framework" => frameworkRoot,
            _ => throw new InvalidOperationException($"Unsupported function manifest product '{product}'.")
        };
    }

    private static async Task<FunctionManifest> LoadManifestAsync(string manifestPath)
    {
        await using var stream = File.OpenRead(manifestPath);
        var manifest = await JsonSerializer.DeserializeAsync<FunctionManifest>(stream, JsonDefaults.Options);
        return manifest ?? throw new InvalidOperationException(
            $"Could not deserialize function manifest from {manifestPath}.");
    }
}

internal sealed class FunctionReferenceRenderer
{
    public IReadOnlyList<GeneratedDocument> Render(FunctionCatalog catalog)
    {
        return FunctionCatalogBuilder.SupportedProducts
            .Select(product => new GeneratedDocument(
                GetOutputPath(product),
                GeneratedDocumentHasher.WithHeader(
                    RenderProductPage(
                        product,
                        catalog.Entries
                            .Where(entry => string.Equals(entry.Product, product, StringComparison.Ordinal))
                            .ToList()),
                    [product, "functions"])))
            .ToList();
    }

    private static string GetOutputPath(string product)
    {
        return product switch
        {
            "Runner" => "qaas/functions/index.md",
            "Mocker" => "mocker/functions/index.md",
            "Framework" => "framework/functions/index.md",
            _ => $"{product.ToLowerInvariant()}/functions/index.md"
        };
    }

    private static string RenderProductPage(string product, IReadOnlyList<FunctionEntry> entries)
    {
        var builder = new StringBuilder();
        builder.AppendLine($"# {product} Functions");
        builder.AppendLine();
        builder.AppendLine("This page is generated from the docs generator function manifest and the current source tree.");

        if (entries.Count == 0)
        {
            builder.AppendLine();
            builder.AppendLine("No functions are currently configured for this product.");
            return builder.ToString().TrimEnd();
        }

        foreach (var group in entries.GroupBy(entry => entry.Group, StringComparer.Ordinal))
        {
            builder.AppendLine();
            builder.AppendLine($"## {group.Key}");

            foreach (var subgroup in group.GroupBy(entry => entry.Subgroup, StringComparer.Ordinal))
            {
                builder.AppendLine();
                builder.AppendLine($"### {subgroup.Key}");

                foreach (var entry in subgroup)
                {
                    builder.AppendLine();
                    builder.AppendLine($"#### `{entry.Signature}`");
                    builder.AppendLine();
                    builder.AppendLine($"- Kind: `{entry.Kind}`");
                    builder.AppendLine($"- Location: `{entry.RelativePath}:{entry.LineNumber}`");
                    builder.AppendLine();
                    builder.AppendLine(entry.Summary);
                    if (!string.IsNullOrWhiteSpace(entry.Remarks))
                    {
                        builder.AppendLine();
                        builder.AppendLine(entry.Remarks);
                    }
                }
            }
        }

        return builder.ToString().TrimEnd();
    }
}

internal sealed record DocumentationComment(string Summary, string Remarks);

internal static class DocumentationCommentParser
{
    public static DocumentationComment Parse(MemberDeclarationSyntax member)
    {
        var xml = ParseXml(member);
        if (xml is null)
        {
            return new DocumentationComment(string.Empty, string.Empty);
        }

        return new DocumentationComment(
            Flatten(xml.Descendants("summary").FirstOrDefault()),
            Flatten(xml.Descendants("remarks").FirstOrDefault()));
    }

    public static XDocument? ParseXml(MemberDeclarationSyntax member)
    {
        var trivia = member.GetLeadingTrivia()
            .Select(trivia => trivia.GetStructure())
            .OfType<DocumentationCommentTriviaSyntax>()
            .FirstOrDefault();
        if (trivia is null)
        {
            return null;
        }

        try
        {
            var normalizedXml = NormalizeDocumentationTrivia(trivia.ToFullString());
            return XDocument.Parse("<root>" + normalizedXml + "</root>");
        }
        catch
        {
            return null;
        }
    }

    private static string Flatten(XElement? element)
    {
        if (element is null)
        {
            return string.Empty;
        }

        var text = string.Join(" ", element
            .Nodes()
            .SelectMany(FlattenNode)
            .Where(value => !string.IsNullOrWhiteSpace(value)));

        return Regex.Replace(text, "\\s+", " ").Trim();
    }

    private static IEnumerable<string> FlattenNode(XNode node)
    {
        switch (node)
        {
            case XText text:
                yield return text.Value.Trim();
                yield break;
            case XElement element:
                if (element.Name.LocalName is "see" or "seealso")
                {
                    var cref = (string?)element.Attribute("cref");
                    if (!string.IsNullOrWhiteSpace(cref))
                    {
                        yield return SimplifyReference(cref);
                    }

                    var langword = (string?)element.Attribute("langword");
                    if (!string.IsNullOrWhiteSpace(langword))
                    {
                        yield return langword;
                    }

                    var href = (string?)element.Attribute("href");
                    if (!string.IsNullOrWhiteSpace(href))
                    {
                        yield return href;
                    }

                    yield break;
                }

                if (element.Name.LocalName == "paramref")
                {
                    var name = (string?)element.Attribute("name");
                    if (!string.IsNullOrWhiteSpace(name))
                    {
                        yield return name;
                    }

                    yield break;
                }

                foreach (var nested in element.Nodes().SelectMany(FlattenNode))
                {
                    yield return nested;
                }

                yield break;
        }
    }

    private static string NormalizeDocumentationTrivia(string rawDocumentation)
    {
        return string.Join(
            Environment.NewLine,
            rawDocumentation
                .Split(["\r\n", "\n"], StringSplitOptions.None)
                .Select(line => Regex.Replace(line, "^\\s*///\\s?", string.Empty)));
    }

    private static string SimplifyReference(string reference)
    {
        var trimmed = reference.Length > 2 && reference[1] == ':'
            ? reference[2..]
            : reference;
        var lastSegment = trimmed.Split('.').LastOrDefault();
        return string.IsNullOrWhiteSpace(lastSegment) ? trimmed : lastSegment;
    }
}

internal static class SignatureFormatter
{
    public static string Format(TypeDeclarationSyntax typeDeclaration, MethodDeclarationSyntax method)
    {
        var parameters = string.Join(", ", method.ParameterList.Parameters.Select(parameter => parameter.ToString()));
        var genericParameters = method.TypeParameterList?.ToString() ?? string.Empty;
        return $"{typeDeclaration.Identifier.Text}.{method.Identifier.Text}{genericParameters}({parameters}) : {method.ReturnType}";
    }
}
