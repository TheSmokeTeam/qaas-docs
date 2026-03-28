# Data Sources: Inspection

This page mirrors the `Inspection` section from [Data Sources](../data-sources.md).

## `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public IConfiguration ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
