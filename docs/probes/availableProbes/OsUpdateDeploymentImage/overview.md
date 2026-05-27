# OsUpdateDeploymentImage

Updates the image of one container in a Kubernetes or OpenShift deployment.

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
          UseGlobalDict: true
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

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `DesiredImage` can be restored from `Os/Recovery/Image/Deployment/<ReplicaSetName>/<ContainerName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to swap to a test image and then revert to the original image without hard-coding it twice.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.
