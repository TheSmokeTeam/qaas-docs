---
id: qaas.functions.builders.executions.sections.executions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections]
summary: "Reference page for Executions: Executions."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: Executions

> TL;DR — This page mirrors the `Executions` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `ExecutionType` {: #executiontype}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ExecutionType(ExecutionType executionType)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ExecutionType(ExecutionType executionType)
    ```
    
    **Docstring**
    
    Sets the execution type used when the runner execution is built.

### `SetExecutionId` {: #setexecutionid}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetExecutionId(string executionId)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetExecutionId(string executionId)
    ```
    
    **Docstring**
    
    Sets the execution identifier stored on the built context.
    
    The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
