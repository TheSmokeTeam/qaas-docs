# OsUpdateStatefulSetResources

Updates container resource requests and limits in a Kubernetes or OpenShift stateful set.

## What It Does

Updates CPU and memory requests and limits on a stateful set container, then waits for the stateful rollout to converge.

This is useful when a scenario needs to change the resource profile of a stateful component without rebuilding or redeploying the whole environment manually.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsUpdateStatefulSetResourcesProbe
        Probe: OsUpdateStatefulSetResources
        ProbeConfiguration:
          ReplicaSetName: orders-worker
          ContainerName: worker
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
          DesiredResources:
            Limits:
              Cpu: 1500m
              Memory: 2Gi
            Requests:
              Cpu: 500m
              Memory: 512Mi
```

## What This Configuration Does

This probe updates the `worker` container in the `orders-worker` stateful set so that it requests `500m` CPU and `512Mi` memory, with limits of `1500m` CPU and `2Gi` memory.

After the patch is applied, the probe waits for the stateful set to finish rolling out.
