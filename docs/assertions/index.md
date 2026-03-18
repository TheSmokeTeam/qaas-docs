# Assertions

Assertions are **hooks** that validate session data after the Runner's `act` phase completes. Each assertion receives the stored session data (inputs, outputs, metadata) and returns a `Pass` or `Fail` status that is written to the [Allure report](../qaas/userInterfaces/runner/allureReport.md).

The **QaaS.Common.Assertions** NuGet package ships the built-in assertion library. You can also author custom assertions by implementing `BaseAssertion<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Assertions`                                                 |
| **Source**     | [Repository — QaaS.Common.Assertions]({{ links.repository_assertions }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Assertions" Version="*" />
```

## Writing a Custom Assertion

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.
