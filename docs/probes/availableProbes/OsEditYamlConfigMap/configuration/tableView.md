# OsEditYamlConfigMap Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.ConfigMapName` | `String` | &#10004 |  | The config map to edit |
| `ProbeConfiguration.ConfigMapYamlFileName` | `String` | &#10006 | ConfigMap.yml | The name of the yaml file inside the config map data |
| `ProbeConfiguration.ValuesToEdit` | `Object | String` | &#10006 |  | The description of the configmap paths and values to change (in JSONPath format). For example:path.to.yaml.value[0]: new value |
| `ProbeConfiguration.Openshift` | `Object | String` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `String` | &#10004 |  | The openshift cluster api (for example REDA) |
| `ProbeConfiguration.Openshift.Namespace` | `String` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `String` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `String` | &#10004 |  | Username with access to the openshift namespace and application |
