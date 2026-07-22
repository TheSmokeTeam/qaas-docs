---
id: qaas.userinterfaces.runner.allurereport
type: reference
status: stable
since: 2.0.0
last_verified: 2026-07-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, allurereport]
summary: "Allure Report is a test reporting tool, that provides clear graphical reports about your tests."
---
# Allure Report

> TL;DR — Allure Report is a test reporting tool, that provides clear graphical reports about your tests.

Allure Report is a test reporting tool, that provides clear graphical reports about your tests.

## Allure Report Components {: #allure-report-components}

### Suites {: #suites}

The tests under the `suites` section in the allure report are put under the following hierarchy:

* **ParentSuite** - The `ExecutionId` of the execution this assertion ran under
* **Suite** - The `CaseName` of the case this assertion ran under

### Behaviours {: #behaviours}

The tests under the `behaviours` section in the allure report are put under the following hierarchy:

* **Epic** - The `SessionNames` passed as parameters to the assertion
* **Feature** - The `Assertion` type of the assertion

### Packages {: #packages}

The tests under the `packages` section in the allure report are put under the following hierarchy:

* **Package** - The name of the C# QaaS test project

### Test Result {: #test-result}

The results of a single assertion

#### Test statuses

Each assertion status can have one of the following statuses: `Passed`/`Failed`/`Broken`

#### Status details

For passed, failed, skipped, and unknown assertion results, Allure status details use the assertion hook's `AssertionMessage` and, when `DisplayTrace` is true, `AssertionTrace`.

For broken assertion results, Allure status details use the thrown exception message and trace. When `DisplayTrace` is false, Runner writes a short placeholder instead of the assertion trace or exception trace.

#### Attachments

Runner can add several attachment types to a test result:

| Attachment | Controlled By | Notes |
| ---------- | ------------- | ----- |
| Session data JSON | `SaveSessionData` | Attached to each session step as a flat `*-attachment.json` file. |
| Session logs | `SaveLogs` | Attached as a flat `*-attachment.log` file when the session has stored log text. |
| Rendered configuration template | `SaveTemplate` | Attached as a flat `*-attachment.yaml` file. |
| Custom assertion attachments | `SaveAttachments` | Built from the assertion hook's `AssertionAttachments` list and written as flat attachment files. |
| Coverage files | Always collected when matching files exist | Runner creates a flat attachment copy when a matching producer-owned file exists under `allure-results/Coverages/`. |

Runner also preserves organized compatibility copies under `SessionsData`, `SessionLogs`, `Templates`, and `AssertionsAttachments`; coverage producers continue to own files under `Coverages`. Result JSON never references these nested copies. Allure consumes only the portable, flat attachment sources in the root of `allure-results`.

Custom assertion attachments must use relative paths that include a file name. Runner normalizes paths and rejects duplicates in the same assertion result. The `SerializationType` on each attachment controls serialization and report MIME type; with no serialization type, the data is treated as raw bytes.

!!! warning "Compatibility across Allure 2.x"
    Portable Allure 2.x output requires each result JSON to have a valid UUID-form `uuid` and every attachment `source` to name a file directly in the root of `allure-results`. Older Runner output used arbitrary concatenated result IDs, which Allure 2.1.1 drops even though later releases accept them. It also referenced nested paths such as `Templates/<run>/template.yaml` and `SessionsData/<run>/<session>.json`. Allure CLI 2.40.0–2.44.0 rejects those paths before opening files that can contain valid data, then generates attachment metadata with size `0` and no source and does not copy the attachment into the report.

    Compatible Runner builds generate valid GUID-based result UUIDs and write flat, regex-safe attachment files referenced by file name only. Repeated references to the same logical attachment reuse the completed file. To repair output from an older build, replace invalid result UUIDs and update any corresponding references, copy every referenced nested file into the `allure-results` root under a unique file name of at most 100 letters, digits, dots, underscores, or hyphens, then recursively rewrite each attachment `source` in the result JSON, including attachments on nested test steps, before running `allure generate`. Do not downgrade to avoid these checks: valid UUIDs and flat attachment file names provide portable Allure 2.x results.

#### Flaky

A Passed test can be marked as `Flaky`, which means the test has passed, but cannot be trusted due to one or more failed actions (publisher/consumer/transaction/collector/probe) in the current run that do not directly affect the assertion.

Any test marked as flaky will also present the reasons it is marked as flaky under the `Flakiness Reasons` section

#### Test Steps

Under the `Test body` section, the test steps are presented in a tree format.
For each session, the inputs and outputs, and failure reasons if there are any, are shown.
In addition each session's SessionData `json` can be viewed by clicking the `SessionData` file icon within it.

The `Test body` view shows the nested session steps, their inputs and outputs, and any failure reasons captured during execution.

## Times {: #times}

Each `QaaS Test Suite` (An execution and a case) has its `Utc Start Time` recorded and saved as all of its tests' start time. A suite's test's stop time is the suite's start time plus the test duration which is composed of the duration of all sessions used by the assertion plus the assertion's run time.

The start time of an allure report is the start time of the first `QaaS Test Suite` and the stop time is the stop time of the test with the biggest stop time.

## See also {: #see-also}

* [QaaS Runner](../../index.md)
