---
id: probes.available.osedityamlconfigmap.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsEditYamlConfigMap, yaml, scaffold]
summary: "Minimal YAML scaffold for OsEditYamlConfigMap ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsEditYamlConfigMap Configurations Yaml View

> TL;DR: Minimal YAML scaffold for OsEditYamlConfigMap ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  ConfigMapName:
  ConfigMapYamlFileName:
  UseGlobalDict:
  ValuesToEdit:
  Openshift:
    Cluster:
    Namespace:
    Password:
    Username:
    AllowInvalidServerCertificates:
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
