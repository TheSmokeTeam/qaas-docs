<!-- generated hash:53126c931e75 sources:mocker-family, configuration-overview -->

# Configuration Sections

This page is generated from the current `QaaS Mocker` family schema.

The current top-level layout is:

```yaml
DataSources: []

Stubs: []

Controller: {}

Servers: []

```

## Sections

| Section | Description |
| ------- | ----------- |
| `DataSources` | List of data sources that can be used in the rest of the execution. They provide data that can be sent to the tested system or used by the execution itself to perform a multitude of logics. |
| `Stubs` | List of transaction stubs that can be used for server actions.They provide processing functionality to exercise transaction data. |
| `Controller` | The server mocker controller configuration |
| `Servers` | List of server mocker instances to run concurrently. |

## Table View Order

1. Property paths follow the YAML hierarchy.
2. Under every parent, primitive fields come before arrays and nested objects.
3. The pages document the current property names from the live family schema.
