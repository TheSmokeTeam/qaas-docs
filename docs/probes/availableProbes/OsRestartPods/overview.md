---
id: probes.available.osrestartpods.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsRestartPods, ProbeConfiguration]
summary: "Probe that restarts all pods with configured labels in the configured namespace"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsRestartPods.cs -->

# OsRestartPods

> TL;DR — Probe that restarts all pods with configured labels in the configured namespace

## When to use {: #when-to-use}

Deletes pods that match the configured labels and waits until the platform brings the workload back to its desired ready state.

This is useful when a scenario needs a clean restart of an application after changing config maps, secrets, or environment settings.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsRestartPodsProbe
        Probe: OsRestartPods
        ProbeConfiguration:
          ApplicationLabels:
            - app=orders-api
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## Realistic example {: #realistic-example}

This probe deletes the pods labeled `app=orders-api` and waits until the replacement pods are ready again.

It gives the scenario a controlled application restart without manually deleting pods outside the flow.

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
