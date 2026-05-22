---
id: probes.available.osexecutecommandsincontainers.overview
slug: osexecutecommandsincontainers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, OsExecuteCommandsInContainers, ProbeConfiguration]
ai_summary: "Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function"
tags: [probes]
canonical_url: /probes/availableProbes/OsExecuteCommandsInContainers/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsExecuteCommandsInContainers.cs
---

# OsExecuteCommandsInContainers

Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function

## What it does

Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsExecuteCommandsInContainersSession
    Probes:
      - Name: OsExecuteCommandsInContainersStep
        Probe: OsExecuteCommandsInContainers
        ProbeConfiguration:
        Openshift:
          Cluster:
          Username:
          Password:
          Namespace:
        ApplicationLabels: []
        Commands: []
        ContainerName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsExecuteCommandsInContainers` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsExecuteCommandsInContainers.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
