# OsEditYamlConfigMap

Probe that edits yaml config maps

## What It Does

Loads a YAML document from a config map, edits the configured paths, and writes the updated document back to the config map.

This is useful when an application reads structured configuration from a config map and only a few settings need to change for a particular scenario.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OsEditYamlConfigMapProbe
        Probe: OsEditYamlConfigMap
        ProbeConfiguration:
          UseGlobalDict: true
          ConfigMapName: orders-config
          ConfigMapYamlFileName: application.yaml
          ValuesToEdit:
            service.retries: 5
            logging.level.default: Warning
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
```

## What This Configuration Does

This probe opens `application.yaml` inside the `orders-config` config map, changes `service.retries` to `5`, and changes `logging.level.default` to `Warning`.

It is a targeted way to adjust structured YAML configuration without replacing the whole config map by hand.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing shared cluster settings can be resolved from `Os/Defaults`, and missing `ValuesToEdit` can be restored from `Os/Recovery/ConfigMap/<ConfigMapName>` after an earlier probe in the same execution and session captured the pre-change state.

The probe writes its pre-change snapshot to the unique canonical scoped path for the current probe execution and then updates the recovery alias so a later rollback probe can reuse it. This is useful when you want to patch YAML values during setup and then restore the original values by replaying the saved JSON-path map.

No additional per-probe recovery caveat applies beyond the execution and session scoping rules.

When `UseGlobalDict` is `false`, the probe keeps the current behavior: it uses only local YAML or code configuration and does not read or write probe-global-dictionary state.
