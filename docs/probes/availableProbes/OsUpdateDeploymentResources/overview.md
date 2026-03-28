# OsUpdateDeploymentResources

Updates container resource requests and limits in a Kubernetes or OpenShift deployment.

> Logical group: Cluster orchestration / Resource tuning

## What It Does

Updates CPU and memory requests and limits on a deployment container, then waits for the deployment to converge.

This is useful when a scenario needs a temporary resource profile, for example to test scaling thresholds or resource-constrained behavior.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsUpdateDeploymentResourcesProbe
        Probe: OsUpdateDeploymentResources
        ProbeConfiguration:
          ReplicaSetName: orders-api
          ContainerName: api
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
          DesiredResources:
            Limits:
              Cpu: 1000m
              Memory: 1Gi
            Requests:
              Cpu: 250m
              Memory: 256Mi
```

## What This Configuration Does

This probe updates the `api` container in the `orders-api` deployment so that it requests `250m` CPU and `256Mi` memory, with limits of `1000m` CPU and `1Gi` memory.

The deployment is then allowed to roll out and settle before the scenario continues.
