# Data Sources: Collection helpers

This page mirrors the `Collection helpers` section from [Data Sources](../data-sources.md).

## `CreateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.CreateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder CreateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Creates the generator configuration from the supplied object.
    
    This is an alias for Configure and replaces any existing generator configuration.

## `Create`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Create(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Create(object configuration)
    ```
    
    **Docstring**
    
    Creates the generator configuration from the supplied object.
    
    This is a shorthand alias for CreateConfiguration.

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
