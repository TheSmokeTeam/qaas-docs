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
