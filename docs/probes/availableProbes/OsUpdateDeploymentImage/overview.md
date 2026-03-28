# OsUpdateDeploymentImage

Updates the image of one container in a Kubernetes or OpenShift deployment.

> Logical group: Cluster orchestration / Image rollout

## What It Does

Updates the container image used by a deployment and waits until the deployment rollout reaches the desired state.

This is useful when a scenario needs to switch a deployment to a prebuilt image version as part of setup.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsUpdateDeploymentImageProbe
        Probe: OsUpdateDeploymentImage
        ProbeConfiguration:
          ReplicaSetName: orders-api
          ContainerName: api
          DesiredImage: registry.local/orders-api:2.1.0
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This probe changes the `api` container in the `orders-api` deployment to use `registry.local/orders-api:2.1.0`.

After patching the deployment, it waits for the rollout to finish before the scenario proceeds.
