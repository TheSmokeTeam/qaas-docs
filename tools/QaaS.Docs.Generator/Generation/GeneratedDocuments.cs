using System.Security.Cryptography;
using System.Text;

namespace QaaS.Docs.Generator;

internal sealed record GeneratedDocument(string RelativePath, string Content);

internal sealed class GeneratedDocumentWriter
{
    private readonly string _docsRoot;
    private readonly bool _dryRun;

    private GeneratedDocumentWriter(string docsRoot, bool dryRun)
    {
        _docsRoot = docsRoot;
        _dryRun = dryRun;
    }

    public static GeneratedDocumentWriter Create(string docsRoot) => new(docsRoot, dryRun: false);

    public static GeneratedDocumentWriter CreateDryRun(string docsRoot) => new(docsRoot, dryRun: true);

    public List<string> Write(IEnumerable<GeneratedDocument> documents)
    {
        var failures = new List<string>();

        foreach (var document in documents)
        {
            var normalizedContent = document.Content.EndsWith(Environment.NewLine, StringComparison.Ordinal)
                ? document.Content
                : document.Content + Environment.NewLine;
            var fullPath = Path.Combine(_docsRoot, "docs", document.RelativePath.Replace('/', Path.DirectorySeparatorChar));

            if (_dryRun)
            {
                if (!File.Exists(fullPath))
                {
                    failures.Add($"Missing generated file: {fullPath}");
                    continue;
                }

                var current = File.ReadAllText(fullPath);
                if (!string.Equals(current, normalizedContent, StringComparison.Ordinal))
                {
                    failures.Add($"Generated file is out of date: {fullPath}");
                }

                continue;
            }

            Directory.CreateDirectory(Path.GetDirectoryName(fullPath)!);
            File.WriteAllText(fullPath, normalizedContent);
        }

        return failures;
    }
}

internal static class GeneratedDocumentHasher
{
    public static string Hash(string content)
    {
        var bytes = SHA256.HashData(Encoding.UTF8.GetBytes(content));
        return Convert.ToHexString(bytes).ToLowerInvariant()[..12];
    }

    public static string WithHeader(string body, params IEnumerable<string> sources)
    {
        var hash = Hash(body);
        return $"<!-- generated hash:{hash} sources:{string.Join(", ", sources)} -->{Environment.NewLine}{Environment.NewLine}{body}";
    }
}
