# OsRestartPods Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `Integer | String` | &#10006 | 1000 | The interval in milliseconds between every check of the pod's state (if they are ready yet) |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `Integer | String` | &#10006 | 300 | The timeout in seconds for waiting for the pods to stop restarting, when timeout is reached an error log is raised and the code continues to run |
| `ProbeConfiguration.ApplicationLabels` | `Array | String` | &#10004 |  | A list of the k8s labels of the pods to execute the command in, for example: app=test |
| `ProbeConfiguration.ApplicationLabels[]` | `String` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `Object | String` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `String` | &#10004 |  | The openshift cluster api (for example REDA) |
| `ProbeConfiguration.Openshift.Namespace` | `String` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `String` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `String` | &#10004 |  | Username with access to the openshift namespace and application |
