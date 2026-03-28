# Assertions

Assertions are **hooks** that validate [QaaS.Runner](../qaas/index.md) [session data](../qaas/userInterfaces/runner/configurationSections/sessions/overview.md) after the Runner [`act`](../qaas/userInterfaces/runner/commands/act.md) phase completes. Each assertion receives the stored session data (inputs, outputs, metadata) and returns a `Pass` or `Fail` status that is written to the [Allure Report](../qaas/userInterfaces/runner/allureReport.md).

The **QaaS.Common.Assertions** NuGet package ships the built-in assertion library. You can also author custom assertions by implementing `BaseAssertion<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Assertions`                                                 |
| **Source**     | [QaaS.Common.Assertions]({{ links.repository_assertions }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
```

## Writing a Custom Assertion

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.
