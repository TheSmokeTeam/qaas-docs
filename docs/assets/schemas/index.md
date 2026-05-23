---
id: assets.schemas.index
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, mocker, assertions, generators, probes, processors]
keywords: [schemas, json-schema, runner, mocker, hooks, contract]
summary: "Index of QaaS family schemas shipped under docs/assets/schemas/ with version, top-level sections, and minimal valid examples."
---
# Schemas

> TL;DR — Six JSON Schemas are shipped under `docs/assets/schemas/`. They cover Runner configuration, Mocker configuration, and the four hook families.

## When to use {: #when-to-use}

- You are validating a Runner or Mocker YAML before invoking `template` or `run`.
- You are wiring an editor (VS Code, JetBrains) to a JSON Schema for inline validation.
- You are bootstrapping an automation pipeline that must reject malformed test configurations.

## Schemas {: #schemas}

| Family | Schema file | Reference page | Schema version |
|---|---|---|---|
| Runner | [runner-family-schema.json](runner-family-schema.json) | [Runner family schema](runner-family-schema.md) | draft-07 |
| Mocker | [mocker-family-schema.json](mocker-family-schema.json) | [Mocker family schema](mocker-family-schema.md) | draft-07 |
| Assertions | [assertions.schema.json](assertions.schema.json) | [Hook family schemas](hook-family-schemas.md) | draft-07 |
| Generators | [generators.schema.json](generators.schema.json) | [Hook family schemas](hook-family-schemas.md) | draft-07 |
| Probes | [probes.schema.json](probes.schema.json) | [Hook family schemas](hook-family-schemas.md) | draft-07 |
| Processors | [processors.schema.json](processors.schema.json) | [Hook family schemas](hook-family-schemas.md) | draft-07 |

## Wire to an editor {: #editor}

VS Code (`.vscode/settings.json`):

```json
{
  "yaml.schemas": {
    "https://thesmoketeam.github.io/qaas-docs/assets/schemas/runner-family-schema.json": [
      "**/*.qaas.yaml",
      "**/test.qaas.yaml"
    ],
    "https://thesmoketeam.github.io/qaas-docs/assets/schemas/mocker-family-schema.json": [
      "**/*.mocker.yaml"
    ]
  }
}
```

Override the schema host with the `QAAS_DOCS_LINK_RUNNER_SCHEMA` and `QAAS_DOCS_LINK_MOCKER_SCHEMA` environment variables when serving from an air-gapped mirror; see [Configuration Defaults](../../integrations/configuration-defaults.md).

## Validate a YAML file {: #validate}

```powershell
python -m pip install check-jsonschema
check-jsonschema --schemafile docs/assets/schemas/runner-family-schema.json my-test.qaas.yaml
check-jsonschema --schemafile docs/assets/schemas/mocker-family-schema.json my-mock.mocker.yaml
```

## Schema regeneration {: #regen}

Schemas are produced by `QaaS.PackageMirror`. To regenerate locally:

```powershell
dotnet run --project D:\QaaS\QaaS.PackageMirror\QaaS.PackageMirror.Tools -- generate-family-schemas --mirror-root D:\QaaS\QaaS.PackageMirror
```

The schemas are not hand-edited; do not modify the `.json` files in this directory by hand.

## See also {: #see-also}

- [Public contract](../../qaas/public-contract.md)
- [Runner family schema](runner-family-schema.md)
- [Mocker family schema](mocker-family-schema.md)
- [Hook family schemas](hook-family-schemas.md)
- [PackageMirror](../../integrations/package-mirror.md)
