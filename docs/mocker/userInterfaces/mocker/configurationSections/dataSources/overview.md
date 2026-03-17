# DataSources

`DataSources` is optional. Each item binds a unique name to an `IGenerator` hook and exposes generated data to the rest of the mock runtime.

Each data source can have its own generator-specific configuration, optional input data sources, and optional serialization or deserialization settings.

## Usage

Data sources can be used in the following places:

- in [Stubs](../stubs/overview.md) through `Stubs[].DataSourceNames`
- in other `DataSources` to chain generations together
- in [Socket](../server/overview.md#socket) broadcast actions through `Action.DataSourceName`

In every place that data sources can be used, the reference key is the data source `Name`.
