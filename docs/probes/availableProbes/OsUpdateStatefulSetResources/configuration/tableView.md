<!-- generated hash:35c0ea522cb3 sources:runner-family, OsUpdateStatefulSetResources, table-view -->

# OsUpdateStatefulSetResources Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ContainerName` | `string` | &#10004 |  | The name of the container to update |
| `ProbeConfiguration.ReplicaSetName` | `string` | &#10004 |  | The name of the replicaset to scale the pods of |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `integer or string` | &#10006 | 1000 | The interval in milliseconds between every check of the replica set's state (if it reached the desired number of pods yet) |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `integer or string` | &#10006 | 300 | The timeout in seconds for waiting for the replicaset to scale to the given number of pods, when timeout is reached an error log is raised and the code continues to run |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.DesiredResources` | `object or string` | &#10006 |  | The resources to update the replicaset with. Overrides the current replicaset's resources. |
| `ProbeConfiguration.DesiredResources.Limits` | `object or string` | &#10006 |  | The limits resources to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Limits.Cpu` | `string or null` | &#10006 |  | The amount of cpu to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Limits.Memory` | `string or null` | &#10006 |  | The amount of memory to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Requests` | `object or string` | &#10006 |  | The requests resources to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Requests.Cpu` | `string or null` | &#10006 |  | The amount of cpu to update the replicaset with |
| `ProbeConfiguration.DesiredResources.Requests.Memory` | `string or null` | &#10006 |  | The amount of memory to update the replicaset with |
