# Collectors

Collectors are communication actions that collect data from an endpoint within a range of time in a single action. Every collector will create an `Output` by its name in the `SessionData`.

Unlike Consumers, which actively poll or subscribe to message queues for real-time events as they occur, Collectors are engineered to execute bulk queries against historical metrics or logging endpoints. The core logic of a Collector involves specifying a discrete time window and submitting a single, comprehensive query to an external data aggregation system. The Collector waits for the system to process the historical query and return a large, aggregated dataset. This mechanism is crucial for validating that an application's performance characteristics—such as CPU usage, error rates, or memory consumption—stayed within acceptable limits over the entire duration of a complex test scenario. By pulling this data retroactively, the Runner can perform holistic assertions on the system's overall operational health rather than validating single, discrete events.

**Table Property Path** - `Sessions[].Collectors[]`

## Prometheus

Collects messages from the Prometheus `query_range` API and saves each of them as an item of a vector result's array. A vector is a fundamental result type in Prometheus that represents a set of time-series data. Every item of its result array represents a single metric value at a certain discrete timestamp.

The Prometheus collector's logic relies on connecting to a target Prometheus server and translating the test's time boundaries into a structured PromQL (Prometheus Query Language) request. It submits this query to the server's `query_range` endpoint, requesting data points at specific sampling intervals. The collector then parses the JSON response returned by Prometheus, extracting the metric labels and the array of time-value pairs. It organizes this complex, multidimensional time-series data into a structured Output item. This allows the Runner to execute assertions that analyze trends, calculate averages, or check for spikes in telemetry data that was recorded while the system under test was actively processing load.

A vector's result array item which is a single item in a Prometheus output is structured like so:

```json
{
  "metric": {  
    "__name__": "the_metric's_name",
    "label": "label_value"
   }, // Vector's metric labels
  "value": [
    1621317100.700, // value's utc time in epoc
    "100" // vector's value at specified utc time
  ]
}
```

**Table Property Path** - `Sessions[].Collectors[].Prometheus`

```yaml
Prometheus: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Output`"
        ```yaml
        Body: <System.Text.Json.Nodes.JsonObject>
        ```

!!! Notice "Prometheus collection intervals"
    When collecting data from Prometheus between 2 date times the data is returned
    at the requested `SampleIntervalMs` interval. However, the times will be rounded by
    Prometheus to the closest past times divisible by the `SampleIntervalMs` value, which
    means a rounded time from before the start of the collection range will also be returned.
    For example, if the interval is 1 minute, the start time is `13:59:56` and the end time
    is `14:00:02`, the timestamps of the data samples returned will be `[13:59:00, 14:00:00]`.
