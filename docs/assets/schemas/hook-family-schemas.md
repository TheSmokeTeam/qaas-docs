---
id: assets.schemas.hook-family-schemas
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [assertions, generators, probes, processors]
keywords: [schemas, hooks, assertions, generators, probes, processors]
summary: "Hook family JSON Schemas for built-in assertions, generators, probes, and processors, with minimal examples and lookup rules."
---
# Hook Family Schemas

> TL;DR — Each hook family ships a JSON Schema (draft-07) that lists every built-in hook and its configuration shape.

## When to use {: #when-to-use}

- You are choosing a built-in assertion, generator, probe, or processor.
- You are validating a custom hook's configuration shape before publishing it.
- You are wiring an editor to surface inline validation per hook family.

## Schemas {: #files}

| Family | File | Catalog page |
|---|---|---|
| Assertions | [assertions.schema.json](assertions.schema.json) | [Assertions catalog](../../assertions/index.md) |
| Generators | [generators.schema.json](generators.schema.json) | [Generators catalog](../../generators/index.md) |
| Probes | [probes.schema.json](probes.schema.json) | [Probes catalog](../../probes/index.md) |
| Processors | [processors.schema.json](processors.schema.json) | [Processors catalog](../../processors/index.md) |

## Top-level shape {: #shape}

Every hook family schema is a `oneOf` discriminated by the hook simple name (for example `HttpStatus`, `RandomString`, `RedisReadiness`, `JsonFlattener`). Each entry contains:

- `Name` — user-defined identifier in the parent configuration.
- `<HookKind>` — selector that names the hook (for example `Assertion: HttpStatus`).
- `<HookKind>Configuration` — typed configuration block.

## Required fields {: #required}

All hook entries require `Name`, the hook selector key (for example `Assertion`, `Generator`), and the typed configuration block when the hook has required parameters.

## Minimal valid examples {: #minimal}

### Assertion {: #example-assertion}

```yaml
Assertions:
  - Name: HelloIs200
    Assertion: HttpStatus
    SessionNames: [HttpSession]
    AssertionConfiguration:
      OutputName: HelloPublisher
      ExpectedStatus: 200
```

### Generator {: #example-generator}

```yaml
DataSources:
  - Name: Names
    Generator: RandomString
    GeneratorConfiguration:
      Length: 8
```

### Probe {: #example-probe}

```yaml
Sessions:
  - Name: WaitForRedis
    Probes:
      - Name: RedisReadiness
        Probe: TcpReadiness
        ProbeConfiguration:
          Host: localhost
          Port: 6379
          TimeoutSeconds: 10
```

### Processor {: #example-processor}

```yaml
Processors:
  - Name: Flatten
    Processor: JsonFlattener
    ProcessorConfiguration:
      Separator: .
```

## Lookup rules {: #lookup}

- The hook selector is the **simple type name** unless the simple name is ambiguous across loaded assemblies; then use the full type name.
- Custom hooks must derive from the public SDK base class and ship the configuration type with a public parameterless constructor. See the custom authoring guides under each family.
- Collisions between simple names are resolved by listing the full type name in the YAML; see the [Custom assertion guide](../../assertions/custom-authoring-guide.md#registration).

## Common validation failures {: #failures}

| Symptom | JSONPath | Cause | Fix |
|---|---|---|---|
| Unknown discriminator value | `$.Assertions[0].Assertion` | Misspelled or unloaded hook | Match a name in the catalog or load the assembly |
| `*Configuration` not allowed | `$.Assertions[0].AssertionConfiguration` | Hook does not declare a configuration | Remove the block or use the right hook |
| Missing required property | `$.DataSources[0].GeneratorConfiguration.Length` | Required parameter omitted | Add the property |

## See also {: #see-also}

- [Public contract](../../qaas/public-contract.md)
- [Schemas index](index.md)
- [Custom assertion guide](../../assertions/custom-authoring-guide.md)
- [Custom generator guide](../../generators/custom-authoring-guide.md)
- [Custom probe guide](../../probes/custom-authoring-guide.md)
- [Custom processor guide](../../processors/custom-authoring-guide.md)
