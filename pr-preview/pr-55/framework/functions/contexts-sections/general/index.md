# Contexts: General

> TL;DR — Reference page for Contexts: General.

This page mirrors the `General` section from [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md).

## `ResolveCaseLast`

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
