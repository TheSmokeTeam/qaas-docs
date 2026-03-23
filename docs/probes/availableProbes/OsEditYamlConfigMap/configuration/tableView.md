<!-- generated hash:703b4c0f37ad sources:runner-family, OsEditYamlConfigMap, table-view -->

# OsEditYamlConfigMap Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ConfigMapName` | `string` | &#10004 |  | The config map to edit |
| `ProbeConfiguration.ConfigMapYamlFileName` | `string` | &#10006 | ConfigMap.yml | The name of the yaml file inside the config map data |
| `ProbeConfiguration.ValuesToEdit` | `object or string` | &#10006 |  | The description of the configmap paths and values to change (in JSONPath format). For example:path.to.yaml.value[0]: new value |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api (for example REDA) |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
