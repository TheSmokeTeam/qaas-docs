using System.Text.Json;
using NJsonSchema;

namespace QaaS.Docs.Generator.Schema;

internal sealed record FamilySchemaDocs(
    string FamilyId,
    JsonSchema Schema,
    IReadOnlyList<SchemaSection> Sections)
{
    public static async Task<FamilySchemaDocs> LoadAsync(string familyDirectory)
    {
        var schemaText = await File.ReadAllTextAsync(Path.Combine(familyDirectory, "schema.json"));
        var schema = await JsonSchema.FromJsonAsync(schemaText);

        var manifestPath = Path.Combine(familyDirectory, "docs-manifest.json");
        if (!File.Exists(manifestPath))
        {
            var familyId = Path.GetFileName(Path.GetDirectoryName(familyDirectory)) ?? "unknown-family";
            return new FamilySchemaDocs(familyId, schema, FallbackSections.ForFamily(familyId));
        }

        await using var stream = File.OpenRead(manifestPath);
        var manifest = await JsonSerializer.DeserializeAsync<DocsManifest>(stream, Cli.JsonDefaults.Options)
                       ?? throw new InvalidOperationException($"Could not deserialize docs manifest from {manifestPath}.");

        var sections = manifest.Sections
            .OrderBy(section => section.Order)
            .Select(section => new SchemaSection(
                section.Id,
                section.Title,
                section.DocsSlug,
                section.TopLevelPropertyName,
                section.OverviewSummary,
                section.Notes ?? Array.Empty<string>()))
            .ToList();

        return new FamilySchemaDocs(manifest.FamilyId, schema, sections);
    }
}

public sealed record SchemaSection(
    string Id,
    string Title,
    string DocsSlug,
    string TopLevelPropertyName,
    string OverviewSummary,
    IReadOnlyList<string> Notes);

internal sealed record DocsManifest(
    string FamilyId,
    IReadOnlyList<DocsManifestSection> Sections);

internal sealed record DocsManifestSection(
    string Id,
    string Title,
    string DocsSlug,
    string TopLevelPropertyName,
    int Order,
    string OverviewSummary,
    IReadOnlyList<string>? Notes);

public static class FallbackSections
{
    public static IReadOnlyList<SchemaSection> ForFamily(string familyId)
    {
        return familyId switch
        {
            "runner-family" =>
            [
                new("meta-data", "MetaData", "metaData", "MetaData", "The metadata section stores execution-level values that are available across the runner lifecycle.", []),
                new("links", "Links", "links", "Links", "Links connect assertion results to external observability and supporting systems.", []),
                new("storages", "Storages", "storages", "Storages", "Storages define where runner artifacts and runtime objects can be persisted or retrieved.", []),
                new("data-sources", "DataSources", "dataSources", "DataSources", "Data sources define generators and generator configuration used across the execution.", []),
                new("sessions", "Sessions", "sessions", "Sessions", "Sessions define staged runtime actions against the system under test.", []),
                new("assertions", "Assertions", "assertions", "Assertions", "Assertions define the validation rules that decide the final test outcome.", [])
            ],
            "mocker-family" =>
            [
                new("data-sources", "DataSources", "dataSources", "DataSources", "Data sources define generators and reusable runtime data for the mocker execution.", []),
                new("stubs", "Stubs", "stubs", "Stubs", "Stubs define transaction processors and configuration used by the configured servers.", []),
                new("controller", "Controller", "controller", "Controller", "Controller configures the optional controller runtime and its communication settings.", []),
                new("servers", "Servers", "server", "Servers", "Servers define the HTTP, gRPC, and socket listeners that expose the mock runtime.", [])
            ],
            _ => []
        };
    }
}
