# Collectors Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].Collectors` | `list or string or null` | &#10006 |  | List of all collectors to build and run for this session. Collectors fetch information about the application from 3rd party apis on the sessions runtime |
| `Sessions[].Collectors[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Collectors[].Name` | `string` | &#10004 |  | The name of the collector |
| `Sessions[].Collectors[].EndTimeReachedCheckIntervalMs` | `integer or string` | &#10006 | 1000 | The check interval in milliseconds of the check that the current UTC time is past the collection end time, so the collection action can happen. |
| `Sessions[].Collectors[].CollectionRange` | `object or string` | &#10006 |  | The collection range of the collector's action contains parameters for the start and end times of the collection range in relation to the start and end time of the collector's session. |
| `Sessions[].Collectors[].CollectionRange.EndTimeMs` | `integer or string` | &#10006 | 0 | The end time of the collection range in relation to the session end time, given in milliseconds, is added to the session's start time as is to determine the collection end time. |
| `Sessions[].Collectors[].CollectionRange.StartTimeMs` | `integer or string` | &#10006 | 0 | The start time of the collection range in relation to the session start time, given in milliseconds, is added to the session's start time as is to determine the collection start time. |
| `Sessions[].Collectors[].DataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned collected data |
| `Sessions[].Collectors[].DataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Collectors[].DataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Collectors[].DataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Collectors[].Prometheus` | `object or string` | &#10006 |  | Collects messages from the prometheus `query_range` API and saves each of them as an item of a vector result's array. vector is a result type in prometheus that represents a set of time series data, every item of its result array represents a single value at a certain time. |
| `Sessions[].Collectors[].Prometheus.Expression` | `string` | &#10004 |  | The expression to query the prometheus query_range API with to collect data |
| `Sessions[].Collectors[].Prometheus.Url` | `string` | &#10004 |  | The prometheus' url, the base url without any route |
| `Sessions[].Collectors[].Prometheus.ApiKey` | `string or null` | &#10006 |  | The api key for interacting with prometheus |
| `Sessions[].Collectors[].Prometheus.SampleIntervalMs` | `integer or string` | &#10006 | 30000 | The interval to sample the expression's value from the prometheus during the collection time range in milliseconds |
| `Sessions[].Collectors[].Prometheus.TimeoutMs` | `integer or string` | &#10006 | 120000 | The timeout in milliseconds for the execution of the query sent to the prometheus API |
