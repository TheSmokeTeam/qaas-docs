# OsRestartPods

> TL;DR — Probe that restarts all pods with configured labels in the configured namespace

## When to use

Deletes pods that match the configured labels and waits until the platform brings the workload back to its desired ready state.

This is useful when a scenario needs a clean restart of an application after changing config maps, secrets, or environment settings.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

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

## Realistic example

This probe deletes the pods labeled `app=orders-api` and waits until the replacement pods are ready again.

It gives the scenario a controlled application restart without manually deleting pods outside the flow.

### Global Dictionary Behavior

This probe is intentionally left out of the probe-global-dictionary fallback feature in this first pass. There is no meaningful reusable recovery payload for it, so there is no `UseGlobalDict` option and no family alias involved.

That means the behavior is unchanged for every run: the probe uses only the values supplied directly in local YAML or code configuration.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsRestartPods/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsRestartPods/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
