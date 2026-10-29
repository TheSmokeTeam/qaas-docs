# Contexts: Executions

> TL;DR — This page mirrors the `Executions` section from [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `SetExecutionId`

Source file, signature, and docstring

**Member** `ContextBuilder.SetExecutionId(string? executionId)`

**Kind** `function`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public IContextBuilder SetExecutionId(string? executionId)
```

**Docstring**

Sets the execution identifier stored on the built context.

The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md)
