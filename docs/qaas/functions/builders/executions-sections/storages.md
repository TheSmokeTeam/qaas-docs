# Executions: Storages

This page mirrors the `Storages` section from [Executions](../executions.md).

## `CreateStorage`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateStorage(StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateStorage(StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured storage entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadStorages`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadStorages()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<StorageBuilder> ReadStorages()
    ```
    
    **Docstring**
    
    Returns the configured storages currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadStorageAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadStorageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder? ReadStorageAt(int index)
    ```
    
    **Docstring**
    
    Returns the configured storage currently stored at the specified index on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

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

## `DeleteStorageAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteStorageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteStorageAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured storage at the specified index from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
