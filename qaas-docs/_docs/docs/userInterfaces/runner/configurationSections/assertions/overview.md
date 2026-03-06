# Assertions

The Assertions section contains a list of assertions which are logical calculations performed on the [Sessions](../sessions/overview.md) results in order to decide the test's status (`Passed`/`Failed`/`Broken`), each assertion produces a different test result.

## Assertion Links

In addition to general [`Links`](../links/overview.md) that can be configured to contain information relevent to the entire test suite, assertion specifc can be configured that will be displayed in the allure only under that specific assertion. This can be useful when you are using the assertion on specifc information that you want to display in using a `Link`.

## Allure Results

Assertion results are saved as `allure results` under an `allure-results` directory.
Each assertion produces an allure test result and unless configured not to it also saves the `SessionData` of the sessions relevant to the assertion under `allure-results/SessionsData/`.

!!! note "SessionsData Folder"
        Under the `SessionsData` directory the sessions can be found by their `SessionNames` with a `.json` suffix.
        If the sessions are part of an `execution` they will be under a folder composed of the ExecutionId's name.
        If the sessions are part of a `case` they will be under a folder composed of the case's name with all invalid directory name characters switched with `_`.
        If the sessions are part of both an `execution` and a `case` the execution's folder will come before the case's folder.
