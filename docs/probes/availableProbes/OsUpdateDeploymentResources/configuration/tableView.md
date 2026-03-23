# OsUpdateDeploymentResources Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.ContainerName` | `String` | &#10004 |  | The name of the container to update |
| `ProbeConfiguration.ReplicaSetName` | `String` | &#10004 |  | The name of the replicaset to scale the pods of |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `Integer | String` | &#10006 | 1000 | The interval in milliseconds between every check of the replica set's state (if it reached the desired number of pods yet) |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `Integer | String` | &#10006 | 300 | The timeout in seconds for waiting for the replicaset to scale to the given number of pods, when timeout is reached an error log is raised and the code continues to run |
| `ProbeConfiguration.Openshift` | `Object | String` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `String` | &#10004 |  | The openshift cluster api (for example REDA) |
| `ProbeConfiguration.Openshift.Namespace` | `String` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `String` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `String` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.DesiredResources` | `Object | String` | &#10006 |  | The resources to update the replicaset with. Overrides the current replicaset's resources. |
| `ProbeConfiguration.DesiredResources.Limits` | `Object | String` | &#10006 |  | The limits resources to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Limits.Cpu` | `Null | String` | &#10006 |  | The amount of cpu to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Limits.Memory` | `Null | String` | &#10006 |  | The amount of memory to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Requests` | `Object | String` | &#10006 |  | The requests resources to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Requests.Cpu` | `Null | String` | &#10006 |  | The amount of cpu to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Requests.Memory` | `Null | String` | &#10006 |  | The amount of memory to update the replicaset with |
