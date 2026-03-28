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
