# OsChangeDeploymentEnvVars Configurations Yaml View

> TL;DR: Minimal YAML scaffold for OsChangeDeploymentEnvVars ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
ProbeConfiguration:
  ReplicaSetName: "value"
  ContainerEnvVarsToUpdate: "${value}"
  ContainerName: "value"
  EnvVarsToUpdate: "${value}"
  IntervalBetweenDesiredStateChecksMs: "${value}"
  TimeoutWaitForDesiredStateSeconds: "${value}"
  UseGlobalDict: "${value}"
  EnvVarsToRemove:
    - "value"
  Openshift:
    Cluster: "value"
    Namespace: "value"
    Password: "value"
    Username: "value"
    AllowInvalidServerCertificates: "${value}"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
