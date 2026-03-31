# OsChangeDeploymentEnvVars Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ReplicaSetName` | `string` | &#10004 |  | The name of the replicaset to scale the pods of |
| `ProbeConfiguration.ContainerName` | `string or null` | &#10006 |  | The name of the container we would like to update, if not given - the probe will update all of the pod's containers |
| `ProbeConfiguration.EnvVarsToUpdate` | `object or string` | &#10006 |  | The environment variables to update/add |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `integer or string` | &#10006 | 1000 | The interval in milliseconds between every check of the replica set's state (if it reached the desired number of pods yet) |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `integer or string` | &#10006 | 300 | The timeout in seconds for waiting for the replicaset to scale to the given number of pods, when timeout is reached an error log is raised and the code continues to run |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.EnvVarsToRemove` | `list or string` | &#10006 |  | The environment variables to remove |
| `ProbeConfiguration.EnvVarsToRemove[]` | `string` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
