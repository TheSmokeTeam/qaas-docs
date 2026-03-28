# OsChangeStatefulSetEnvVars

Probe that changes the environment variables of a statefulSet

> Logical group: Cluster orchestration / Environment variables

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
