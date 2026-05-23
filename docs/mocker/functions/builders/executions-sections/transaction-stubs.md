---
id: mocker.functions.builders.executions.sections.transaction.stubs
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections, transaction, stubs]
summary: "Reference page for Executions: Transaction stubs."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->

# Executions: Transaction stubs

> TL;DR — This page mirrors the `Transaction stubs` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddStub` {: #addstub}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStub(TransactionStubBuilder stubBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStub(TransactionStubBuilder stubBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied stub to the current Mocker execution builder instance.

### `AddStub` {: #addstub_1}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStub(TransactionStubConfig stubConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStub(TransactionStubConfig stubConfig)
    ```
    
    **Docstring**
    
    Adds the supplied stub to the current Mocker execution builder instance.

### `UpdateStub` {: #updatestub}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, TransactionStubBuilder stubBuilder)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.

### `UpdateStub` {: #updatestub_1}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, TransactionStubConfig stubConfig)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.

### `RemoveStubAt` {: #removestubat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveStubAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveStubAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured stub at the specified index from the current Mocker execution builder instance.

### `RemoveStub` {: #removestub}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveStub(string stubName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveStub(string stubName)
    ```
    
    **Docstring**
    
    Removes the configured stub from the current Mocker execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
