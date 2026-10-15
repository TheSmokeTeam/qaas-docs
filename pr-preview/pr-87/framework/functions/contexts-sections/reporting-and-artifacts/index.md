# Contexts: Reporting and artifacts

> TL;DR — This page mirrors the `Reporting and artifacts` section from [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `SetLogger`

Source file, signature, and docstring

**Member** `ContextBuilder.SetLogger(ILogger logger)`

**Kind** `function`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public IContextBuilder SetLogger(ILogger logger)
```

**Docstring**

Sets the logger stored on the built context.

The configured logger becomes the logger used by the context itself and by runtime components resolved from that context.

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md)
