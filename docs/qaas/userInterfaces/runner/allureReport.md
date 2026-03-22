# Allure Report

Allure Report is a test reporting tool, that provides clear graphical reports about your tests.

## Allure Report Components

### Suites

The tests under the `suites` section in the allure report are put under the following hierarchy:

* **ParentSuite** - The `ExecutionId` of the execution this assertion ran under
* **Suite** - The `CaseName` of the case this assertion ran under

### Behaviours

The tests under the `behaviours` section in the allure report are put under the following hierarchy:

* **Epic** - The `SessionNames` passed as parameters to the assertion
* **Feature** - The `Assertion` type of the assertion

### Packages

The tests under the `packages` section in the allure report are put under the following hierarchy:

* **Package** - The name of the C# QaaS test project

### Test Result

The results of a single assertion

#### Test statuses

Each assertion status can have one of the following statuses: `Passed`/`Failed`/`Broken`

#### Flaky

A Passed test can be marked as `Flaky`, which means the test has passed, but cannot be trusted due to one or more failed actions (publisher/consumer/transaction/collector/probe) in the current run that do not directly affect the assertion.

Any test marked as flaky will also present the reasons it is marked as flaky under the `Flakiness Reasons` section

#### Test Steps

Under the `Test body` section, the test steps are presented in a tree format.
For each session, the inputs and outputs, and failure reasons if there are any, are shown.
In addition each session's SessionData `json` can be viewed by clicking the `SessionData` file icon within it.

The `Test body` view shows the nested session steps, their inputs and outputs, and any failure reasons captured during execution.

## Times

Each `QaaS Test Suite` (An execution and a case) has its `Utc Start Time` recorded and saved as all of its tests' start time. A suite's test's stop time is the suite's start time plus the test duration which is composed of the duration of all sessions used by the assertion plus the assertion's run time.

The start time of an allure report is the start time of the first `QaaS Test Suite` and the stop time is the stop time of the test with the biggest stop time.
