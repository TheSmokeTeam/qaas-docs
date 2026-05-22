---
id: probes.available.osedityamlconfigmap.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/OsEditYamlConfigMap/overview.md]
code_langs: [yaml]
keywords: [probes, OsEditYamlConfigMap, configuration, reference]
ai_summary: "Field-by-field reference for OsEditYamlConfigMap ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
tags: [probes]
canonical_url: /probes/availableProbes/OsEditYamlConfigMap/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# OsEditYamlConfigMap — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.ConfigMapName` | `string` | &#10004 |  | The config map to edit |
| `ProbeConfiguration.ConfigMapYamlFileName` | `string` | &#10006 | ConfigMap.yml | The name of the yaml file inside the config map data |
| `ProbeConfiguration.ValuesToEdit` | `object or string` | &#10006 |  | The description of the configmap paths and values to change (in JSONPath format). For example:path.to.yaml.value[0]: new value |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
