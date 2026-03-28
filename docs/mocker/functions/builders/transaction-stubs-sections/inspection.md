# Transaction Stubs: Inspection

This page mirrors the `Inspection` section from [Transaction Stubs](../transaction-stubs.md).

## `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public IConfiguration ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
