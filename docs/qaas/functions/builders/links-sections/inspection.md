# Links: Inspection

This page mirrors the `Inspection` section from [Links](../links.md).

## `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public ILinkConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
