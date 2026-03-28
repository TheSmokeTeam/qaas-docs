# OsEditYamlConfigMap

Probe that edits yaml config maps

> Logical group: Cluster orchestration / Config maps

> Logical group: Cluster orchestration / Config maps

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
