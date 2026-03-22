using System.Text.Json;

namespace QaaS.Docs.Generator.Cli;

internal sealed record RunnerCliCatalog(
    string OverviewHelpText,
    IReadOnlyList<RunnerCliCommand> Commands)
{
    public static async Task<RunnerCliCatalog> LoadAsync(string path)
    {
        await using var stream = File.OpenRead(path);
        var catalog = await JsonSerializer.DeserializeAsync<RunnerCliCatalog>(stream, JsonDefaults.Options);
        return catalog ?? throw new InvalidOperationException($"Could not deserialize Runner CLI catalog from {path}.");
    }
}

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

internal sealed record MockerCliCatalog(
    DateTimeOffset GeneratedAtUtc,
    string OverviewHelpText,
    IReadOnlyList<MockerCliCommand> Commands)
{
    public static async Task<MockerCliCatalog> LoadAsync(string path)
    {
        await using var stream = File.OpenRead(path);
        var catalog = await JsonSerializer.DeserializeAsync<MockerCliCatalog>(stream, JsonDefaults.Options);
        return catalog ?? throw new InvalidOperationException($"Could not deserialize Mocker CLI catalog from {path}.");
    }
}

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

internal static class JsonDefaults
{
    public static readonly JsonSerializerOptions Options = new()
    {
        PropertyNameCaseInsensitive = true
    };
}
