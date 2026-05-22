---
id: probes.availableprobes.osrestartpods.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, availableprobes, osrestartpods, overview]
summary: "Probe that restarts all pods with configured labels in the configured namespace"
---
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

This probe derives from the shared OpenShift configuration shape, so `UseGlobalDict` can appear in generated YAML and table views. The current implementation derives from the plain OpenShift probe base and does not read or write probe-global-dictionary aliases for this action.

That means the behavior is unchanged for every run: the probe uses only the values supplied directly in local YAML or code configuration, even if `UseGlobalDict` is set.
