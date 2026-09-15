# Assertions

> TL;DR — Assertions validate Runner session data after act-phase work and write assertion results to Allure output.

## When to use

The Assertions section contains a list of [QaaS.Common.Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md) or project-local assertions, which are logical calculations performed on the [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md) results in order to decide the test's status (`Passed` / `Failed` / `Broken`). Each assertion produces a different test result.

## YAML configuration

Use `Assertions[]` for assertion entries. Each entry has a `Name`, selects an assertion hook through `Assertion`, and can pass hook-specific settings through `AssertionConfiguration`.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/configurations/yamlView/index.md).

## Assertion Links

In addition to general [Links](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/overview/index.md) that can be configured to contain information relevant to the entire test suite, assertion-specific links can be configured and displayed in [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md) only under that specific assertion. This is useful when an assertion depends on context that should be visible directly from that assertion result.

## Allure Results

Assertion results are saved as [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md) results under an `allure-results` directory. Each assertion produces an Allure test result and, unless configured otherwise, also saves the `SessionData` of the sessions relevant to the assertion under `allure-results/SessionsData/`.

SessionsData Folder

Under the `SessionsData` directory the sessions can be found by their `SessionNames` with a `.json` suffix. If the sessions are part of an `execution` they will be under a folder composed of the execution name. If the sessions are part of a `case` they will be under a folder composed of the case name with all invalid directory characters replaced with `_`. If the sessions are part of both an `execution` and a `case`, the execution folder comes before the case folder.

## Assertion Result Details

Custom assertion hooks can enrich the Allure result through the fields exposed by `IAssertion` and `BaseAssertion<TConfiguration>`:

- `AssertionMessage` is written as the assertion status message for normal assertion statuses.
- `AssertionTrace` is written as the assertion status trace when `DisplayTrace` is true.
- `AssertionStatus` can override the boolean returned from `Assert(...)`. When it is not set, `true` becomes `Passed` and `false` becomes `Failed`. Exceptions thrown from `Assert(...)` are reported as `Broken`.
- `AssertionAttachments` contains custom files that should be saved with the assertion result.

For broken assertions, Runner uses the thrown exception message and trace instead of `AssertionMessage` and `AssertionTrace`. When `DisplayTrace` is false, the trace field is replaced with a short placeholder so large or sensitive traces are not copied into the report.

## Assertion Attachments

Add custom assertion attachments by pushing `AssertionAttachment` items from inside the assertion hook:

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Assertion;
using QaaS.Framework.SDK.Session.SessionDataObjects;
using QaaS.Framework.Serialization;

public sealed record AttachmentConfig;

public sealed class DebugAttachmentAssertion : BaseAssertion<AttachmentConfig>
{
    public override bool Assert(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        AssertionAttachments.Add(new AssertionAttachment
        {
            Path = "debug/response-summary.json",
            Data = new { Expected = 10, Actual = 8 },
            SerializationType = SerializationType.Json
        });

        return true;
    }
}
```

`Path` is normalized as a relative path and must include a file name. Duplicate normalized paths in the same assertion are rejected so one attachment does not overwrite another. `SerializationType` controls how `Data` is serialized and the MIME type used in the report; when it is omitted, Runner treats the value as raw bytes.

The `SaveAttachments` assertion key controls whether these custom assertion attachments are saved. It is enabled by default. The related reporting keys are `SaveSessionData`, `SaveLogs`, `SaveTemplate`, `DisplayTrace`, and `StatusesToReport`.

## Edge cases

- `SessionNames` and `DataSourceNames` select the runtime data passed into each assertion.
- Exceptions thrown from `Assert(...)` are reported as `Broken`.
- Duplicate attachment paths in the same assertion are rejected.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/configurations/yamlView/index.md)
- [Available assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md)
- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
- [Links](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/overview/index.md)
- [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md)
