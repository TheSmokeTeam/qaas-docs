---
id: qaas.functions.builders.executions.sections.storages
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections, storages]
summary: "Reference page for Executions: Storages."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: Storages

> TL;DR — This page mirrors the `Storages` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddStorage` {: #addstorage}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStorage(StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStorage(StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied storage to the current Runner execution builder instance.

### `UpdateStorageAt` {: #updatestorageat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStorageAt(int index, StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStorageAt(int index, StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Updates the configured storage at the specified index on the current Runner execution builder instance.

### `RemoveStorageAt` {: #removestorageat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveStorageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveStorageAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured storage at the specified index from the current Runner execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
