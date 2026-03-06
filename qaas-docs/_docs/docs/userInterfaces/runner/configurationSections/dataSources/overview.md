# DataSources

The list of the data sources that contain enumerables of data to be used for the rest of the test.

Data sources are based on the `hook` `IGenerator` and each data source needs to reference a generator with certain configurations for its data generation.

## Usage

Data sources can be used in the following places:

* In [Sessions](../sessions/overview.md) in order to send data to the tested system.
* In other [DataSources](overview.md) in order to chain generations of data and enrich it.
* In [Assertions](../assertions/overview.md) in order to give prebuild data needed for the assertion's calculations.

In every place that data sources can be used the way to reference a specific data source is by its `Name`.
