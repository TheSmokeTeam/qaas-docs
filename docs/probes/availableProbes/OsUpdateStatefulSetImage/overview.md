# OsUpdateStatefulSetImage

Updates the image of one container in a Kubernetes or OpenShift stateful set.

## What It Does

Updates the container image used by a stateful set and waits for the stateful rollout to converge.

This is useful when a scenario needs a stateful component to run from a different prebuilt image version.

## YAML Example

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

## What This Configuration Does

This configuration changes the `worker` container in the `orders-worker` stateful set to use `registry.local/orders-worker:2.1.0`.

The probe waits for the stateful set rollout to complete before the rest of the scenario runs.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `DesiredImage` can be restored from `Os/Recovery/Image/StatefulSet/<ReplicaSetName>/<ContainerName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to roll a stateful component to a temporary image and later roll it back.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.
