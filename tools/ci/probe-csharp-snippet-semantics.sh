#!/usr/bin/env bash
# Experimental semantic compiler for authored C# docs snippets.
#
# This intentionally stays outside the CI gate until the docs examples are
# remediated. It uses Roslyn to compile snippets against local QaaS assemblies
# and reports unresolved symbols / stale APIs that syntax validation cannot see.
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3}"
DOTNET_BIN="${DOTNET_BIN:-dotnet}"
REPORT_PATH="${REPORT_PATH:-planning/.tmp-csharp-semantic-failures.json}"
FAIL=0

if [ -z "${QAAS_ROOT:-}" ]; then
  if [ -d /mnt/d/QaaS/qaas-docs ]; then
    QAAS_ROOT=/mnt/d/QaaS
  elif pwd -W >/dev/null 2>&1; then
    QAAS_ROOT=$(cd .. && pwd -W)
  else
    QAAS_ROOT=$(cd .. && pwd)
  fi
fi

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  PYTHON_BIN=python
fi

if ! command -v "$DOTNET_BIN" >/dev/null 2>&1; then
  if command -v dotnet.exe >/dev/null 2>&1; then
    DOTNET_BIN=dotnet.exe
  elif [ -x "/mnt/c/Program Files/dotnet/dotnet.exe" ]; then
    DOTNET_BIN="/mnt/c/Program Files/dotnet/dotnet.exe"
  fi
fi

if ! command -v "$DOTNET_BIN" >/dev/null 2>&1 && [ ! -x "$DOTNET_BIN" ]; then
  echo "::error::dotnet SDK not found"
  exit 1
fi

USE_WSL_DOTNET=0
USE_WINDOWS_DOTNET_PATHS=0
if [[ "$DOTNET_BIN" == *.exe ]] && command -v wslpath >/dev/null 2>&1; then
  WORK="$PWD/.tmp-csharp-semantic-$$"
  USE_WSL_DOTNET=1
elif [[ "$DOTNET_BIN" == *.exe ]] && pwd -W >/dev/null 2>&1; then
  WORK="$(pwd -W)/.tmp-csharp-semantic-$$"
  USE_WINDOWS_DOTNET_PATHS=1
else
  WORK=$(mktemp -d)
fi

SNIPPETS="$WORK/snippets"
META="$WORK/snippets.tsv"
PARSER="$WORK/parser"

mkdir -p "$SNIPPETS" "$PARSER" "$(dirname "$REPORT_PATH")"

"$PYTHON_BIN" - "$SNIPPETS" "$META" <<'PY'
import pathlib
import re
import sys

snippets_dir = pathlib.Path(sys.argv[1])
meta_path = pathlib.Path(sys.argv[2])
docs = pathlib.Path("docs")
count = 0
pages = set()

for source in sorted(docs.rglob("*.md")):
    if any(part in source.parts for part in ("_generated",)):
        continue

    text = source.read_text(encoding="utf-8", errors="ignore")
    for match in re.finditer(r"(?:<!-- skip-compile -->\s*)?```csharp[^\n]*\n(.*?)```", text, re.S):
        if match.group(0).startswith("<!-- skip-compile -->"):
            continue
        if "**Signature**" in text[max(0, match.start() - 120):match.start()]:
            continue

        snippet = match.group(1).strip()
        if not snippet:
            continue

        snippet_path = snippets_dir / f"snippet_{count:04}.csx"
        snippet_path.write_text(snippet + "\n", encoding="utf-8")
        snippet_start_line = text[:match.start()].count("\n") + 2
        with meta_path.open("a", encoding="utf-8") as meta:
            meta.write(f"{snippet_path.as_posix()}\t{source.as_posix()}\t{snippet_start_line}\t{count}\n")
        pages.add(source.as_posix())
        count += 1

print(f"[semantic-csharp] extracted {count} snippets from {len(pages)} pages")
PY

sdk_line=$("$DOTNET_BIN" --list-sdks | tail -n 1)
sdk_version=$(printf '%s\n' "$sdk_line" | awk '{print $1}')
sdk_root=$(printf '%s\n' "$sdk_line" | sed -E 's/^[^[]+\[([^]]+)\].*$/\1/')

if [[ "$sdk_root" == *\\* ]]; then
  roslyn_dir="${sdk_root}\\${sdk_version}\\Roslyn\\bincore"
  code_analysis="${roslyn_dir}\\Microsoft.CodeAnalysis.dll"
  csharp="${roslyn_dir}\\Microsoft.CodeAnalysis.CSharp.dll"
else
  roslyn_dir="${sdk_root}/${sdk_version}/Roslyn/bincore"
  code_analysis="${roslyn_dir}/Microsoft.CodeAnalysis.dll"
  csharp="${roslyn_dir}/Microsoft.CodeAnalysis.CSharp.dll"
fi

cat > "$PARSER/SemanticSnippetProbe.csproj" <<XML
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net10.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Microsoft.CodeAnalysis" HintPath="$code_analysis" />
    <Reference Include="Microsoft.CodeAnalysis.CSharp" HintPath="$csharp" />
  </ItemGroup>
</Project>
XML

cat > "$PARSER/Program.cs" <<'CS'
using System.Collections.Immutable;
using System.Reflection.Metadata;
using System.Reflection.PortableExecutable;
using System.Text.Json;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.Text;

if (args.Length != 3)
{
    Console.Error.WriteLine("Usage: SemanticSnippetProbe <snippets.tsv> <qaas-root> <report-json>");
    return 2;
}

var metadataPath = args[0];
var qaasRoot = NormalizeQaasRoot(args[1]);
var reportPath = Path.GetFullPath(args[2]);

var referenceSet = DiscoverReferences(qaasRoot);
var references = referenceSet.References;
var imports = new[]
    {
        "System",
        "System.Collections.Generic",
        "System.Collections.Immutable",
        "System.ComponentModel",
        "System.ComponentModel.DataAnnotations",
        "System.Globalization",
        "System.IO",
        "System.Linq",
        "System.Net",
        "System.Net.Http",
        "System.Text",
        "System.Text.Json",
        "System.Text.Json.Nodes",
        "System.Threading",
        "System.Threading.Tasks",
        "Microsoft.Extensions.Logging",
        "QaaS.Framework.Configurations.CustomAttributes",
        "QaaS.Framework.SDK",
        "QaaS.Framework.SDK.DataSourceObjects",
        "QaaS.Framework.SDK.Extensions",
        "QaaS.Framework.SDK.Hooks.Assertion",
        "QaaS.Framework.SDK.Hooks.Generator",
        "QaaS.Framework.SDK.Hooks.Probe",
        "QaaS.Framework.SDK.Hooks.Processor",
        "QaaS.Framework.SDK.Session.CommunicationDataObjects",
        "QaaS.Framework.SDK.Session.DataObjects",
        "QaaS.Framework.SDK.Session.MetaDataObjects",
        "QaaS.Framework.SDK.Session.SessionDataObjects",
        "QaaS.Framework.SDK.Session.SessionDataObjects.RunningSessionsObjects",
        "QaaS.JsonSchemaExtensions",
        "QaaS.Runner.Assertions",
    }
    .Where(import => !string.IsNullOrWhiteSpace(import))
    .Distinct(StringComparer.Ordinal)
    .Order(StringComparer.Ordinal)
    .ToArray();

Console.WriteLine(
    $"[semantic-csharp] references: {references.Count} ({referenceSet.TrustedPlatformAssemblyCount} TPA, {referenceSet.LocalAssemblyCount} local); imports: {imports.Length}"
);
Console.WriteLine($"[semantic-csharp] qaas root: {qaasRoot}");

var scriptOptions = CSharpParseOptions.Default
    .WithKind(SourceCodeKind.Script)
    .WithLanguageVersion(LanguageVersion.Preview);
var regularOptions = CSharpParseOptions.Default
    .WithKind(SourceCodeKind.Regular)
    .WithLanguageVersion(LanguageVersion.Preview);
var scriptCompilationOptions = new CSharpCompilationOptions(OutputKind.DynamicallyLinkedLibrary)
    .WithNullableContextOptions(NullableContextOptions.Enable)
    .WithOverflowChecks(true);
var regularLibraryCompilationOptions = new CSharpCompilationOptions(OutputKind.DynamicallyLinkedLibrary)
    .WithNullableContextOptions(NullableContextOptions.Enable)
    .WithOverflowChecks(true);
var regularConsoleCompilationOptions = new CSharpCompilationOptions(OutputKind.ConsoleApplication)
    .WithNullableContextOptions(NullableContextOptions.Enable)
    .WithOverflowChecks(true);
var scriptPrelude = string.Join(Environment.NewLine, imports.Select(import => $"using {import};"));
var regularGlobalUsings = string.Join(Environment.NewLine, imports.Select(import => $"global using {import};"));

var diagnostics = new List<SnippetDiagnostic>();
var snippets = File.ReadLines(metadataPath)
    .Where(row => !string.IsNullOrWhiteSpace(row))
    .Select(Snippet.FromTsv)
    .GroupBy(snippet => snippet.SourcePath, StringComparer.Ordinal)
    .OrderBy(group => group.Key, StringComparer.Ordinal)
    .ToArray();

foreach (var page in snippets)
{
    var pageUsingDirectives = ExtractFirstLeadingUsingBlock(page);
    var pageScriptPrelude = BuildScriptPrelude(scriptPrelude, pageUsingDirectives);
    var pageRegularGlobalUsings = BuildRegularGlobalUsings(regularGlobalUsings, pageUsingDirectives);
    CSharpCompilation? previousSubmission = CreateScriptPrelude(
        page.Key,
        pageScriptPrelude,
        references,
        scriptCompilationOptions,
        scriptOptions
    );

    foreach (var snippet in page.OrderBy(snippet => snippet.Index))
    {
        var text = File.ReadAllText(snippet.SnippetPath);
        var scriptDiagnostics = CompileAsScriptSubmission(
            snippet,
            text,
            references,
            scriptCompilationOptions,
            scriptOptions,
            previousSubmission,
            out var nextSubmission
        );

        if (scriptDiagnostics.Count == 0)
        {
            previousSubmission = nextSubmission;
            continue;
        }

        var regularDiagnostics = CompileAsRegularSnippet(
            snippet,
            text,
            references,
            regularLibraryCompilationOptions,
            regularConsoleCompilationOptions,
            regularOptions,
            pageRegularGlobalUsings
        );

        if (regularDiagnostics.Count == 0)
        {
            continue;
        }

        diagnostics.AddRange(ChooseDiagnostics(scriptDiagnostics, regularDiagnostics));
    }
}

foreach (var diagnostic in diagnostics)
{
    Console.WriteLine(
        $"::error file={diagnostic.SourcePath},line={diagnostic.Line}::[{diagnostic.Mode} snippet {diagnostic.SnippetIndex}] {diagnostic.Id}: {diagnostic.Message}"
    );
}

var failedPages = diagnostics
    .Select(diagnostic => diagnostic.SourcePath)
    .Distinct(StringComparer.Ordinal)
    .Order(StringComparer.Ordinal)
    .ToArray();
var failedSnippetCount = diagnostics
    .Select(diagnostic => (diagnostic.SourcePath, diagnostic.SnippetIndex))
    .Distinct()
    .Count();

Directory.CreateDirectory(Path.GetDirectoryName(reportPath)!);
File.WriteAllText(
    reportPath,
    JsonSerializer.Serialize(
        new SemanticReport(
            snippets.Sum(page => page.Count()),
            snippets.Length,
            references.Count,
            imports.Length,
            failedSnippetCount,
            failedPages.Length,
            diagnostics
        ),
        new JsonSerializerOptions { WriteIndented = true }
    )
);

Console.WriteLine($"[semantic-csharp] report: {reportPath}");
Console.WriteLine($"[semantic-csharp] failed snippets: {failedSnippetCount}; failed pages: {failedPages.Length}");

return diagnostics.Count == 0 ? 0 : 1;

static ReferenceSet DiscoverReferences(string qaasRoot)
{
    var paths = new SortedDictionary<string, string>(StringComparer.OrdinalIgnoreCase);
    var trustedPlatformAssemblyCount = 0;
    var trustedPlatformAssemblies = ((string?)AppContext.GetData("TRUSTED_PLATFORM_ASSEMBLIES"))
        ?.Split(Path.PathSeparator)
        .ToArray()
        .Where(File.Exists) ?? Enumerable.Empty<string>();

    foreach (var path in trustedPlatformAssemblies)
    {
        if (AddReferencePath(paths, path))
        {
            trustedPlatformAssemblyCount++;
        }
    }

    var repoNames = new[]
    {
        "DummyAppMock",
        "QaaS.Common.Assertions",
        "QaaS.Common.Generators",
        "QaaS.Common.Probes",
        "QaaS.Common.Processors",
        "QaaS.ElasticBootstrap",
        "QaaS.Framework",
        "QaaS.JsonSchemaExtensions",
        "QaaS.Mocker",
        "Qaas.Mocker.CommunicationObjects",
        "QaaS.Runner",
    };

    foreach (var repoName in repoNames)
    {
        var repoPath = Path.Combine(qaasRoot, repoName);
        if (!Directory.Exists(repoPath))
        {
            continue;
        }

        foreach (var path in Directory.EnumerateFiles(repoPath, "*.dll", SearchOption.AllDirectories))
        {
            if (!IsDirectNet10Output(path) || path.EndsWith(".resources.dll", StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            if (path.Contains($"{Path.DirectorySeparatorChar}Tests{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase)
                || path.Contains($"{Path.DirectorySeparatorChar}E2ETests{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase)
                || path.Contains($"{Path.DirectorySeparatorChar}artifacts{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase)
                || path.Contains($"{Path.DirectorySeparatorChar}template{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            AddReferencePath(paths, path);
        }
    }

    var trustedPlatformAssemblyPaths = trustedPlatformAssemblies.ToHashSet(StringComparer.OrdinalIgnoreCase);
    var localAssemblyCount = paths.Values.Count(path => !trustedPlatformAssemblyPaths.Contains(path));

    return new ReferenceSet(
        paths.Values.Select(path => MetadataReference.CreateFromFile(path)).ToArray(),
        trustedPlatformAssemblyCount,
        localAssemblyCount
    );
}

static string NormalizeQaasRoot(string root)
{
    if (Directory.Exists(root))
    {
        return Path.GetFullPath(root);
    }

    if (root.Length >= 3 && root[0] == '/' && char.IsLetter(root[1]) && root[2] == '/')
    {
        var windowsRoot = $"{char.ToUpperInvariant(root[1])}:{root[2..].Replace('/', Path.DirectorySeparatorChar)}";
        if (Directory.Exists(windowsRoot))
        {
            return Path.GetFullPath(windowsRoot);
        }
    }

    if (root.Length >= 8
        && root.StartsWith("/mnt/", StringComparison.Ordinal)
        && char.IsLetter(root[5])
        && root[6] == '/')
    {
        var windowsRoot = $"{char.ToUpperInvariant(root[5])}:{root[6..].Replace('/', Path.DirectorySeparatorChar)}";
        if (Directory.Exists(windowsRoot))
        {
            return Path.GetFullPath(windowsRoot);
        }
    }

    return Path.GetFullPath(root);
}

static bool AddReferencePath(IDictionary<string, string> paths, string path)
{
    if (!File.Exists(path) || !HasMetadata(path))
    {
        return false;
    }

    var key = Path.GetFileName(path);
    if (!paths.ContainsKey(key) || IsPreferredPath(path, paths[key]))
    {
        paths[key] = path;
        return true;
    }

    return false;
}

static bool IsPreferredPath(string candidate, string existing)
{
    var candidateScore = ReferencePathScore(candidate);
    var existingScore = ReferencePathScore(existing);
    return candidateScore < existingScore
        || (candidateScore == existingScore && string.CompareOrdinal(candidate, existing) < 0);
}

static int ReferencePathScore(string path)
{
    var normalized = path.Replace(Path.AltDirectorySeparatorChar, Path.DirectorySeparatorChar);
    if (normalized.Contains($"{Path.DirectorySeparatorChar}DummyAppMock{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase))
    {
        // Sample apps can carry stale copies of core QaaS assemblies. Prefer the sibling source repos
        // for duplicate assembly names and use app-local outputs only for assemblies that exist there alone.
        return 50;
    }

    if (normalized.Contains($"{Path.DirectorySeparatorChar}bin{Path.DirectorySeparatorChar}Debug{Path.DirectorySeparatorChar}net10.0{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase))
    {
        return 10;
    }

    if (normalized.Contains($"{Path.DirectorySeparatorChar}bin{Path.DirectorySeparatorChar}Release{Path.DirectorySeparatorChar}net10.0{Path.DirectorySeparatorChar}", StringComparison.OrdinalIgnoreCase))
    {
        return 20;
    }

    return 100;
}

static bool IsDirectNet10Output(string path)
{
    var directory = Path.GetDirectoryName(path);
    if (directory is null)
    {
        return false;
    }

    var normalized = directory.Replace(Path.AltDirectorySeparatorChar, Path.DirectorySeparatorChar);
    return normalized.EndsWith($"{Path.DirectorySeparatorChar}bin{Path.DirectorySeparatorChar}Debug{Path.DirectorySeparatorChar}net10.0", StringComparison.OrdinalIgnoreCase)
        || normalized.EndsWith($"{Path.DirectorySeparatorChar}bin{Path.DirectorySeparatorChar}Release{Path.DirectorySeparatorChar}net10.0", StringComparison.OrdinalIgnoreCase);
}

static bool HasMetadata(string path)
{
    try
    {
        using var stream = File.OpenRead(path);
        using var reader = new PEReader(stream);
        return reader.HasMetadata;
    }
    catch
    {
        return false;
    }
}

static IReadOnlyList<SnippetDiagnostic> CompileAsScriptSubmission(
    Snippet snippet,
    string text,
    IReadOnlyList<MetadataReference> references,
    CSharpCompilationOptions compilationOptions,
    CSharpParseOptions parseOptions,
    CSharpCompilation? previousSubmission,
    out CSharpCompilation? nextSubmission
)
{
    var tree = CSharpSyntaxTree.ParseText(SourceText.From(text), parseOptions, snippet.SourcePath);
    var compilation = CSharpCompilation.CreateScriptCompilation(
        $"Snippet_{snippet.Index}_Script",
        tree,
        references,
        compilationOptions,
        previousSubmission
    );
    nextSubmission = compilation;
    return ToSnippetDiagnostics(snippet, "script", compilation.GetDiagnostics());
}

static IReadOnlyList<string> ExtractFirstLeadingUsingBlock(IEnumerable<Snippet> snippets)
{
    var usings = new SortedSet<string>(StringComparer.Ordinal);

    foreach (var snippet in snippets.OrderBy(snippet => snippet.Index))
    {
        foreach (var line in File.ReadAllLines(snippet.SnippetPath).Select(line => line.Trim()))
        {
            if (string.IsNullOrWhiteSpace(line) || line.StartsWith("//", StringComparison.Ordinal))
            {
                continue;
            }

            if (!IsUsingDirective(line))
            {
                break;
            }

            if (!line.Contains(" = ", StringComparison.Ordinal))
            {
                usings.Add(line);
            }
        }

        if (usings.Count > 0)
        {
            break;
        }
    }

    return usings.ToArray();
}

static bool IsUsingDirective(string line)
{
    return line.StartsWith("using ", StringComparison.Ordinal)
        && line.EndsWith(';')
        && !line.StartsWith("using var ", StringComparison.Ordinal)
        && !line.StartsWith("using (", StringComparison.Ordinal);
}

static string BuildScriptPrelude(string commonPrelude, IReadOnlyList<string> pageUsingDirectives)
{
    return string.Join(
        Environment.NewLine,
        new[] { commonPrelude }
            .Concat(pageUsingDirectives)
            .Concat(new[] { "string[] args = [];" })
            .Where(line => !string.IsNullOrWhiteSpace(line))
    );
}

static string BuildRegularGlobalUsings(string commonGlobalUsings, IReadOnlyList<string> pageUsingDirectives)
{
    var pageGlobalUsings = pageUsingDirectives.Select(line => $"global {line}");
    return string.Join(
        Environment.NewLine,
        new[] { commonGlobalUsings }.Concat(pageGlobalUsings).Where(line => !string.IsNullOrWhiteSpace(line))
    );
}

static IReadOnlyList<SnippetDiagnostic> CompileAsRegularSnippet(
    Snippet snippet,
    string text,
    IReadOnlyList<MetadataReference> references,
    CSharpCompilationOptions libraryCompilationOptions,
    CSharpCompilationOptions consoleCompilationOptions,
    CSharpParseOptions parseOptions,
    string globalUsings
)
{
    var tree = CSharpSyntaxTree.ParseText(SourceText.From(text), parseOptions, snippet.SourcePath);
    var globalUsingsTree = CSharpSyntaxTree.ParseText(
        SourceText.From(globalUsings),
        parseOptions,
        "__global_usings__.cs"
    );
    var trees = new[] { globalUsingsTree, tree };
    var libraryCompilation = CSharpCompilation.Create(
        $"Snippet_{snippet.Index}_Regular",
        trees,
        references,
        libraryCompilationOptions
    );
    var libraryDiagnostics = ToSnippetDiagnostics(snippet, "regular", libraryCompilation.GetDiagnostics());

    var consoleCompilation = CSharpCompilation.Create(
        $"Snippet_{snippet.Index}_RegularExe",
        trees,
        references,
        consoleCompilationOptions
    );
    var consoleDiagnostics = ToSnippetDiagnostics(snippet, "regular", consoleCompilation.GetDiagnostics());

    return libraryDiagnostics.Count <= consoleDiagnostics.Count ? libraryDiagnostics : consoleDiagnostics;
}

static CSharpCompilation? CreateScriptPrelude(
    string pagePath,
    string prelude,
    IReadOnlyList<MetadataReference> references,
    CSharpCompilationOptions compilationOptions,
    CSharpParseOptions parseOptions
)
{
    if (string.IsNullOrWhiteSpace(prelude))
    {
        return null;
    }

    var tree = CSharpSyntaxTree.ParseText(SourceText.From(prelude), parseOptions, $"{pagePath}.__prelude__.csx");
    return CSharpCompilation.CreateScriptCompilation(
        $"{SanitizeAssemblyName(pagePath)}_Prelude",
        tree,
        references,
        compilationOptions
    );
}

static string SanitizeAssemblyName(string value)
{
    var chars = value.Select(ch => char.IsLetterOrDigit(ch) ? ch : '_').ToArray();
    return new string(chars);
}

static IReadOnlyList<SnippetDiagnostic> ToSnippetDiagnostics(
    Snippet snippet,
    string mode,
    IEnumerable<Diagnostic> diagnostics
)
{
    return diagnostics
        .Where(diagnostic => diagnostic.Severity == DiagnosticSeverity.Error)
        .Where(diagnostic => diagnostic.Location == Location.None || diagnostic.Location.SourceTree?.FilePath == snippet.SourcePath)
        .Select(diagnostic =>
        {
            var line = snippet.SourceLine;
            if (diagnostic.Location != Location.None && diagnostic.Location.IsInSource)
            {
                line += diagnostic.Location.GetLineSpan().StartLinePosition.Line;
            }

            return new SnippetDiagnostic(
                snippet.SourcePath,
                snippet.Index,
                line,
                mode,
                diagnostic.Id,
                diagnostic.GetMessage()
            );
        })
        .ToArray();
}

static IReadOnlyList<SnippetDiagnostic> ChooseDiagnostics(
    IReadOnlyList<SnippetDiagnostic> scriptDiagnostics,
    IReadOnlyList<SnippetDiagnostic> regularDiagnostics
)
{
    return regularDiagnostics.Count < scriptDiagnostics.Count ? regularDiagnostics : scriptDiagnostics;
}

readonly record struct Snippet(string SnippetPath, string SourcePath, int SourceLine, int Index)
{
    public static Snippet FromTsv(string row)
    {
        var parts = row.Split('\t');
        if (parts.Length != 4)
        {
            throw new InvalidDataException($"Invalid snippet metadata row: {row}");
        }

        return new Snippet(parts[0], parts[1], int.Parse(parts[2]), int.Parse(parts[3]));
    }
}

sealed record SnippetDiagnostic(
    string SourcePath,
    int SnippetIndex,
    int Line,
    string Mode,
    string Id,
    string Message
);

sealed record SemanticReport(
    int SnippetCount,
    int PageCount,
    int ReferenceCount,
    int ImportCount,
    int FailedSnippetCount,
    int FailedPageCount,
    IReadOnlyList<SnippetDiagnostic> Diagnostics
);

sealed record ReferenceSet(
    IReadOnlyList<MetadataReference> References,
    int TrustedPlatformAssemblyCount,
    int LocalAssemblyCount
);
CS

DOTNET_PROJECT="$PARSER/SemanticSnippetProbe.csproj"
DOTNET_META="$META"
DOTNET_QAAS_ROOT="$QAAS_ROOT"
DOTNET_REPORT="$REPORT_PATH"
if [ "$USE_WSL_DOTNET" -eq 1 ]; then
  DOTNET_PROJECT=$(wslpath -w "$DOTNET_PROJECT")
  DOTNET_META="$WORK/snippets.win.tsv"
  while IFS=$'\t' read -r snippet source line index; do
    printf '%s\t%s\t%s\t%s\n' "$(wslpath -w "$snippet")" "$source" "$line" "$index"
  done < "$META" > "$DOTNET_META"
  DOTNET_META=$(wslpath -w "$DOTNET_META")
  DOTNET_QAAS_ROOT=$(wslpath -w "$QAAS_ROOT")
  DOTNET_REPORT=$(wslpath -w "$REPORT_PATH")
elif [ "$USE_WINDOWS_DOTNET_PATHS" -eq 1 ]; then
  if [ -d "$QAAS_ROOT" ]; then
    DOTNET_QAAS_ROOT=$(cd "$QAAS_ROOT" && pwd -W)
  fi
fi

"$DOTNET_BIN" run --project "$DOTNET_PROJECT" -- "$DOTNET_META" "$DOTNET_QAAS_ROOT" "$DOTNET_REPORT" || FAIL=1

rm -rf "$WORK"
[ "$FAIL" -eq 0 ] || exit 1
echo "[semantic-csharp] OK"
