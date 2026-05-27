---
id: framework.functions.contexts.sections.executions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, contexts, sections, executions]
summary: "Reference page for Contexts: Executions."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\ContextObjects\ContextBuilder.cs -->

# Contexts: Executions

> TL;DR: Reference page for Contexts: Executions.

This page mirrors the `Executions` section from [Contexts](../contexts.md).

## `SetExecutionId`

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.SetExecutionId(string? executionId)`
    
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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
