---
id: probes.available.osexecutecommandsincontainers.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsExecuteCommandsInContainers, ProbeConfiguration]
summary: "Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsExecuteCommandsInContainers.cs -->

# OsExecuteCommandsInContainers

> TL;DR — Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function

## When to use {: #when-to-use}

Finds pods by label selection and executes the configured commands inside the matching containers.

This is useful for ad hoc maintenance steps such as inspecting environment state, clearing temporary files, or triggering in-container admin commands before or after a scenario.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsExecuteCommandsInContainersProbe
        Probe: OsExecuteCommandsInContainers
        ProbeConfiguration:
          ContainerName: api
          ApplicationLabels:
            - app=orders-api
          Commands:
            - printenv
            - ls /tmp
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## Realistic example {: #realistic-example}

This probe finds pods labeled `app=orders-api`, enters the `api` container in each matching pod, and runs `printenv` followed by `ls /tmp`.

It is useful for inspection or lightweight maintenance commands inside the running workload.

### Global Dictionary Behavior {: #global-dictionary-behavior}

This probe is intentionally left out of the probe-global-dictionary fallback feature in this first pass. There is no meaningful reusable recovery payload for it, so there is no `UseGlobalDict` option and no family alias involved.

That means the behavior is unchanged for every run: the probe uses only the values supplied directly in local YAML or code configuration.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
