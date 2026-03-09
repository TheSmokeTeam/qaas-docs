# Generators

Generators are **hooks** that produce input data for Runner sessions. Before the act phase begins, the Runner calls each configured generator to populate the `DataSource` that sessions consume during publish/transact actions.

The **QaaS.Common.Generators** NuGet package ships the built-in generator library. You can author custom generators by implementing `BaseGenerator<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

| | |
|---|---|
| **Package** | `QaaS.Common.Generators` |
| **Source** | [GitHub — QaaS.Common.Generators]({{ links.github_generators }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md) |

## Installation

```xml
<PackageReference Include="QaaS.Common.Generators" Version="*" />
```

## Available Generators

| Generator | Category | Purpose |
|---|---|---|
| [FromFileSystem](availableGenerators/FromFileSystem/overview.md) | External source | Load data from local files |
| [FromS3](availableGenerators/FromS3/overview.md) | External source | Load data from an S3 bucket |
| [FromDataLake](availableGenerators/FromDataLake/overview.md) | External source | Load data from a data-lake path |
| [FromDataSources](availableGenerators/FromDataSources/overview.md) | Data source | Copy data from other named data sources |
| [FromLettuceDataSources](availableGenerators/FromLettuceDataSources/overview.md) | Data source | Load Lettuce-formatted data from data sources |
| [FromSessionDataDataSources](availableGenerators/FromSessionDataDataSources/overview.md) | Data source | Extract data from previously run session data |
| [Json](availableGenerators/Json/overview.md) | Synthetic | Generate JSON from a prototype with value overrides |
| [JsonSchemaDraft4](availableGenerators/JsonSchemaDraft4/overview.md) | Synthetic | Generate JSON from a JSON Schema Draft 4 definition |
| [LettuceFromFileSystem](availableGenerators/LettuceFromFileSystem/overview.md) | External source | Load Lettuce-formatted data from local files |
| [Stacking](availableGenerators/Stacking/overview.md) | Composition | Stack multiple data source outputs into one |

## Writing a Custom Generator

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.
