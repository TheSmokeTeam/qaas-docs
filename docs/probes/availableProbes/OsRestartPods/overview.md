# OsRestartPods

Probe that restarts all pods with configured labels in the configured namespace

## What It Does

Deletes pods that match the configured labels and waits until the platform brings the workload back to its desired ready state.

This is useful when a scenario needs a clean restart of an application after changing config maps, secrets, or environment settings.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsRestartPodsProbe
        Probe: OsRestartPods
        ProbeConfiguration:
          ApplicationLabels:
            - app=orders-api
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This probe deletes the pods labeled `app=orders-api` and waits until the replacement pods are ready again.

It gives the scenario a controlled application restart without manually deleting pods outside the flow.

### Global Dictionary Behavior

This probe is intentionally left out of the probe-global-dictionary fallback feature in this first pass. There is no meaningful reusable recovery payload for it, so there is no `UseGlobalDict` option and no family alias involved.

That means the behavior is unchanged for every run: the probe uses only the values supplied directly in local YAML or code configuration.
