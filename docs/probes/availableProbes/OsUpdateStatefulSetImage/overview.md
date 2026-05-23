---
id: probes.available.osupdatestatefulsetimage.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateStatefulSetImage, ProbeConfiguration]
summary: "Updates the image of one container in a Kubernetes or OpenShift stateful set."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateStatefulSetImage.cs -->

# OsUpdateStatefulSetImage

> TL;DR — Updates the image of one container in a Kubernetes or OpenShift stateful set.

## When to use {: #when-to-use}

Updates the container image used by a stateful set and waits for the stateful rollout to converge.

This is useful when a scenario needs a stateful component to run from a different prebuilt image version.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsUpdateStatefulSetImageProbe
        Probe: OsUpdateStatefulSetImage
        ProbeConfiguration:
          UseGlobalDict: true
          ReplicaSetName: orders-worker
          ContainerName: worker
          DesiredImage: registry.local/orders-worker:2.1.0
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## Realistic example {: #realistic-example}

This configuration changes the `worker` container in the `orders-worker` stateful set to use `registry.local/orders-worker:2.1.0`.

The probe waits for the stateful set rollout to complete before the rest of the scenario runs.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `DesiredImage` can be restored from `Os/Recovery/Image/StatefulSet/<ReplicaSetName>/<ContainerName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to roll a stateful component to a temporary image and later roll it back.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
