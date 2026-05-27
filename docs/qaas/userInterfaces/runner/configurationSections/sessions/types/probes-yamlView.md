---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.probes-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Probe YAML scaffold for pre-session or staged runtime preparation."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Probes Configurations Yaml View

> TL;DR: Probe YAML scaffold for pre-session or staged runtime preparation.

```yaml
Probes:
  - Name: "value"
    Probe: "CreateRabbitMqBindings"
    Configuration: "${value}"
    ProbeConfiguration: "${value}"
    Stage: "${value}"
    DataSourceNames:
      - "value"
    DataSourcePatterns:
      - "value"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
