---
id: mocker.userinterfaces.mocker.configurationsections.datasources.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, datasources, overview]
summary: "The list of the data sources that contain enumerables of data to be generated and iterated later in several places."
---
# DataSources

The list of the data sources that contain enumerables of data to be generated and iterated later in several places.

Data sources are based on the `hook` `IGenerator` and each data source needs to reference a generator with the configurations required for its data generation.

## Usage

Data sources can be used in the following places:

- In [Stubs](../stubs/overview.md) in order to give a stub the data it should be based on.
- In other [DataSources](overview.md) in order to chain generations of data and enrich them.
- In specific server implementations, such as [Servers](../server/overview.md#socket), when the server processes batches of data per connection.

In every place that data sources can be used, the way to reference a specific data source is by its `Name`.
