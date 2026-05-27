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

> TL;DR: Reference page for Contexts: General.

This page mirrors the `General` section from [Contexts](../contexts.md).

## `ResolveCaseLast`

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
