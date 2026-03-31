# Data Sources: Collection helpers

This page mirrors the `Collection helpers` section from [Data Sources](../data-sources.md).

## `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder DeleteConfiguration()
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
    
    Merges the supplied object into the current generator configuration.
    
    Use this when only part of the generator configuration should change and existing values should be preserved where possible.
