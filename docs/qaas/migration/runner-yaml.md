---
id: qaas.migration.runner-yaml
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [migration, runner, yaml, stages, datasources, probes]
summary: "Update a 1.x Runner YAML to the 2.x shape: explicit Stage ordinals, DataSources at the root, and Probes per session."
---
# Migration: Runner YAML

> TL;DR — Move data-source declarations to a root `DataSources` block, give every session an explicit integer `Stage`, and move readiness checks into `Probes`.

## When to use {: #when-to-use}

- You have a 1.x `*.qaas.yaml` that does not declare stages.
- Your sessions embed data-source declarations inline.
- Your readiness checks live inside session steps instead of a dedicated probe.

## YAML configuration {: #yaml-configuration}

### 1.x shape (before) {: #before}

```yaml
Sessions:
  - Name: Checkout
    Publishers:
      - Name: SendOrder
        DataSourceConfiguration:
          Generator: FromFileSystem
          GeneratorConfiguration:
            FileSystem: { Path: Fixtures/orders }
        Http:
          Url: http://localhost:5000/orders
```

### 2.x shape (after) {: #after}

```yaml
DataSources:
  - Name: Orders
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: Fixtures/orders }

Sessions:
  - Name: WaitForApp
    Stage: 1
    Probes:
      - Name: AppReady
        Probe: HttpReadiness
        ProbeConfiguration:
          Url: http://localhost:5000/healthz
          ExpectedStatus: 200
          TimeoutSeconds: 30
          IntervalSeconds: 1

  - Name: Checkout
    Stage: 2
    Publishers:
      - Name: SendOrder
        DataSourceNames: [Orders]
        Http:
          Url: http://localhost:5000/orders
```

## Edge cases {: #edge-cases}

- Sessions without an explicit `Stage` default to `Stage: 1`. Mixing implicit and explicit stages is not supported.
- A `DataSources` entry must have a unique `Name`. Reference it from sessions through `DataSourceNames`.
- `Probes` are evaluated within their session's stage and act as a barrier for that session only. To gate all subsequent sessions, place the probe in its own earlier stage.

## See also {: #see-also}

- [YAML mechanics](../advancedConcepts/yaml-mechanics.md)
- [Dependency gates recipe](../recipes/dependency-gates.md)
- [Public contract](../public-contract.md)
