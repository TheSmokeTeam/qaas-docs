# Storages: Collection helpers

This page mirrors the `Collection helpers` section from [Storages](../storages.md).

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
