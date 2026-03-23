# OsExecuteCommandsInContainers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.ContainerName` | `Null | String` | &#10006 |  | The name of the container to run the commands in in all the found pods, if no name is given runs the command in all pod containers |
| `ProbeConfiguration.ApplicationLabels` | `Array | String` | &#10004 |  | A list of the k8s labels of the pods to execute the command in, for example: app=test |
| `ProbeConfiguration.ApplicationLabels[]` | `String` | &#10006 |  |  |
| `ProbeConfiguration.Commands` | `Array | String` | &#10004 |  | A list of the commands to execute in the chosen containers |
| `ProbeConfiguration.Commands[]` | `String` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `Object | String` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `String` | &#10004 |  | The openshift cluster api (for example REDA) |
| `ProbeConfiguration.Openshift.Namespace` | `String` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `String` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `String` | &#10004 |  | Username with access to the openshift namespace and application |
