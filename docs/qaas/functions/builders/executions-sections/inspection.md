# Executions: Inspection

This page mirrors the `Inspection` section from [Executions](../executions.md).

## `ReadMetaData`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadMetaData()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public MetaDataConfig? ReadMetaData()
    ```
    
    **Docstring**
    
    Returns the metadata currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
