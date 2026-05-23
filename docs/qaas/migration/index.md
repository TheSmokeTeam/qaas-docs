---
id: qaas.migration.index
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, mocker, framework]
keywords: [migration, v1, v2, upgrade]
summary: "Migration map from QaaS 1.x to 2.x covering YAML, configuration-as-code, hooks, and command flags."
---
# Migration to QaaS 2.x

> TL;DR — Five focused guides cover the YAML, code, hook, and CLI changes from 1.x to 2.x. Pick the one that matches the surface you own.

## What changed at the section level {: #section-changes}

- Runner YAML: new top-level sections for `DataSources`, `Probes`, and explicit `Stage` ordinals.
- Mocker YAML: stub objects gained `Triggers`, and `Server` selection is required.
- Hooks: a public parameterless constructor is now required for discovery.
- Configuration-as-code: the builder names align with the YAML keys one-to-one.
- Command flags: `--run-until-stage`, `--no-env`, and `--session-data` are new; legacy aliases were removed.

## Migration guides {: #guides}

- [Runner YAML](runner-yaml.md)
- [Mocker YAML](mocker-yaml.md)
- [Hooks](hooks.md)
- [Configuration as code](configuration-as-code.md)
- [Command flags](command-flags.md)

## At-a-glance command map {: #command-map}

```bash
# 1.x
dotnet run -- run test.qaas.yaml --stage 2 --env-off

# 2.x
dotnet run -- run test.qaas.yaml --run-until-stage 2 --no-env
```

## Migration checklist {: #checklist}

1. Read [Runner YAML](runner-yaml.md) and update `Stages`, `DataSources`, and `Probes`.
2. Read [Mocker YAML](mocker-yaml.md) and add `Server` selectors plus `Triggers`.
3. Read [Hooks](hooks.md) and ensure every custom hook has a public parameterless constructor.
4. Read [Configuration as code](configuration-as-code.md) and rename builder calls.
5. Read [Command flags](command-flags.md) and update CI invocations.

## See also {: #see-also}

- [Public contract](../public-contract.md)
- [YAML mechanics](../advancedConcepts/yaml-mechanics.md)
