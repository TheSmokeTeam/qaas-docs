# Collectors: Inspection

This page mirrors the `Inspection` section from [Collectors](../collectors.md).

## `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public IFetcherConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
