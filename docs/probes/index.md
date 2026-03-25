# Probes

Probes are **hooks** that manipulate infrastructure before or after sessions run. They are typically used for setup and cleanup tasks such as creating queues, flushing caches, scaling pods, truncating tables, or deleting data.

The **QaaS.Common.Probes** NuGet package ships the built-in probe library. You can author custom probes by implementing `BaseProbe<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                  |
|----------------|------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Probes`                                             |
| **Source**     | [QaaS.Common.Probes]({{ links.repository_probes }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)               |

## Installation

```xml
<PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
```

## Writing Custom Probes

See [Write Hooks](../qaas/quickStart/writeHooks.md) for the pattern.
