# OpenShift

## Available Probes

- `OsChangeDeploymentEnvVars`
- `OsChangeStatefulSetEnvVars`
- `OsEditYamlConfigMap`
- `OsExecuteCommandsInContainers`
- `OsRestartPods`
- `OsScaleDeploymentPods`
- `OsScaleStatefulSetPods`
- `OsUpdateDeploymentImage`
- `OsUpdateDeploymentResources`
- `OsUpdateStatefulSetImage`
- `OsUpdateStatefulSetResources`

## Common Configuration Fields

All OpenShift probes share the `Openshift` connection block:

| Field | Required | Description |
|---|---|---|
| `Openshift.Cluster` | yes | Cluster API endpoint. |
| `Openshift.Username` | yes | Username with access to the target namespace. |
| `Openshift.Password` | yes | Password for that user. |
| `Openshift.Namespace` | yes | Target namespace. |

## Common Action Patterns

- pod or replica-set updates use `ReplicaSetName`
- container-scoped updates also require `ContainerName`
- restart and command-execution probes use `ApplicationLabels`
- wait-oriented probes use `IntervalBetweenDesiredStateChecksMs` and `TimeoutWaitForDesiredStateSeconds`

## Examples Of Action-Specific Fields

| Field | Used By | Description |
|---|---|---|
| `DesiredNumberOfPods` | scale probes | Replica count to reach. |
| `DesiredImage` | image update probes | New container image. |
| `DesiredResources` | resource update probes | Replacement CPU and memory requests/limits. |
| `EnvVarsToUpdate` / `EnvVarsToRemove` | env-var probes | Environment-variable mutations. |
| `ConfigMapName`, `ConfigMapYamlFileName`, `ValuesToEdit` | `OsEditYamlConfigMap` | Config-map YAML edits by path. |
| `Commands` | `OsExecuteCommandsInContainers` | Commands to run in matching containers. |

Use the probe name that matches the exact target type in your deployment: deployment-based probes for deployments, and stateful-set probes for stateful sets.
