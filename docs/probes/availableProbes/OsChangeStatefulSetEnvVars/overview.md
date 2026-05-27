# OsChangeStatefulSetEnvVars

Probe that changes the environment variables of a statefulSet

## What It Does

Updates or removes environment variables on a stateful set and then waits for the workload to converge.

This is useful for stateful components such as brokers or databases that need a controlled configuration change before the scenario runs.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsChangeStatefulSetEnvVarsProbe
        Probe: OsChangeStatefulSetEnvVars
        ProbeConfiguration:
          UseGlobalDict: true
          ReplicaSetName: orders-worker
          ContainerName: worker
          EnvVarsToUpdate:
            FEATURE_FLAG_X: enabled
            PROCESSING_MODE: replay
          EnvVarsToRemove:
            - LEGACY_MODE
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This configuration updates the `worker` container in the `orders-worker` stateful set, adds two environment variables, removes `LEGACY_MODE`, and then waits for the stateful set rollout to settle.

It is the stateful-set equivalent of the deployment environment-variable probe.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `EnvVarsToUpdate` and `EnvVarsToRemove` can be restored from `Os/Recovery/EnvVars/StatefulSet/<ReplicaSetName>/<ContainerName-or-__all__>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to inject temporary environment variables into a stateful workload and later restore them.

A recovery payload is written only when the probe resolves exactly one target container, because that is the only time the original environment can be captured unambiguously.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.
