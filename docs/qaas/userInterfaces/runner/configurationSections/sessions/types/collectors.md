# Collectors

Collectors are communication actions that collect data from an endpoint within a range of time in a single action. Every collector will create an `Output` by its name in the `SessionData`.

Unlike Consumers which actively poll or subscribe to message queues for real-time events, Collectors are designed to execute bulk queries against historical metrics or logging endpoints. They retrieve entire datasets pertaining to a specified time window, allowing the Runner to run retrospective assertions on system behavior.

**Table Property Path** - `Sessions[].Collectors[]`

## Prometheus

Collects messages from the Prometheus `query_range` API and saves each of them as an item of a vector result's array. A vector is a fundamental result type in Prometheus that represents a set of time-series data. Every item of its result array represents a single metric value at a certain discrete timestamp.

The Prometheus collector connects to the configured Prometheus server, formulates the PromQL query using the provided timestamps, and fetches the telemetry data. This is extremely useful for validating that certain performance or operational metrics (like CPU usage, request latency, or error rates) fell within expected boundaries during the execution of a test.

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
