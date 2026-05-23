---
id: assets.schemas.runner-family-schema
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [schemas, runner, json-schema, validation]
summary: "Runner family JSON Schema (draft-07) covering MetaData, DataSources, Storages, Sessions, Assertions, and policy fields."
---
# Runner Family Schema

> TL;DR — `runner-family-schema.json` is the contract for `*.qaas.yaml` files consumed by the Runner. Validate every YAML before templating.

## When to use {: #when-to-use}

- You are authoring or reviewing a Runner YAML.
- You need a stable anchor to cite in a plan or migration note.
- You are wiring CI to fail on malformed Runner files.

## Schema location {: #location}

Canonical: [runner-family-schema.json](runner-family-schema.json)

Regenerate via `QaaS.PackageMirror` (see [Schemas index](index.md#regen)). Do not hand-edit.

## Top-level sections {: #sections}

The Runner YAML root contains these top-level keys:

- `MetaData` — display name, description, and tags.
- `Links` — links to dashboards, issue trackers, and related runs.
- `DataSources` — named inputs and the hook that produces values.
- `Storages` — declared storage references and storage formats.
- `Sessions` — communication actions, probes, and Mocker commands.
- `Assertions` — invariants verified against captured session data.
- `Variables` — named values resolved into placeholders at template time.

See [Runner configuration sections](../../qaas/userInterfaces/runner/configurationSections/configurationSections.md).

## Required fields {: #required}

The schema requires `MetaData` and at least one of `Sessions` or `Assertions`. Every `Sessions[]` entry requires `Name`. Every `Assertions[]` entry requires `Name` and `Assertion`.

## Minimal valid example {: #minimal}

```yaml
MetaData:
  Name: hello-runner

Sessions:
  - Name: HttpSession
    Publishers:
      - Name: HelloPublisher
        Publisher: Http
        Configuration:
          Url: http://localhost:5050/hello
          Method: GET

Assertions:
  - Name: HelloIs200
    Assertion: HttpStatus
    SessionNames: [HttpSession]
    AssertionConfiguration:
      OutputName: HelloPublisher
      ExpectedStatus: 200
```

Validate:

```powershell
check-jsonschema --schemafile docs/assets/schemas/runner-family-schema.json my-runner.qaas.yaml
```

## Common validation failures {: #failures}

| Symptom | JSONPath | Cause | Fix |
|---|---|---|---|
| Missing required property `Name` | `$.Sessions[0]` | Session entry has no name | Add `Name:` |
| Unknown `Assertion` value | `$.Assertions[0].Assertion` | Hook simple name typo | Match the catalog entry |
| Type mismatch on `ExpectedStatus` | `$.Assertions[0].AssertionConfiguration.ExpectedStatus` | String instead of integer | Use `200`, not `"200"` |
| Additional properties not allowed | `$.Sessions[0]` | Misplaced top-level key inside session | Move to root |

## See also {: #see-also}

- [Public contract](../../qaas/public-contract.md)
- [Schemas index](index.md)
- [Write Test YAML](../../qaas/quickStart/writeTestYaml.md)
- [YAML mechanics](../../qaas/advancedConcepts/yaml-mechanics.md)
