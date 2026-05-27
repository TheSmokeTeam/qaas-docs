---
id: mocker.functions.builders.executions.sections.executions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections]
summary: "Reference page for Executions: Executions."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->

# Executions: Executions

> TL;DR — This page mirrors the `Executions` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `ExecutionBuilder` {: #executionbuilder}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder()`
    
    **Kind** `constructor`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder()
    ```
    
    **Docstring**
    
    Creates a new Mocker execution builder with an empty default context.
    
    Use this constructor when bootstrapping a mocker execution entirely in code before any configuration or runtime services have been attached.

### `WithExecutionMode` {: #withexecutionmode}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithExecutionMode(ExecutionMode executionMode)
    ```
    
    **Docstring**
    
    Sets the execution mode used by the resulting mocker runtime.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
