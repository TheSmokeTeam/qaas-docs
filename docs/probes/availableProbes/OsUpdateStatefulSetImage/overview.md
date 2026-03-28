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
