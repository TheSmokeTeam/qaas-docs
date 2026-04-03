# Data Sources: Collection helpers

This page mirrors the `Collection helpers` section from [Data Sources](../data-sources.md).

## `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpdateConfiguration(...)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder UpdateConfiguration(...)
    ```
    
    **Docstring**
    
    Clears the current generator configuration.
    
    After this call, the builder holds an empty configuration until a new one is supplied.

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
