# Links

Links are generated on test results so you can jump directly from a failed or interesting test run to the relevant observability view for that exact time window.

In practice, links are used for:

- logs in Kibana or another Elastic UI
- metrics in Prometheus
- dashboards in Grafana

## Where They Appear

Links are attached to the relevant test result entry, so they are visible together with the rest of the execution context instead of being tracked manually.

## Available Link Types

### Kibana

Links to a Kibana UI.

#### Getting the DataViewId

To get the `DataViewId` of a data view in Kibana:

1. open `Stack Management`
2. open `Data Views`
3. select the data view
4. open `Edit data view`
5. copy the value under `Custom data view ID`

### Prometheus

Links to a Prometheus UI.

### Grafana

Links to a Grafana dashboard.
