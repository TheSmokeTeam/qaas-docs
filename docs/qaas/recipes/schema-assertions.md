---
id: qaas.recipes.schema-assertions
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, assertions]
keywords: [recipes, assertions, schema, json-schema, ObjectOutputJsonSchema, HttpStatus]
summary: "Assert that an action's output matches a JSON Schema using ObjectOutputJsonSchema, plus HttpStatus on the same publisher."
---
# Schema Assertions

> TL;DR — Combine `HttpStatus` for transport correctness with `ObjectOutputJsonSchema` for payload shape. Both run on captured session data.

## When to use {: #when-to-use}

- You need to assert a response payload conforms to a contract.
- You want to fail loudly when an endpoint silently changes its JSON shape.
- You are validating a data source the assertion will read with `DataSourceNames`.

## Files to create {: #files}

`schemas/hello.schema.json`:

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["message"],
  "properties": {
    "message": { "type": "string", "minLength": 1 }
  },
  "additionalProperties": false
}
```

`test.qaas.yaml`:

```yaml
MetaData:
  Name: schema-assertion-demo

DataSources:
  - Name: HelloSchema
    Generator: FileContent
    GeneratorConfiguration:
      Path: ./schemas/hello.schema.json

Storages:
  - Name: FileStorage
    Storage: FileSystem
    Configuration:
      Path: ./qaas-out
      JsonStorageFormat: Indented

Sessions:
  - Name: HttpSession
    SaveData: true
    StorageNames: [FileStorage]
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
  - Name: HelloShape
    Assertion: ObjectOutputJsonSchema
    SessionNames: [HttpSession]
    DataSourceNames: [HelloSchema]
    AssertionConfiguration:
      OutputName: HelloPublisher
      SchemaDataSourceName: HelloSchema
```

## Template {: #template}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- template test.qaas.yaml --no-env
```

## Run {: #run}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- run test.qaas.yaml
```

Expected output shape: exit code `0` when the HTTP response body matches the schema; non-zero when either the status is wrong or the body breaks the contract. Allure reports both assertions independently.

## Cleanup {: #cleanup}

```powershell
Remove-Item -Recurse -Force .\qaas-out
```

## Failure modes {: #failures}

| Symptom | Cause | Fix |
|---|---|---|
| Schema not loaded | Wrong `Path` in the `FileContent` data source | Repo-relative path required |
| `OutputName` not found | Publisher name typo | Match the `Publishers[].Name` exactly |
| Schema rejects valid payload | `additionalProperties: false` plus a new field | Decide whether to update the schema or fix the endpoint |

## See also {: #see-also}

- [Assertions catalog](../../assertions/index.md)
- [ObjectOutputJsonSchema](../../assertions/availableAssertions/ObjectOutputJsonSchema/overview.md)
- [HttpStatus](../../assertions/availableAssertions/HttpStatus/overview.md)
- [Storage and SaveData](storage-and-save-data.md)
