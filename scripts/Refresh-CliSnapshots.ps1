param(
    [string]$DocsRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$RunnerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Runner'),
    [string]$MockerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Mocker'),
    [string]$FrameworkRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Framework')
)

$ErrorActionPreference = 'Stop'

# Refreshes the committed Runner and Mocker CLI snapshot files by executing the live
# help paths inside disposable local hosts.
#
# The snapshot hosts reference the local framework source as well so inherited flags
# from QaaS.Framework are captured from the current workspace rather than an older
# package version.

$toolRoot = Join-Path $DocsRoot 'tools\QaaS.Docs.Generator'
$runnerProject = Join-Path $RunnerRoot 'QaaS.Runner\QaaS.Runner.csproj'
$runnerInfrastructureProject = Join-Path $RunnerRoot 'QaaS.Runner.Infrastructure\QaaS.Runner.Infrastructure.csproj'
$mockerProject = Join-Path $MockerRoot 'QaaS.Mocker\QaaS.Mocker.csproj'
$frameworkSolution = Join-Path $FrameworkRoot 'QaaS.Framework.sln'
$runnerSnapshotPath = Join-Path $toolRoot 'Snapshots\runner-cli.json'
$mockerSnapshotPath = Join-Path $toolRoot 'Snapshots\mocker-cli.json'

if (-not (Test-Path $runnerProject)) {
    throw "Runner project not found at $runnerProject"
}

if (-not (Test-Path $mockerProject)) {
    throw "Mocker project not found at $mockerProject"
}

if (-not (Test-Path $runnerInfrastructureProject)) {
    throw "Runner infrastructure project not found at $runnerInfrastructureProject"
}

if (-not (Test-Path $frameworkSolution)) {
    throw "Framework solution not found at $frameworkSolution"
}

function Get-PackageReferenceVersion {
    param(
        [string]$ProjectPath,
        [string]$PackageId
    )

    [xml]$project = Get-Content -Path $ProjectPath
    $packageReference = @($project.Project.ItemGroup.PackageReference) |
        Where-Object { $_.Include -eq $PackageId } |
        Select-Object -First 1

    return $packageReference.Version
}

$mockerFrameworkVersion = Get-PackageReferenceVersion -ProjectPath $mockerProject -PackageId 'QaaS.Framework.Executions'
$runnerFrameworkVersion = Get-PackageReferenceVersion -ProjectPath $runnerInfrastructureProject -PackageId 'QaaS.Framework.Executions'

if ([string]::IsNullOrWhiteSpace($mockerFrameworkVersion)) {
    throw "Could not resolve QaaS.Framework.Executions package version from $mockerProject"
}

if ([string]::IsNullOrWhiteSpace($runnerFrameworkVersion)) {
    throw "Could not resolve QaaS.Framework.Executions package version from $runnerInfrastructureProject"
}

$frameworkVersions = @($runnerFrameworkVersion, $mockerFrameworkVersion) |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
    Select-Object -Unique

function Invoke-SnapshotHost {
    param(
        [string]$HostDirectory,
        [string[]]$ProjectReferences,
        [string]$RestoreConfigFile,
        [string]$RestorePackagesPath,
        [string]$ProgramSource,
        [string]$OutputPath
    )

    New-Item -ItemType Directory -Path $HostDirectory -Force | Out-Null

    $projectPath = Join-Path $HostDirectory 'SnapshotHost.csproj'
    $programPath = Join-Path $HostDirectory 'Program.cs'
    $projectReferenceXml = ($ProjectReferences | ForEach-Object {
            "    <ProjectReference Include=`"$_`" />"
        }) -join [Environment]::NewLine

    @"
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net10.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
    <RestorePackagesPath>$RestorePackagesPath</RestorePackagesPath>
  </PropertyGroup>
  <ItemGroup>
$projectReferenceXml
  </ItemGroup>
</Project>
"@ | Set-Content -Path $projectPath -Encoding UTF8

    $ProgramSource | Set-Content -Path $programPath -Encoding UTF8

    dotnet restore $projectPath --configfile $RestoreConfigFile --packages $RestorePackagesPath
    if ($LASTEXITCODE -ne 0) {
        throw "Snapshot host restore failed for $($ProjectReferences -join ', ')"
    }

    dotnet run --project $projectPath -c Release --no-restore -- --output $OutputPath
    if ($LASTEXITCODE -ne 0) {
        throw "Snapshot host failed for $($ProjectReferences -join ', ')"
    }
}

$runnerProgram = @'
using System.Collections;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Text.Json;
using CommandLine;
using QaaS.Runner.Options;

_ = typeof(QaaS.Framework.Executions.Options.LoggerOptions);

var outputPath = GetOutputPath(args);

var commandTypes = new[]
{
    typeof(RunOptions),
    typeof(ActOptions),
    typeof(AssertOptions),
    typeof(TemplateOptions),
    typeof(ExecuteOptions)
};

var commands = commandTypes.Select(BuildCommand).ToArray();
var overviewHelpText = CaptureOutput(() => QaaS.Runner.Bootstrap.New(Array.Empty<string>()), "Runner overview");
ValidateOverviewHelpText(overviewHelpText, commandTypes);

var catalog = new RunnerCliCatalog(
    overviewHelpText,
    commands);

File.WriteAllText(
    outputPath,
    JsonSerializer.Serialize(catalog, new JsonSerializerOptions
    {
        WriteIndented = true
    }) + Environment.NewLine);

RunnerCliCommand BuildCommand(Type commandType)
{
    var verb = commandType.GetCustomAttribute<VerbAttribute>() ??
               throw new InvalidOperationException($"Missing VerbAttribute on {commandType.FullName}");

    var positionals = DescribeValues(commandType).ToArray();
    var options = DescribeOptions(commandType).ToArray();
    var helpText = CaptureOutput(() => QaaS.Runner.Bootstrap.New([verb.Name, "--help"]), $"{verb.Name} command");

    ValidateCommandHelpText(helpText, verb.Name, positionals, options);

    return new RunnerCliCommand(
        verb.Name,
        NormalizeInlineHelpText(verb.HelpText, $"{verb.Name} description") ?? string.Empty,
        commandType.FullName ?? commandType.Name,
        helpText,
        positionals,
        options);
}

IEnumerable<RunnerCliArgument> DescribeValues(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<ValueAttribute>();
        if (attribute is null)
        {
            continue;
        }

        var valueType = ToFriendlyTypeName(property.PropertyType);
        ValidateFriendlyTypeName(valueType, $"{commandType.FullName}.{property.Name}");

        yield return new RunnerCliArgument(
            "value",
            property.Name,
            property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            valueType,
            property.DeclaringType != commandType,
            attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            null,
            null,
            attribute.Index,
            NormalizeInlineHelpText(attribute.HelpText, $"{commandType.FullName}.{property.Name}"));
    }
}

IEnumerable<RunnerCliArgument> DescribeOptions(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<OptionAttribute>();
        if (attribute is null)
        {
            continue;
        }

        var valueType = ToFriendlyTypeName(property.PropertyType);
        ValidateFriendlyTypeName(valueType, $"{commandType.FullName}.{property.Name}");

        yield return new RunnerCliArgument(
            "option",
            property.Name,
            property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            valueType,
            property.DeclaringType != commandType,
            attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            GetShortName(attribute),
            attribute.LongName,
            null,
            NormalizeInlineHelpText(attribute.HelpText, $"{commandType.FullName}.{property.Name}"));
    }
}

static IEnumerable<PropertyInfo> GetCommandProperties(Type commandType)
{
    var stack = new Stack<Type>();
    for (var current = commandType; current is not null && current != typeof(object); current = current.BaseType)
    {
        stack.Push(current);
    }

    while (stack.Count != 0)
    {
        var type = stack.Pop();
        foreach (var property in type.GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.DeclaredOnly))
        {
            if (property.GetIndexParameters().Length == 0)
            {
                yield return property;
            }
        }
    }
}

static string CaptureOutput(Func<object?> action, string context)
{
    var original = Console.Out;
    using var writer = new StringWriter();
    Console.SetOut(writer);
    try
    {
        var result = action();
        if (result is IDisposable disposable)
        {
            disposable.Dispose();
        }
    }
    finally
    {
        Console.SetOut(original);
    }

    var normalized = NormalizeCapturedHelpText(writer.ToString());
    ValidateCapturedHelpText(normalized, context);
    return normalized;
}

static string NormalizeCapturedHelpText(string helpText)
{
    return string.Join(
        Environment.NewLine,
        TrimBlankLineList(RemoveHostBannerLines(helpText).ToList())
            .Select(line => line.TrimEnd()));
}

static string? NormalizeInlineHelpText(string? helpText, string context)
{
    if (string.IsNullOrWhiteSpace(helpText))
    {
        return null;
    }

    var normalized = string.Join(
        Environment.NewLine,
        TrimBlankLineList(SplitLines(helpText))
            .Select(line => line.TrimEnd()));

    ValidateInlineHelpText(normalized, context);
    return normalized;
}

static IEnumerable<string> RemoveHostBannerLines(string helpText)
{
    var rawLines = helpText.Replace("\r\n", "\n", StringComparison.Ordinal).Split('\n');
    for (var index = 0; index < rawLines.Length; index++)
    {
        var currentLine = rawLines[index];
        if ((currentLine.Contains("SnapshotHost", StringComparison.Ordinal) ||
             currentLine.Contains("CliExport", StringComparison.Ordinal)) &&
            index + 1 < rawLines.Length &&
            rawLines[index + 1].TrimStart().StartsWith("Copyright", StringComparison.OrdinalIgnoreCase))
        {
            index++;
            continue;
        }

        yield return currentLine;
    }
}

static List<string> SplitLines(string helpText)
{
    return helpText.Replace("\r\n", "\n", StringComparison.Ordinal).Split('\n').ToList();
}

static IReadOnlyList<string> TrimBlankLineList(List<string> lines)
{
    while (lines.Count != 0 && string.IsNullOrWhiteSpace(lines[0]))
    {
        lines.RemoveAt(0);
    }

    while (lines.Count != 0 && string.IsNullOrWhiteSpace(lines[^1]))
    {
        lines.RemoveAt(lines.Count - 1);
    }

    return lines;
}

static string? FormatDefaultValue(object? attributeDefaultValue, object? instanceValue)
{
    var effectiveValue = attributeDefaultValue ?? instanceValue;
    return effectiveValue switch
    {
        null => null,
        string text => text,
        bool booleanValue => booleanValue ? "True" : "False",
        IEnumerable<string> strings => strings.Any() ? string.Join(", ", strings) : "[]",
        IEnumerable enumerable when effectiveValue is not string => FormatEnumerableDefaultValue(enumerable),
        _ => effectiveValue.ToString()
    };
}

static string FormatEnumerableDefaultValue(IEnumerable enumerable)
{
    var values = enumerable.Cast<object?>().Select(item => item?.ToString() ?? string.Empty).ToArray();
    return values.Length == 0 ? "[]" : string.Join(", ", values);
}

static string? GetShortName(OptionAttribute attribute)
{
    return string.IsNullOrWhiteSpace(attribute.ShortName) ? null : attribute.ShortName;
}

static string ToFriendlyTypeName(Type type)
{
    if (type == typeof(string))
    {
        return "string";
    }

    if (type == typeof(bool))
    {
        return "bool";
    }

    if (type == typeof(byte))
    {
        return "byte";
    }

    if (type == typeof(short))
    {
        return "short";
    }

    if (type == typeof(int))
    {
        return "int";
    }

    if (type == typeof(long))
    {
        return "long";
    }

    if (type == typeof(float))
    {
        return "float";
    }

    if (type == typeof(double))
    {
        return "double";
    }

    if (type == typeof(decimal))
    {
        return "decimal";
    }

    if (type == typeof(object))
    {
        return "object";
    }

    var nullableType = Nullable.GetUnderlyingType(type);
    if (nullableType is not null)
    {
        return $"{ToFriendlyTypeName(nullableType)}?";
    }

    if (type.IsArray)
    {
        return $"{ToFriendlyTypeName(type.GetElementType()!)}[]";
    }

    if (type.IsGenericType)
    {
        var genericTypeName = type.Name;
        var tickIndex = genericTypeName.IndexOf('`');
        if (tickIndex >= 0)
        {
            genericTypeName = genericTypeName[..tickIndex];
        }

        var genericArguments = string.Join(", ", type.GetGenericArguments().Select(ToFriendlyTypeName));
        return $"{genericTypeName}<{genericArguments}>";
    }

    return type.Name;
}

static void ValidateOverviewHelpText(string helpText, IEnumerable<Type> commandTypes)
{
    foreach (var commandType in commandTypes)
    {
        var verb = commandType.GetCustomAttribute<VerbAttribute>();
        if (verb is null)
        {
            continue;
        }

        if (!helpText.Contains(verb.Name, StringComparison.Ordinal))
        {
            throw new InvalidOperationException($"Overview help text does not mention the `{verb.Name}` command.");
        }
    }
}

static void ValidateCommandHelpText(
    string helpText,
    string commandName,
    IEnumerable<RunnerCliArgument> positionals,
    IEnumerable<RunnerCliArgument> options)
{
    foreach (var positional in positionals)
    {
        if (positional.Position is null)
        {
            continue;
        }

        if (!helpText.Contains($"value pos. {positional.Position.Value}", StringComparison.Ordinal))
        {
            throw new InvalidOperationException(
                $"Help text for `{commandName}` is missing positional argument `{positional.PropertyName}`.");
        }
    }

    foreach (var option in options)
    {
        if (string.IsNullOrWhiteSpace(option.LongName))
        {
            throw new InvalidOperationException($"Option `{commandName}.{option.PropertyName}` is missing a long name.");
        }

        if (!helpText.Contains($"--{option.LongName}", StringComparison.Ordinal))
        {
            throw new InvalidOperationException(
                $"Help text for `{commandName}` is missing the `--{option.LongName}` flag.");
        }
    }
}

static void ValidateCapturedHelpText(string helpText, string context)
{
    if (string.IsNullOrWhiteSpace(helpText))
    {
        throw new InvalidOperationException($"{context} help text is empty.");
    }

    if (helpText.Contains("SnapshotHost", StringComparison.Ordinal) ||
        helpText.Contains("CliExport", StringComparison.Ordinal))
    {
        throw new InvalidOperationException($"{context} help text still contains host banner content.");
    }

    if (helpText != helpText.Trim())
    {
        throw new InvalidOperationException($"{context} help text contains leading or trailing whitespace.");
    }
}

static void ValidateInlineHelpText(string helpText, string context)
{
    if (helpText != helpText.Trim())
    {
        throw new InvalidOperationException($"{context} help text contains leading or trailing whitespace.");
    }

    if (helpText.EndsWith("\"", StringComparison.Ordinal))
    {
        throw new InvalidOperationException($"{context} help text ends with a stray quote.");
    }

    if (helpText.Contains("SnapshotHost", StringComparison.Ordinal) ||
        helpText.Contains("CliExport", StringComparison.Ordinal))
    {
        throw new InvalidOperationException($"{context} help text contains host banner content.");
    }
}

static void ValidateFriendlyTypeName(string typeName, string context)
{
    if (string.IsNullOrWhiteSpace(typeName))
    {
        throw new InvalidOperationException($"{context} type name is empty.");
    }

    var disallowedFragments = new[]
    {
        "Version=",
        "Culture=",
        "PublicKeyToken=",
        "[[",
        "]]",
        "`"
    };

    if (disallowedFragments.Any(fragment => typeName.Contains(fragment, StringComparison.Ordinal)))
    {
        throw new InvalidOperationException($"{context} type name is not human-readable: `{typeName}`.");
    }
}

static string GetOutputPath(IReadOnlyList<string> args)
{
    if (args.Count == 2 && string.Equals(args[0], "--output", StringComparison.OrdinalIgnoreCase))
    {
        return Path.GetFullPath(args[1]);
    }

    throw new InvalidOperationException("Usage: --output <path>");
}

internal sealed record RunnerCliCatalog(
    string OverviewHelpText,
    IReadOnlyList<RunnerCliCommand> Commands);

internal sealed record RunnerCliCommand(
    string Name,
    string Description,
    string OptionType,
    string HelpText,
    IReadOnlyList<RunnerCliArgument> Positionals,
    IReadOnlyList<RunnerCliArgument> Options);

internal sealed record RunnerCliArgument(
    string Kind,
    string PropertyName,
    string SourceOptionType,
    string ValueType,
    bool IsInherited,
    bool Required,
    string? DefaultValue,
    string? ShortName,
    string? LongName,
    int? Position,
    string? HelpText);
'@

$mockerProgram = @'
using System.Collections;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Text.Json;
using CommandLine;
using QaaS.Mocker.Options;

_ = typeof(QaaS.Framework.Executions.Options.LoggerOptions);

var outputPath = GetOutputPath(args);

var commandTypes = new[]
{
    typeof(RunOptions),
    typeof(TemplateOptions)
};

var commands = commandTypes.Select(BuildCommand).ToArray();
var overviewHelpText = CaptureOutput(() => QaaS.Mocker.Bootstrap.New(Array.Empty<string>()), "Mocker overview");
ValidateOverviewHelpText(overviewHelpText, commandTypes);

var catalog = new MockerCliCatalog(
    DateTimeOffset.UtcNow,
    overviewHelpText,
    commands);

File.WriteAllText(
    outputPath,
    JsonSerializer.Serialize(catalog, new JsonSerializerOptions
    {
        WriteIndented = true
    }) + Environment.NewLine);

MockerCliCommand BuildCommand(Type commandType)
{
    var verb = commandType.GetCustomAttribute<VerbAttribute>() ??
               throw new InvalidOperationException($"Missing VerbAttribute on {commandType.FullName}");

    var positionals = DescribeValues(commandType).ToArray();
    var options = DescribeOptions(commandType).ToArray();
    var helpText = CaptureOutput(() => QaaS.Mocker.Bootstrap.New([verb.Name, "--help"]), $"{verb.Name} command");

    ValidateCommandHelpText(helpText, verb.Name, positionals, options);

    return new MockerCliCommand(
        verb.Name,
        NormalizeInlineHelpText(verb.HelpText, $"{verb.Name} description") ?? string.Empty,
        helpText,
        commandType.FullName ?? commandType.Name,
        positionals,
        options);
}

IEnumerable<MockerCliValue> DescribeValues(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<ValueAttribute>();
        if (attribute is null)
        {
            continue;
        }

        var valueType = ToFriendlyTypeName(property.PropertyType);
        ValidateFriendlyTypeName(valueType, $"{commandType.FullName}.{property.Name}");

        yield return new MockerCliValue(
            attribute.Index,
            property.Name,
            valueType,
            attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            NormalizeInlineHelpText(attribute.HelpText, $"{commandType.FullName}.{property.Name}") ?? string.Empty,
            property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            property.DeclaringType != commandType);
    }
}

IEnumerable<MockerCliOption> DescribeOptions(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<OptionAttribute>();
        if (attribute is null)
        {
            continue;
        }

        var valueType = ToFriendlyTypeName(property.PropertyType);
        ValidateFriendlyTypeName(valueType, $"{commandType.FullName}.{property.Name}");

        yield return new MockerCliOption(
            property.Name,
            GetShortName(attribute),
            attribute.LongName ?? string.Empty,
            valueType,
            attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            NormalizeInlineHelpText(attribute.HelpText, $"{commandType.FullName}.{property.Name}") ?? string.Empty,
            property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            property.DeclaringType != commandType);
    }
}

static IEnumerable<PropertyInfo> GetCommandProperties(Type commandType)
{
    var stack = new Stack<Type>();
    for (var current = commandType; current is not null && current != typeof(object); current = current.BaseType)
    {
        stack.Push(current);
    }

    while (stack.Count != 0)
    {
        var type = stack.Pop();
        foreach (var property in type.GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.DeclaredOnly))
        {
            if (property.GetIndexParameters().Length == 0)
            {
                yield return property;
            }
        }
    }
}

static string CaptureOutput(Func<object?> action, string context)
{
    var original = Console.Out;
    using var writer = new StringWriter();
    Console.SetOut(writer);
    try
    {
        var result = action();
        if (result is IDisposable disposable)
        {
            disposable.Dispose();
        }
    }
    finally
    {
        Console.SetOut(original);
    }

    var normalized = NormalizeCapturedHelpText(writer.ToString());
    ValidateCapturedHelpText(normalized, context);
    return normalized;
}

static string NormalizeCapturedHelpText(string helpText)
{
    return string.Join(
        Environment.NewLine,
        TrimBlankLineList(RemoveHostBannerLines(helpText).ToList())
            .Select(line => line.TrimEnd()));
}

static string? NormalizeInlineHelpText(string? helpText, string context)
{
    if (string.IsNullOrWhiteSpace(helpText))
    {
        return null;
    }

    var normalized = string.Join(
        Environment.NewLine,
        TrimBlankLineList(SplitLines(helpText))
            .Select(line => line.TrimEnd()));

    ValidateInlineHelpText(normalized, context);
    return normalized;
}

static IEnumerable<string> RemoveHostBannerLines(string helpText)
{
    var rawLines = helpText.Replace("\r\n", "\n", StringComparison.Ordinal).Split('\n');
    for (var index = 0; index < rawLines.Length; index++)
    {
        var currentLine = rawLines[index];
        if ((currentLine.Contains("SnapshotHost", StringComparison.Ordinal) ||
             currentLine.Contains("CliExport", StringComparison.Ordinal)) &&
            index + 1 < rawLines.Length &&
            rawLines[index + 1].TrimStart().StartsWith("Copyright", StringComparison.OrdinalIgnoreCase))
        {
            index++;
            continue;
        }

        yield return currentLine;
    }
}

static List<string> SplitLines(string helpText)
{
    return helpText.Replace("\r\n", "\n", StringComparison.Ordinal).Split('\n').ToList();
}

static IReadOnlyList<string> TrimBlankLineList(List<string> lines)
{
    while (lines.Count != 0 && string.IsNullOrWhiteSpace(lines[0]))
    {
        lines.RemoveAt(0);
    }

    while (lines.Count != 0 && string.IsNullOrWhiteSpace(lines[^1]))
    {
        lines.RemoveAt(lines.Count - 1);
    }

    return lines;
}

static string? FormatDefaultValue(object? attributeDefaultValue, object? instanceValue)
{
    var effectiveValue = attributeDefaultValue ?? instanceValue;
    return effectiveValue switch
    {
        null => null,
        string text => text,
        bool booleanValue => booleanValue ? "True" : "False",
        IEnumerable<string> strings => strings.Any() ? string.Join(", ", strings) : "[]",
        IEnumerable enumerable when effectiveValue is not string => FormatEnumerableDefaultValue(enumerable),
        _ => effectiveValue.ToString()
    };
}

static string FormatEnumerableDefaultValue(IEnumerable enumerable)
{
    var values = enumerable.Cast<object?>().Select(item => item?.ToString() ?? string.Empty).ToArray();
    return values.Length == 0 ? "[]" : string.Join(", ", values);
}

static string? GetShortName(OptionAttribute attribute)
{
    return string.IsNullOrWhiteSpace(attribute.ShortName) ? null : attribute.ShortName;
}

static string ToFriendlyTypeName(Type type)
{
    if (type == typeof(string))
    {
        return "string";
    }

    if (type == typeof(bool))
    {
        return "bool";
    }

    if (type == typeof(byte))
    {
        return "byte";
    }

    if (type == typeof(short))
    {
        return "short";
    }

    if (type == typeof(int))
    {
        return "int";
    }

    if (type == typeof(long))
    {
        return "long";
    }

    if (type == typeof(float))
    {
        return "float";
    }

    if (type == typeof(double))
    {
        return "double";
    }

    if (type == typeof(decimal))
    {
        return "decimal";
    }

    if (type == typeof(object))
    {
        return "object";
    }

    var nullableType = Nullable.GetUnderlyingType(type);
    if (nullableType is not null)
    {
        return $"{ToFriendlyTypeName(nullableType)}?";
    }

    if (type.IsArray)
    {
        return $"{ToFriendlyTypeName(type.GetElementType()!)}[]";
    }

    if (type.IsGenericType)
    {
        var genericTypeName = type.Name;
        var tickIndex = genericTypeName.IndexOf('`');
        if (tickIndex >= 0)
        {
            genericTypeName = genericTypeName[..tickIndex];
        }

        var genericArguments = string.Join(", ", type.GetGenericArguments().Select(ToFriendlyTypeName));
        return $"{genericTypeName}<{genericArguments}>";
    }

    return type.Name;
}

static void ValidateOverviewHelpText(string helpText, IEnumerable<Type> commandTypes)
{
    foreach (var commandType in commandTypes)
    {
        var verb = commandType.GetCustomAttribute<VerbAttribute>();
        if (verb is null)
        {
            continue;
        }

        if (!helpText.Contains(verb.Name, StringComparison.Ordinal))
        {
            throw new InvalidOperationException($"Overview help text does not mention the `{verb.Name}` command.");
        }
    }
}

static void ValidateCommandHelpText(
    string helpText,
    string commandName,
    IEnumerable<MockerCliValue> positionals,
    IEnumerable<MockerCliOption> options)
{
    foreach (var positional in positionals)
    {
        if (!helpText.Contains($"value pos. {positional.Index}", StringComparison.Ordinal))
        {
            throw new InvalidOperationException(
                $"Help text for `{commandName}` is missing positional argument `{positional.PropertyName}`.");
        }
    }

    foreach (var option in options)
    {
        if (string.IsNullOrWhiteSpace(option.LongName))
        {
            throw new InvalidOperationException($"Option `{commandName}.{option.PropertyName}` is missing a long name.");
        }

        if (!helpText.Contains($"--{option.LongName}", StringComparison.Ordinal))
        {
            throw new InvalidOperationException(
                $"Help text for `{commandName}` is missing the `--{option.LongName}` flag.");
        }
    }
}

static void ValidateCapturedHelpText(string helpText, string context)
{
    if (string.IsNullOrWhiteSpace(helpText))
    {
        throw new InvalidOperationException($"{context} help text is empty.");
    }

    if (helpText.Contains("SnapshotHost", StringComparison.Ordinal) ||
        helpText.Contains("CliExport", StringComparison.Ordinal))
    {
        throw new InvalidOperationException($"{context} help text still contains host banner content.");
    }

    if (helpText != helpText.Trim())
    {
        throw new InvalidOperationException($"{context} help text contains leading or trailing whitespace.");
    }
}

static void ValidateInlineHelpText(string helpText, string context)
{
    if (helpText != helpText.Trim())
    {
        throw new InvalidOperationException($"{context} help text contains leading or trailing whitespace.");
    }

    if (helpText.EndsWith("\"", StringComparison.Ordinal))
    {
        throw new InvalidOperationException($"{context} help text ends with a stray quote.");
    }

    if (helpText.Contains("SnapshotHost", StringComparison.Ordinal) ||
        helpText.Contains("CliExport", StringComparison.Ordinal))
    {
        throw new InvalidOperationException($"{context} help text contains host banner content.");
    }
}

static void ValidateFriendlyTypeName(string typeName, string context)
{
    if (string.IsNullOrWhiteSpace(typeName))
    {
        throw new InvalidOperationException($"{context} type name is empty.");
    }

    var disallowedFragments = new[]
    {
        "Version=",
        "Culture=",
        "PublicKeyToken=",
        "[[",
        "]]",
        "`"
    };

    if (disallowedFragments.Any(fragment => typeName.Contains(fragment, StringComparison.Ordinal)))
    {
        throw new InvalidOperationException($"{context} type name is not human-readable: `{typeName}`.");
    }
}

static string GetOutputPath(IReadOnlyList<string> args)
{
    if (args.Count == 2 && string.Equals(args[0], "--output", StringComparison.OrdinalIgnoreCase))
    {
        return Path.GetFullPath(args[1]);
    }

    throw new InvalidOperationException("Usage: --output <path>");
}

internal sealed record MockerCliCatalog(
    DateTimeOffset GeneratedAtUtc,
    string OverviewHelpText,
    IReadOnlyList<MockerCliCommand> Commands);

internal sealed record MockerCliCommand(
    string Name,
    string Description,
    string HelpText,
    string SourceOptionType,
    IReadOnlyList<MockerCliValue> Positionals,
    IReadOnlyList<MockerCliOption> Options);

internal sealed record MockerCliValue(
    int Index,
    string PropertyName,
    string ValueType,
    bool Required,
    string? DefaultValue,
    string HelpText,
    string SourceOptionType,
    bool IsInherited);

internal sealed record MockerCliOption(
    string PropertyName,
    string? ShortName,
    string LongName,
    string ValueType,
    bool Required,
    string? DefaultValue,
    string HelpText,
    string SourceOptionType,
    bool IsInherited);
'@

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("qaas-cli-snapshot-refresh-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tempRoot -Force | Out-Null

try {
    $frameworkFeedRoot = Join-Path $tempRoot 'framework-feed'
    $restorePackagesRoot = Join-Path $tempRoot 'packages'
    $restoreConfigPath = Join-Path $tempRoot 'NuGet.Config'
    New-Item -ItemType Directory -Path $frameworkFeedRoot -Force | Out-Null
    New-Item -ItemType Directory -Path $restorePackagesRoot -Force | Out-Null

    @"
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="framework-feed" value="$frameworkFeedRoot" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
  </packageSources>
</configuration>
"@ | Set-Content -Path $restoreConfigPath -Encoding UTF8

    foreach ($frameworkVersion in $frameworkVersions) {
        dotnet pack $frameworkSolution `
            -c Release `
            -o $frameworkFeedRoot `
            -p:PackageVersion=$frameworkVersion `
            -p:Version=$frameworkVersion
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to pack QaaS.Framework into $frameworkFeedRoot for version $frameworkVersion"
        }
    }

    Invoke-SnapshotHost `
        -HostDirectory (Join-Path $tempRoot 'runner-host') `
        -ProjectReferences @($runnerProject) `
        -RestoreConfigFile $restoreConfigPath `
        -RestorePackagesPath $restorePackagesRoot `
        -ProgramSource $runnerProgram `
        -OutputPath $runnerSnapshotPath

    Invoke-SnapshotHost `
        -HostDirectory (Join-Path $tempRoot 'mocker-host') `
        -ProjectReferences @($mockerProject) `
        -RestoreConfigFile $restoreConfigPath `
        -RestorePackagesPath $restorePackagesRoot `
        -ProgramSource $mockerProgram `
        -OutputPath $mockerSnapshotPath
}
finally {
    if (Test-Path $tempRoot) {
        Remove-Item -Path $tempRoot -Recurse -Force
    }
}
