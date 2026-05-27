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

> TL;DR — This page mirrors the `Executions` section from [Contexts](../contexts.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `SetExecutionId` {: #setexecutionid}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Contexts](../contexts.md)
