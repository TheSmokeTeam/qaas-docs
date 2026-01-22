# Links

Links are the links generated on test results, used to view the tested application's metrics/logs/traces or any other observability data outputted by the system. These links are generated per test result to be relevant specifically to that test and the time it ran at.

Links can be found by clicking on the relevant test and looking at the Links section at the right of the screen where all the test metadata is.

## Available Link Types

### Kibana

Links to a kibana UI.

!!! Tip "Kibana Version"
    The suggested Kibana to use is the one supported by `REDA` in version `8.4.1`.

#### Getting The DataViewId

To get the `DataViewId` of a `DataView` in kibana you can go to `Stack Managment` -> `Data Views` select your DataView and go to `Edit data view`.
There you will see your `DataViewId` under `Custom data view ID`.

![DataViewIdInKibana](../../../../assets/dataViewId.png)

### Prometheus

Links to prometheus UI.

### Grafana

Links to a grafana dashboard.
