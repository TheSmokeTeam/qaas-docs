<!-- generated hash:d3ba65e28aa1 sources:runner-family, configuration-overview -->

# Configuration Sections

This page is generated from the current `QaaS Runner` family schema.

The current top-level layout is:

```yaml
Links: []

Storages: []

DataSources: []

Sessions: []

Assertions: []

MetaData: {}

```

## Sections

| Section | Description |
| ------- | ----------- |
| `MetaData` | The metadata for the tests' run |
| `Links` | The links generated on test results, used to view observability data outputted by the tested application. These links are generated per test result to be relevant specifically to that test and the time it ran at |
| `Storages` | External storages qaas inner objects can be stored in or retrieved from when using the `qaas act` (to create and store) or `qaas assert` (to retrieve and use) commands |
| `DataSources` | List of data sources that can be used in the rest of the execution. They provide data that can be sent to the tested system or used by the execution itself to perform a multitude of logics. |
| `Sessions` | List of all sessions to run. Sessions contain the actions performed against the tested system and its underlying infrastructure in order to receive response data from the tested system to assert on. |
| `Assertions` | The list of assertions performed on the sessions' results in order to decide the test's status, each assertion produces a different test result. |

## Table View Order

1. Property paths follow the YAML hierarchy.
2. Under every parent, primitive fields come before arrays and nested objects.
3. The pages document the current property names from the live family schema.
