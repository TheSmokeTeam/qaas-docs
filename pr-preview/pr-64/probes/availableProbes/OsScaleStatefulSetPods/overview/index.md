# OsScaleStatefulSetPods

> TL;DR — Probe that scales openshift statefulsets

## When to use

Scales a stateful set to the configured replica count and waits until the stateful workload converges.

This is useful when a scenario needs to grow or shrink a stateful component before traffic starts.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsScaleStatefulSetPodsProbe
        Probe: OsScaleStatefulSetPods
        ProbeConfiguration:
          UseGlobalDict: true
          ReplicaSetName: orders-worker
          DesiredNumberOfPods: 2
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## Realistic example

This configuration scales the `orders-worker` stateful set to two pods and waits until the rollout is ready.

It is the stateful-set equivalent of the deployment scale probe.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `DesiredNumberOfPods` can be restored from `Os/Recovery/Scale/StatefulSet/<ReplicaSetName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to temporarily shrink or grow a stateful workload and then restore its original size.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsScaleStatefulSetPods/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsScaleStatefulSetPods/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
