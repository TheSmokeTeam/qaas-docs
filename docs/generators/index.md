# Generators

Generators are **hooks** that produce input data for [QaaS.Runner](../qaas/index.md) [Sessions](../qaas/userInterfaces/runner/configurationSections/sessions/overview.md). Before the act phase begins, the Runner calls each configured generator to populate the [DataSources](../qaas/userInterfaces/runner/configurationSections/dataSources/overview.md) that sessions consume during [Publishers](../qaas/userInterfaces/runner/configurationSections/sessions/types/publishers.md) and [Transactions](../qaas/userInterfaces/runner/configurationSections/sessions/types/transactions.md).

The **QaaS.Common.Generators** NuGet package ships the built-in generator library. You can author custom generators by implementing `BaseGenerator<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Generators`                                                 |
| **Source**     | [QaaS.Common.Generators]({{ links.repository_generators }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
```

## Writing a Custom Generator

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.


<!-- generated hook catalog start -->
## Available Hooks

The built-in hooks below are grouped by implementation type so it is easier to shortlist the right hook before drilling into configuration details.

### External sources

- [FromCSV](availableGenerators/FromCSV/overview.md): CSV files. Reads CSV files from the configured file-system path and turns each row into generated data items.
- [FromDataLake](availableGenerators/FromDataLake/overview.md): Data lake. Retrieves rows from the configured data lake query and exposes each row as a generated JSON object.
- [FromFileSystem](availableGenerators/FromFileSystem/overview.md): File system. Retrieves data from files under a configured path in the local file system.
- [LettuceFromFileSystem](availableGenerators/LettuceFromFileSystem/overview.md): Lettuce files. Retrieves lettuce-formatted files from the configured file-system path and exposes them as generated messages with their routing key metadata.
- [FromS3](availableGenerators/FromS3/overview.md): S3 storage. Retrieves data from objects in a configured S3 bucket and prefix.

### Existing data sources

- [FromDataSources](availableGenerators/FromDataSources/overview.md): Direct reuse. Generates data from the enumerable of data sources it receives
- [FromLettuceDataSources](availableGenerators/FromLettuceDataSources/overview.md): Lettuce reuse. Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into Json
- [FromSessionDataDataSources](availableGenerators/FromSessionDataDataSources/overview.md): Session data reuse. Generates data from the enumerable of data sources it receives, presumes all items in the enumerable are serialized and can be treated as a byte array
- [Stacking](availableGenerators/Stacking/overview.md): Stacking. Combines multiple data sources by taking a configured number of items from each source in turn.

### Structured payloads

- [Json](availableGenerators/Json/overview.md): Prototype JSON. Generates JSON data from a configured prototype document.
- [JsonSchemaDraft4](availableGenerators/JsonSchemaDraft4/overview.md): Schema-based JSON. Generates JSON data that conforms to a configured JSON Schema Draft 4 document.

<!-- generated hook catalog end -->
