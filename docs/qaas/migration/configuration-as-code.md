---
id: qaas.migration.configuration-as-code
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [framework]
keywords: [migration, cac, configuration-as-code, builders]
summary: "Update configuration-as-code call sites to 2.x builder names that map one-to-one with YAML keys."
---
# Migration: Configuration as code

> TL;DR — Builder method names now mirror YAML keys exactly. Rename legacy fluent calls and rely on `WithDataSourceNames`, `WithStage`, and `WithProbes` instead of inline data-source factories.

## When to use {: #when-to-use}

- You construct test definitions in C# using the builder API.
- Your existing code uses 1.x-era method names that no longer exist.

## C# (CAC) usage {: #csharp-usage}

### 1.x shape (before) {: #before}

```csharp
var session = SessionBuilder.New("Checkout")
    .Publisher(p => p
        .WithFileSystemDataSource("Fixtures/orders")
        .WithHttp("http://localhost:5000/orders"));
```

### 2.x shape (after) {: #after}

```csharp
var orders = DataSourceBuilder
    .New("Orders")
    .WithGenerator("FromFileSystem")
    .WithFileSystemPath("Fixtures/orders");

var session = SessionBuilder
    .New("Checkout")
    .WithStage(2)
    .WithPublisher(p => p
        .Named("SendOrder")
        .WithDataSourceNames("Orders")
        .WithHttp(h => h.WithUrl("http://localhost:5000/orders")));
```

## Edge cases {: #edge-cases}

- Mixing 1.x inline factories with 2.x `WithDataSourceNames` causes a build-time error in the resolver. Pick one shape per project.
- `WithParallelism(int)` requires a value of at least `1`. Zero or negative values are rejected.
- The configuration POCO produced by `Build()` is the same shape as the YAML; round-tripping through `template` is supported.

## See also {: #see-also}

- [Runner YAML migration](runner-yaml.md)
- [Public contract](../public-contract.md)
