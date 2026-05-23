#!/usr/bin/env bash
# Extract every ```csharp fenced block from docs/ and validate C# syntax with
# Roslyn. Snippets that need a project context are skipped when the marker
# <!-- skip-compile --> appears directly above the fence.
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3}"
DOTNET_BIN="${DOTNET_BIN:-dotnet}"
FAIL=0

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
if [[ "$DOTNET_BIN" == *.exe ]] && command -v wslpath >/dev/null 2>&1; then
  WORK="$PWD/.tmp-csharp-snippets-$$"
  USE_WSL_DOTNET=1
elif [[ "$DOTNET_BIN" == *.exe ]] && pwd -W >/dev/null 2>&1; then
  WORK="$(pwd -W)/.tmp-csharp-snippets-$$"
else
  WORK=$(mktemp -d)
fi
SNIPPETS="$WORK/snippets"
META="$WORK/snippets.tsv"
PARSER="$WORK/parser"

mkdir -p "$SNIPPETS" "$PARSER"

"$PYTHON_BIN" - "$SNIPPETS" "$META" <<'PY'
import pathlib
import re
import sys

snippets_dir = pathlib.Path(sys.argv[1])
meta_path = pathlib.Path(sys.argv[2])
docs = pathlib.Path("docs")
count = 0

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
        snippet_path = snippets_dir / f"snippet_{count}.csx"
        snippet_path.write_text(snippet + "\n", encoding="utf-8")
        line = text[:match.start()].count("\n") + 1
        with meta_path.open("a", encoding="utf-8") as meta:
            meta.write(f"{snippet_path.as_posix()}\t{source.as_posix()}\t{line}\n")
        count += 1

print(f"[compile-csharp] extracted {count} snippets")
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

cat > "$PARSER/SnippetParser.csproj" <<XML
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
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;

if (args.Length != 1)
{
    Console.Error.WriteLine("Usage: SnippetParser <snippets.tsv>");
    return 2;
}

var failed = false;
var scriptOptions = CSharpParseOptions.Default
    .WithKind(SourceCodeKind.Script)
    .WithLanguageVersion(LanguageVersion.Preview);
var regularOptions = CSharpParseOptions.Default
    .WithKind(SourceCodeKind.Regular)
    .WithLanguageVersion(LanguageVersion.Preview);

foreach (var row in File.ReadLines(args[0]))
{
    var parts = row.Split('\t');
    if (parts.Length != 3)
    {
        continue;
    }

    var snippetPath = parts[0];
    var sourcePath = parts[1];
    var sourceLine = int.Parse(parts[2]);
    var text = File.ReadAllText(snippetPath);
    var scriptTree = CSharpSyntaxTree.ParseText(text, scriptOptions);
    var scriptErrors = scriptTree.GetDiagnostics()
        .Where(diagnostic => diagnostic.Severity == DiagnosticSeverity.Error)
        .ToArray();
    if (scriptErrors.Length == 0)
    {
        continue;
    }

    var regularTree = CSharpSyntaxTree.ParseText(text, regularOptions);
    var regularErrors = regularTree.GetDiagnostics()
        .Where(diagnostic => diagnostic.Severity == DiagnosticSeverity.Error)
        .ToArray();
    if (regularErrors.Length == 0)
    {
        continue;
    }

    foreach (var error in scriptErrors)
    {
        var position = error.Location.GetLineSpan().StartLinePosition;
        var line = sourceLine + position.Line + 1;
        Console.WriteLine($"::error file={sourcePath},line={line}::{error.GetMessage()}");
        failed = true;
    }
}

return failed ? 1 : 0;
CS

DOTNET_PROJECT="$PARSER/SnippetParser.csproj"
DOTNET_META="$META"
if [ "$USE_WSL_DOTNET" -eq 1 ]; then
  DOTNET_PROJECT=$(wslpath -w "$DOTNET_PROJECT")
  DOTNET_META="$WORK/snippets.win.tsv"
  while IFS=$'\t' read -r snippet source line; do
    printf '%s\t%s\t%s\n' "$(wslpath -w "$snippet")" "$source" "$line"
  done < "$META" > "$DOTNET_META"
  DOTNET_META=$(wslpath -w "$DOTNET_META")
fi

"$DOTNET_BIN" run --project "$DOTNET_PROJECT" -- "$DOTNET_META" || FAIL=1

rm -rf "$WORK"
[ "$FAIL" -eq 0 ] || exit 1
echo "[compile-csharp] OK"
