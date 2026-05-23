---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.collectors
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Collectors are communication actions that collect data from an endpoint within a range of time in a single action. Every collector will create an Output by its name in the SessionData."
---
# Collectors

> TL;DR — Collectors are communication actions that collect data from an endpoint within a range of time in a single action. Every collector will create an Output by its name in the SessionData.

Collectors are communication actions that collect data from an endpoint within a range of time in a single action. Every collector will create an `Output` by its name in the `SessionData`.

Collectors run after the session has a known start and end time. At runtime the collector applies the configured start and end offsets, waits until the effective end time has passed, calls the selected fetcher for that time range, filters the returned data, and stores the results as session `Output`. If the configured start is after the configured end, the action fails before calling the fetcher.

Use this page for behavior and YAML shape. The same action can be built in C# with the [CollectorBuilder API](../../../../../../qaas/functions/builders/collectors.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Collectors[]`

## Prometheus {: #prometheus}

Collects samples from the Prometheus `query_range` API and saves each returned sample as an output item. The Prometheus response type must be `matrix`; unsupported result types fail the action.

The fetcher builds a `query_range` URL from `Url`, `Expression`, collection start, collection end, `SampleIntervalMs`, and `TimeoutMs`. It adds the configured API key header when present, fails on unsuccessful HTTP status or non-`success` Prometheus status, and returns JSON output with the metric labels and sample value for each timestamp.

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

## See also {: #see-also}

- [Sessions](../overview.md)
