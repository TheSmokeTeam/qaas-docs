# Processors

Processors are **hooks** that create mock responses in **QaaS.Mocker**. They implement `BaseTransactionProcessor<TConfig>` and are referenced by class name from a stub.

The **QaaS.Common.Processors** package is the reusable processor library for shared mock behavior. You can also author project-local processors when a mock needs behavior that is specific to one repository.

|                |                                                                          |
| -------------- | ------------------------------------------------------------------------ |
| **Package**    | `QaaS.Common.Processors`                                                 |
| **Source**     | [Repository - QaaS.Common.Processors]({{ links.repository_processors }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
```

## Writing a Custom Processor

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for the local-hook pattern.

## Quick-Start Note

The Mocker quick starts on this site keep the file-backed response processor inside the sample project so the examples stay runnable against the currently published NuGet packages.
