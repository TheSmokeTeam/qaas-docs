---
id: framework.functions.contexts.sections.reporting.and.artifacts
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, contexts, sections, reporting, and, artifacts]
summary: "Reference page for Contexts: Reporting and artifacts."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\ContextObjects\ContextBuilder.cs -->

# Contexts: Reporting and artifacts

> TL;DR: Reference page for Contexts: Reporting and artifacts.

This page mirrors the `Reporting and artifacts` section from [Contexts](../contexts.md).

## `SetLogger` {: #setlogger}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.SetLogger(ILogger logger)`
    
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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
