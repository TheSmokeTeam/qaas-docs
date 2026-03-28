# Storages: General

This page mirrors the `General` section from [Storages](../storages.md).

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.Configure(IStorageConfig storageConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder Configure(IStorageConfig storageConfig)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
