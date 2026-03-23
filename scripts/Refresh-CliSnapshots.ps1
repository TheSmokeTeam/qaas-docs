param(
    [string]$DocsRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$RunnerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Runner'),
    [string]$MockerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Mocker')
)

$ErrorActionPreference = 'Stop'

# Refreshes the committed Runner and Mocker CLI snapshot files by executing the live
# Bootstrap.New(...) help paths inside disposable local hosts. The temporary hosts live
# outside the source repositories so QaaS.Runner and QaaS.Mocker do not need docs-only
# exporter code or long-lived docs dependencies.

$toolRoot = Join-Path $DocsRoot 'tools\QaaS.Docs.Generator'
$runnerProject = Join-Path $RunnerRoot 'QaaS.Runner\QaaS.Runner.csproj'
$mockerProject = Join-Path $MockerRoot 'QaaS.Mocker\QaaS.Mocker.csproj'
$runnerSnapshotPath = Join-Path $toolRoot 'Snapshots\runner-cli.json'
$mockerSnapshotPath = Join-Path $toolRoot 'Snapshots\mocker-cli.json'

if (-not (Test-Path $runnerProject)) {
    throw "Runner project not found at $runnerProject"
}

if (-not (Test-Path $mockerProject)) {
    throw "Mocker project not found at $mockerProject"
}

function Invoke-SnapshotHost {
    param(
        [string]$HostDirectory,
        [string]$ProjectReference,
        [string]$ProgramSource,
        [string]$OutputPath
    )

    New-Item -ItemType Directory -Path $HostDirectory -Force | Out-Null

    $projectPath = Join-Path $HostDirectory 'SnapshotHost.csproj'
    $programPath = Join-Path $HostDirectory 'Program.cs'

    @'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net10.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
  </PropertyGroup>
  <ItemGroup>
    <ProjectReference Include="__PROJECT_REFERENCE__" />
  </ItemGroup>
</Project>
'@.Replace('__PROJECT_REFERENCE__', $ProjectReference) | Set-Content -Path $projectPath -Encoding UTF8

    $ProgramSource | Set-Content -Path $programPath -Encoding UTF8

    dotnet run --project $projectPath -c Release -- --output $OutputPath
    if ($LASTEXITCODE -ne 0) {
        throw "Snapshot host failed for $ProjectReference"
    }
}

$runnerProgram = @'
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Text.Json;
using CommandLine;
using QaaS.Runner.Options;

var outputPath = GetOutputPath(args);

var commandTypes = new[]
{
    typeof(RunOptions),
    typeof(ActOptions),
    typeof(AssertOptions),
    typeof(TemplateOptions),
    typeof(ExecuteOptions)
};

var catalog = new
{
    OverviewHelpText = CaptureOutput(() => QaaS.Runner.Bootstrap.New(Array.Empty<string>())),
    Commands = commandTypes.Select(BuildCommand).ToArray()
};

File.WriteAllText(outputPath, JsonSerializer.Serialize(catalog, new JsonSerializerOptions
{
    WriteIndented = true
}) + Environment.NewLine);

static object BuildCommand(Type commandType)
{
    var verb = commandType.GetCustomAttribute<VerbAttribute>() ??
               throw new InvalidOperationException($"Missing VerbAttribute on {commandType.FullName}");

    return new
    {
        Name = verb.Name,
        Description = verb.HelpText ?? string.Empty,
        OptionType = commandType.FullName ?? commandType.Name,
        HelpText = CaptureOutput(() => QaaS.Runner.Bootstrap.New([verb.Name, "--help"])),
        Positionals = DescribeValues(commandType).ToArray(),
        Options = DescribeOptions(commandType).ToArray()
    };
}

static IEnumerable<object> DescribeValues(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<ValueAttribute>();
        if (attribute is null)
        {
            continue;
        }

        yield return new
        {
            Kind = "value",
            PropertyName = property.Name,
            SourceOptionType = property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            ValueType = property.PropertyType.FullName ?? property.PropertyType.Name,
            IsInherited = property.DeclaringType != commandType,
            Required = attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            DefaultValue = FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            ShortName = (string?)null,
            LongName = (string?)null,
            Position = attribute.Index,
            HelpText = attribute.HelpText
        };
    }
}

static IEnumerable<object> DescribeOptions(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<OptionAttribute>();
        if (attribute is null)
        {
            continue;
        }

        yield return new
        {
            Kind = "option",
            PropertyName = property.Name,
            SourceOptionType = property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            ValueType = property.PropertyType.FullName ?? property.PropertyType.Name,
            IsInherited = property.DeclaringType != commandType,
            Required = attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            DefaultValue = FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            ShortName = attribute.ShortName == null ? null : attribute.ShortName.ToString(),
            LongName = attribute.LongName,
            Position = (int?)null,
            HelpText = attribute.HelpText
        };
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

static string CaptureOutput(Func<object?> action)
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

    return writer.ToString().TrimEnd();
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
        System.Collections.IEnumerable enumerable when effectiveValue is not string =>
            enumerable.Cast<object?>().Any()
                ? string.Join(", ", enumerable.Cast<object?>().Select(item => item?.ToString() ?? string.Empty))
                : "[]",
        _ => effectiveValue.ToString()
    };
}

static string GetOutputPath(IReadOnlyList<string> args)
{
    if (args.Count == 2 && string.Equals(args[0], "--output", StringComparison.OrdinalIgnoreCase))
    {
        return Path.GetFullPath(args[1]);
    }

    throw new InvalidOperationException("Usage: --output <path>");
}
'@

$mockerProgram = @'
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Text.Json;
using CommandLine;

var outputPath = GetOutputPath(args);

var commandTypes = new[]
{
    typeof(QaaS.Mocker.Options.RunOptions),
    typeof(QaaS.Mocker.Options.TemplateOptions)
};

var catalog = new
{
    GeneratedAtUtc = DateTimeOffset.UtcNow,
    OverviewHelpText = CaptureOutput(() => QaaS.Mocker.Bootstrap.New(Array.Empty<string>())),
    Commands = commandTypes.Select(BuildCommand).ToArray()
};

File.WriteAllText(outputPath, JsonSerializer.Serialize(catalog, new JsonSerializerOptions
{
    WriteIndented = true
}) + Environment.NewLine);

static object BuildCommand(Type commandType)
{
    var verb = commandType.GetCustomAttribute<VerbAttribute>() ??
               throw new InvalidOperationException($"Missing VerbAttribute on {commandType.FullName}");

    return new
    {
        Name = verb.Name,
        Description = verb.HelpText ?? string.Empty,
        HelpText = CaptureOutput(() => QaaS.Mocker.Bootstrap.New([verb.Name, "--help"])),
        SourceOptionType = commandType.FullName ?? commandType.Name,
        Positionals = DescribeValues(commandType).ToArray(),
        Options = DescribeOptions(commandType).ToArray()
    };
}

static IEnumerable<object> DescribeValues(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<ValueAttribute>();
        if (attribute is null)
        {
            continue;
        }

        yield return new
        {
            Index = attribute.Index,
            PropertyName = property.Name,
            ValueType = ToFriendlyTypeName(property.PropertyType),
            Required = attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            DefaultValue = FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            HelpText = attribute.HelpText ?? string.Empty,
            SourceOptionType = property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            IsInherited = property.DeclaringType != commandType
        };
    }
}

static IEnumerable<object> DescribeOptions(Type commandType)
{
    var instance = Activator.CreateInstance(commandType);
    foreach (var property in GetCommandProperties(commandType))
    {
        var attribute = property.GetCustomAttribute<OptionAttribute>();
        if (attribute is null)
        {
            continue;
        }

        yield return new
        {
            PropertyName = property.Name,
            ShortName = attribute.ShortName == null ? null : attribute.ShortName.ToString(),
            LongName = attribute.LongName ?? string.Empty,
            ValueType = ToFriendlyTypeName(property.PropertyType),
            Required = attribute.Required || property.GetCustomAttribute<RequiredAttribute>() is not null,
            DefaultValue = FormatDefaultValue(attribute.Default, property.GetValue(instance)),
            HelpText = attribute.HelpText ?? string.Empty,
            SourceOptionType = property.DeclaringType?.FullName ?? commandType.FullName ?? commandType.Name,
            IsInherited = property.DeclaringType != commandType
        };
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

static string CaptureOutput(Func<object?> action)
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

    return writer.ToString().TrimEnd();
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
        System.Collections.IEnumerable enumerable when effectiveValue is not string =>
            enumerable.Cast<object?>().Any()
                ? string.Join(", ", enumerable.Cast<object?>().Select(item => item?.ToString() ?? string.Empty))
                : "[]",
        _ => effectiveValue.ToString()
    };
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

    var nullableType = Nullable.GetUnderlyingType(type);
    if (nullableType is not null)
    {
        return $"{ToFriendlyTypeName(nullableType)}?";
    }

    if (type.IsGenericType)
    {
        var genericTypeName = type.Name[..type.Name.IndexOf('`')];
        var genericArguments = string.Join(", ", type.GetGenericArguments().Select(ToFriendlyTypeName));
        return $"{genericTypeName}<{genericArguments}>";
    }

    return type.Name;
}

static string GetOutputPath(IReadOnlyList<string> args)
{
    if (args.Count == 2 && string.Equals(args[0], "--output", StringComparison.OrdinalIgnoreCase))
    {
        return Path.GetFullPath(args[1]);
    }

    throw new InvalidOperationException("Usage: --output <path>");
}
'@

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("qaas-cli-snapshot-refresh-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tempRoot -Force | Out-Null

try {
    Invoke-SnapshotHost `
        -HostDirectory (Join-Path $tempRoot 'runner-host') `
        -ProjectReference $runnerProject `
        -ProgramSource $runnerProgram `
        -OutputPath $runnerSnapshotPath

    Invoke-SnapshotHost `
        -HostDirectory (Join-Path $tempRoot 'mocker-host') `
        -ProjectReference $mockerProject `
        -ProgramSource $mockerProgram `
        -OutputPath $mockerSnapshotPath
}
finally {
    if (Test-Path $tempRoot) {
        Remove-Item -Path $tempRoot -Recurse -Force
    }
}
