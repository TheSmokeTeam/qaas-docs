---
id: qaas.migration.hooks
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [hooks, framework]
keywords: [migration, hooks, assertions, generators, probes, processors, constructor]
summary: "Update custom hooks for 2.x discovery: add a public parameterless constructor, keep the configuration POCO on the base class, and verify simple-type-name uniqueness."
---
# Migration: Hooks

> TL;DR — Custom hooks now require a public parameterless constructor and a configuration POCO bound through the base class generic. Simple type names must be unique within their family or a full type name is required at the call site.

## When to use {: #when-to-use}

- You authored a custom assertion, generator, probe, or processor against 1.x.
- Your hook used constructor injection of its configuration.

## C# (CAC) usage {: #csharp-usage}

### 1.x shape (before) {: #before}

```csharp
public class StatusAssertion : BaseAssertion
{
    private readonly StatusAssertionConfiguration _configuration;

    public StatusAssertion(StatusAssertionConfiguration configuration)
    {
        _configuration = configuration;
    }
}
```

### 2.x shape (after) {: #after}

```csharp
public class StatusAssertion : BaseAssertion<StatusAssertionConfiguration>
{
    public StatusAssertion() { }

    protected override AssertionResult AssertSession(SessionData sessionData)
    {
        var expected = Configuration.ExpectedStatus;
        return AssertionResult.Passed;
    }
}
```

## Edge cases {: #edge-cases}

- Two hooks with the same simple type name across different families do not collide. Two hooks with the same simple name in the same family must be referenced by their full type name in YAML.
- The configuration POCO is bound by the discovery layer, not by the constructor. Do not add additional constructor parameters.
- Sealed configuration types are supported. Records are supported when they declare a public parameterless constructor.

## See also {: #see-also}

- [Hook family schemas](../../assets/schemas/hook-family-schemas.md)
- [Custom-authoring guide for assertions](../../assertions/custom-authoring-guide.md)
- [Public contract](../public-contract.md)
