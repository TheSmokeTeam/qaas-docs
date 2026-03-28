# Assertions

The Assertions section contains a list of [QaaS.Common.Assertions](../../../../../assertions/index.md) or project-local assertions, which are logical calculations performed on the [Sessions](../sessions/overview.md) results in order to decide the test's status (`Passed` / `Failed` / `Broken`). Each assertion produces a different test result.

## Assertion Links

In addition to general [Links](../links/overview.md) that can be configured to contain information relevant to the entire test suite, assertion-specific links can be configured and displayed in [Allure Report](../../allureReport.md) only under that specific assertion. This is useful when an assertion depends on context that should be visible directly from that assertion result.

## Allure Results

Assertion results are saved as [Allure Report](../../allureReport.md) results under an `allure-results` directory.
Each assertion produces an Allure test result and, unless configured otherwise, also saves the `SessionData` of the sessions relevant to the assertion under `allure-results/SessionsData/`.

??? Note "SessionsData Folder"
    Under the `SessionsData` directory the sessions can be found by their `SessionNames` with a `.json` suffix.
    If the sessions are part of an `execution` they will be under a folder composed of the execution name.
    If the sessions are part of a `case` they will be under a folder composed of the case name with all invalid directory characters replaced with `_`.
    If the sessions are part of both an `execution` and a `case`, the execution folder comes before the case folder.
