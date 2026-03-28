# OsScaleDeploymentPods

Probe that scales openshift deployments

## What It Does

Scales a deployment to the configured replica count and waits until the desired state is reached.

This is useful when a scenario needs to increase or decrease deployment capacity as part of the setup.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsScaleDeploymentPodsProbe
        Probe: OsScaleDeploymentPods
        ProbeConfiguration:
          ReplicaSetName: orders-api
          DesiredNumberOfPods: 3
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This probe scales the `orders-api` deployment to three pods and waits until the deployment reports that desired state.

It is a controlled capacity-management step inside the scenario flow.
