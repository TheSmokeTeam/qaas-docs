# Links

Links are the links generated on test results, used to view the tested application's metrics, logs, traces, or any other observability data output by the system. These links are generated per test result so they stay relevant to the specific test and the time it ran.

Links can be found by clicking the relevant test and looking at the Links section on the right side of the screen where the test metadata is displayed.

## Available Link Types

### Kibana

Links to a Kibana UI.

!!! Tip "Kibana Version"
    The suggested Kibana to use is the one supported by `REDA` in version `8.4.1`.

#### Getting The DataViewId

To get the `DataViewId` of a `DataView` in Kibana, go to `Stack Management` -> `Data Views`, select your data view, and open `Edit data view`.
There you can see the `DataViewId` under `Custom data view ID`.

![DataViewIdInKibana](../../../../assets/dataViewId.png)

### Prometheus

Links to the Prometheus UI.

### Grafana

Links to a Grafana dashboard.
