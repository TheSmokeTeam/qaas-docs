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
          UseGlobalDict: true
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

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `DesiredNumberOfPods` can be restored from `Os/Recovery/Scale/Deployment/<ReplicaSetName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to scale a deployment down and then restore its previous replica count later in the same session.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.
