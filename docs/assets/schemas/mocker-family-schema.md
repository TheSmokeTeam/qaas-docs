---
id: assets.schemas.mocker-family-schema
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [schemas, mocker, json-schema, validation]
summary: "Mocker family JSON Schema (draft-07) covering Controller, Server, Stubs, DataSources, and Processors."
---
# Mocker Family Schema

> TL;DR — `mocker-family-schema.json` is the contract for `*.mocker.yaml` files. Validate before templating or starting the Mocker.

## When to use {: #when-to-use}

- You are authoring a static or controller-driven Mocker YAML.
- You need to validate routing tables, stubs, and data sources before launch.
- You are reviewing a multi-server Mocker recipe.

## Schema location {: #location}

Canonical: [mocker-family-schema.json](mocker-family-schema.json)

## Top-level sections {: #sections}

- `MetaData` — display name and description.
- `Controller` — optional Redis-backed controller wiring.
- `Servers` — listener definitions (HTTP, gRPC, message bus).
- `Stubs` — request matchers and response bodies.
- `DataSources` — payload providers shared between stubs.
- `Processors` — request/response processing pipeline.

## Required fields {: #required}

The schema requires `MetaData` and at least one `Servers[]` entry. Every `Stubs[]` entry requires `Name`, `Trigger`, and `Action`.

## Minimal valid example {: #minimal}

```yaml
MetaData:
  Name: hello-mocker

Servers:
  - Name: HttpServer
    Server: Http
    Configuration:
      Port: 5050

Stubs:
  - Name: HelloStub
    Trigger:
      ServerName: HttpServer
      Match:
        Path: /hello
        Method: GET
    Action:
      Response:
        Status: 200
        Body: '{"message":"hello"}'
        Headers:
          Content-Type: application/json
```

Validate:

```powershell
check-jsonschema --schemafile docs/assets/schemas/mocker-family-schema.json hello.mocker.yaml
```

## Common validation failures {: #failures}

| Symptom | JSONPath | Cause | Fix |
|---|---|---|---|
| Missing required property `Servers` | `$` | No listener declared | Add at least one `Servers[]` entry |
| Unknown `Server` type | `$.Servers[0].Server` | Typo or unsupported transport | Match supported names |
| Stub trigger missing match | `$.Stubs[0].Trigger.Match` | Trigger without a matcher | Provide `Path`, `Method`, or message filter |

## See also {: #see-also}

- [Public contract](../../qaas/public-contract.md)
- [Schemas index](index.md)
- [Mocker quick start](../../mocker/quickStart/createMock.md)
- [Mocker controller recipe (Redis)](../../mocker/authoring-guide/controller-recipe-redis.md)
