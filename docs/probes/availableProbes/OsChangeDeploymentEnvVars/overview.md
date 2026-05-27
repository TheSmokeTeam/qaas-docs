# OsChangeDeploymentEnvVars

Probe that changes the environment variables of a deployment

## What It Does

Updates or removes environment variables on a deployment and then waits for the deployment to converge to its desired state.

This is useful when a scenario needs to switch feature flags, endpoint URLs, or other container environment settings before traffic starts.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsChangeDeploymentEnvVarsProbe
        Probe: OsChangeDeploymentEnvVars
        ProbeConfiguration:
          UseGlobalDict: true
          ReplicaSetName: orders-api
          ContainerName: api
          EnvVarsToUpdate:
            FEATURE_FLAG_X: enabled
            DOWNSTREAM_BASE_URL: http://mocker:8080
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

This probe updates the `api` container in the `orders-api` deployment so that `FEATURE_FLAG_X` and `DOWNSTREAM_BASE_URL` are set, while `LEGACY_MODE` is removed.

After patching the deployment, it waits until the workload reaches the desired state again before the scenario continues.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `EnvVarsToUpdate` and `EnvVarsToRemove` can be restored from `Os/Recovery/EnvVars/Deployment/<ReplicaSetName>/<ContainerName-or-__all__>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to inject temporary environment variables and then restore the original environment.

A recovery payload is written only when the probe resolves exactly one target container, because that is the only time the original environment can be captured unambiguously.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.
