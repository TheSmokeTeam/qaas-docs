# Processors

Processors are **hooks** that handle incoming mocker stub requests and produce responses. They implement `ITransactionProcessor` / `BaseTransactionProcessor<TConfig>` and are referenced by class name in the mocker YAML.

The **QaaS.Common.Processors** NuGet package ships the built-in processor library. You can author custom processors by implementing `BaseTransactionProcessor<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Processors`                                                 |
| **Source**     | [Repository - QaaS.Common.Processors]({{ links.repository_processors }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
```

## Writing Custom Processors

See [Write Hooks](../qaas/quickStart/writeHooks.md) for the pattern.
