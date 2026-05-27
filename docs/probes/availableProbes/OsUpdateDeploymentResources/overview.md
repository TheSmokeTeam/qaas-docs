---
id: probes.available.osupdatedeploymentresources.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateDeploymentResources, ProbeConfiguration]
summary: "Updates container resource requests and limits in a Kubernetes or OpenShift deployment."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateDeploymentResources.cs -->

# OsUpdateDeploymentResources

> TL;DR — Updates container resource requests and limits in a Kubernetes or OpenShift deployment.

## When to use {: #when-to-use}

Updates CPU and memory requests and limits on a deployment container, then waits for the deployment to converge.

This is useful when a scenario needs a temporary resource profile, for example to test scaling thresholds or resource-constrained behavior.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsUpdateDeploymentResourcesProbe
        Probe: OsUpdateDeploymentResources
        ProbeConfiguration:
          UseGlobalDict: true
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

## Realistic example {: #realistic-example}

This probe updates the `api` container in the `orders-api` deployment so that it requests `250m` CPU and `256Mi` memory, with limits of `1000m` CPU and `1Gi` memory.

The deployment is then allowed to roll out and settle before the scenario continues.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `DesiredResources` can be restored from `Os/Recovery/Resources/Deployment/<ReplicaSetName>/<ContainerName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to test a temporary CPU or memory profile and then restore the original requests and limits.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
