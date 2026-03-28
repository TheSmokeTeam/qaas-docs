# OsScaleStatefulSetPods

Probe that scales openshift stateful sets

> Logical group: Cluster orchestration / Scaling

## What It Does

Scales a stateful set to the configured replica count and waits until the stateful workload converges.

This is useful when a scenario needs to grow or shrink a stateful component before traffic starts.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsScaleStatefulSetPodsProbe
        Probe: OsScaleStatefulSetPods
        ProbeConfiguration:
          ReplicaSetName: orders-worker
          DesiredNumberOfPods: 2
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This configuration scales the `orders-worker` stateful set to two pods and waits until the rollout is ready.

It is the stateful-set equivalent of the deployment scale probe.
