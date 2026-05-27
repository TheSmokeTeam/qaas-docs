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

> TL;DR: Reference page for Executions: Storages.

This page mirrors the `Storages` section from [Executions](../executions.md).

## `AddStorage`

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateStorageAt`

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveStorageAt`

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
