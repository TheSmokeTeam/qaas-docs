# Contexts: General

> TL;DR — This page mirrors the `General` section from [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `ResolveCaseLast`

Source file, signature, and docstring

**Member** `ContextBuilder.ResolveCaseLast()`

**Kind** `function`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public IContextBuilder ResolveCaseLast()
```

**Docstring**

Delays case-file application until after reference resolution has completed.

This changes resolution order so the case overlay is applied after references are expanded from the base configuration and overwrites.

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md)
