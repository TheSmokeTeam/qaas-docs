# OsExecuteCommandsInContainers

Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function

## What It Does

Finds pods by label selection and executes the configured commands inside the matching containers.

This is useful for ad hoc maintenance steps such as inspecting environment state, clearing temporary files, or triggering in-container admin commands before or after a scenario.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsExecuteCommandsInContainersProbe
        Probe: OsExecuteCommandsInContainers
        ProbeConfiguration:
          ContainerName: api
          ApplicationLabels:
            - app=orders-api
          Commands:
            - printenv
            - ls /tmp
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This probe finds pods labeled `app=orders-api`, enters the `api` container in each matching pod, and runs `printenv` followed by `ls /tmp`.

It is useful for inspection or lightweight maintenance commands inside the running workload.

### Global Dictionary Behavior

This probe derives from the shared OpenShift configuration shape, so `UseGlobalDict` can appear in generated YAML and table views. The current implementation derives from the plain OpenShift probe base and does not read or write probe-global-dictionary aliases for this action.

That means the behavior is unchanged for every run: the probe uses only the values supplied directly in local YAML or code configuration, even if `UseGlobalDict` is set.
