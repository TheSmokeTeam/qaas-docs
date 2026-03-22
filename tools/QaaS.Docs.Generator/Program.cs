using QaaS.Docs.Generator.Cli;
using QaaS.Docs.Generator.Functions;
using QaaS.Docs.Generator.Schema;

namespace QaaS.Docs.Generator;

internal static class Program
{
    public static async Task<int> Main(string[] args)
    {
        var options = GeneratorOptions.Parse(args);
        if (options is null)
        {
            Console.Error.WriteLine(
                "Usage: --docs-root <path> --mirror-root <path> --runner-root <path> --mocker-root <path> --framework-root <path> [--check]");
            return 1;
        }

        try
        {
            var runnerSchemaDocs = await FamilySchemaDocs.LoadAsync(Path.Combine(options.MirrorRoot, "schemas", "runner-family", "latest"));
            var mockerSchemaDocs = await FamilySchemaDocs.LoadAsync(Path.Combine(options.MirrorRoot, "schemas", "mocker-family", "latest"));

            var toolRoot = Path.Combine(options.DocsRoot, "tools", "QaaS.Docs.Generator");
            var runnerCliCatalog = await RunnerCliCatalog.LoadAsync(Path.Combine(toolRoot, "Snapshots", "runner-cli.json"));
            var mockerCliCatalog = await MockerCliCatalog.LoadAsync(Path.Combine(toolRoot, "Snapshots", "mocker-cli.json"));

            var functionCatalog = await FunctionCatalogBuilder.BuildAsync(
                Path.Combine(toolRoot, "Functions", "function-manifest.json"),
                options.RunnerRoot,
                options.MockerRoot,
                options.FrameworkRoot);

            var writer = options.Check
                ? GeneratedDocumentWriter.CreateDryRun(options.DocsRoot)
                : GeneratedDocumentWriter.Create(options.DocsRoot);

            var documents = new List<GeneratedDocument>();
            documents.AddRange(new CliReferenceRenderer().RenderRunner(runnerCliCatalog));
            documents.AddRange(new CliReferenceRenderer().RenderMocker(mockerCliCatalog));
            documents.AddRange(new ConfigurationReferenceRenderer().RenderRunner(runnerSchemaDocs));
            documents.AddRange(new ConfigurationReferenceRenderer().RenderMocker(mockerSchemaDocs));
            documents.AddRange(new FunctionReferenceRenderer().Render(functionCatalog));

            var failures = writer.Write(documents);
            if (failures.Count != 0)
            {
                foreach (var failure in failures)
                {
                    Console.Error.WriteLine(failure);
                }

                return 2;
            }

            Console.WriteLine(
                "{0} {1} generated documents.",
                options.Check ? "Validated" : "Wrote",
                documents.Count);
            return 0;
        }
        catch (Exception exception)
        {
            Console.Error.WriteLine(exception);
            return 3;
        }
    }
}

internal sealed record GeneratorOptions(
    string DocsRoot,
    string MirrorRoot,
    string RunnerRoot,
    string MockerRoot,
    string FrameworkRoot,
    bool Check)
{
    public static GeneratorOptions? Parse(IReadOnlyList<string> args)
    {
        var values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        var check = false;

        for (var index = 0; index < args.Count; index++)
        {
            var current = args[index];
            if (string.Equals(current, "--check", StringComparison.OrdinalIgnoreCase))
            {
                check = true;
                continue;
            }

            if (!current.StartsWith("--", StringComparison.Ordinal) || index == args.Count - 1)
            {
                return null;
            }

            values[current] = args[++index];
        }

        string? Get(string key) => values.TryGetValue(key, out var value) ? Path.GetFullPath(value) : null;

        var docsRoot = Get("--docs-root");
        var mirrorRoot = Get("--mirror-root");
        var runnerRoot = Get("--runner-root");
        var mockerRoot = Get("--mocker-root");
        var frameworkRoot = Get("--framework-root");

        if (docsRoot is null ||
            mirrorRoot is null ||
            runnerRoot is null ||
            mockerRoot is null ||
            frameworkRoot is null)
        {
            return null;
        }

        return new GeneratorOptions(docsRoot, mirrorRoot, runnerRoot, mockerRoot, frameworkRoot, check);
    }
}
