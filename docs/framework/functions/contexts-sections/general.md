---
id: framework.functions.contexts.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, contexts, sections, general]
summary: "Reference page for Contexts: General."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\ContextObjects\ContextBuilder.cs -->

# Contexts: General

> TL;DR — This page mirrors the `General` section from [Contexts](../contexts.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `ResolveCaseLast` {: #resolvecaselast}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.ResolveCaseLast()`
    
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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Contexts](../contexts.md)
