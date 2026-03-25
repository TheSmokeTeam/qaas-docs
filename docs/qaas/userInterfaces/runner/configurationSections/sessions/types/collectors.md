# Collectors

Collectors are communication actions that collect data from an endpoint within a range of time in a single action. Every collector will create an `Output` by its name in the `SessionData`.

**Table Property Path** - `Sessions[].Collectors[]`

## Prometheus

Collects messages from the prometheus `query_range` API and saves each of them as an item of a vector result's array. vector is a result type in prometheus that represents a set of time series data, every item of its result array represents a single value at a certain time.

A vector's result array item which is a single item in a prometheus output is structured like so:

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
        When collecting data from prometheus between 2 date times the data is returned
        at the requested SampleIntervalMs interval however the times will be rounded by
        prometheus to the closest past times divisible by the SampleIntervalMs value which
        means rounded time from before the start of the collection range will also be returned.
        for example if the interval is 1 minute, the start time is 13:59:56 and the end time
        is 14:00:02 the timestamps of the data samples returned will be [13:59:00, 14:00:00].
