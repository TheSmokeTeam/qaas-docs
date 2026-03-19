# Generators

Generators are **hooks** that produce input data for Runner sessions. Before the act phase begins, the Runner calls each configured generator to populate the `DataSource` that sessions consume during publish/transact actions.

The **QaaS.Common.Generators** NuGet package ships the built-in generator library. You can author custom generators by implementing `BaseGenerator<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Generators`                                                 |
| **Source**     | [Repository — QaaS.Common.Generators]({{ links.repository_generators }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
```

## Writing a Custom Generator

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.
