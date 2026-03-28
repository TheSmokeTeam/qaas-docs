# Storages: Inspection

This page mirrors the `Inspection` section from [Storages](../storages.md).

## `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public IStorageConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
