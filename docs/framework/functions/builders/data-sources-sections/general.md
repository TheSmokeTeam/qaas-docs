# Data Sources: General

This page mirrors the `General` section from [Data Sources](../data-sources.md).

## `IsLazy`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.IsLazy()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder IsLazy()
    ```
    
    **Docstring**
    
    Marks the data source for lazy resolution.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Replaces the generator configuration with the supplied object.
    
    The supplied object is serialized to JSON and loaded into the builder as the new generator configuration.

## `UpsertConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpsertConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder UpsertConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates or creates the generator configuration from the supplied object.
    
    This is an alias for UpdateConfiguration.

## `Register`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Register()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSource Register()
    ```
    
    **Docstring**
    
    Registers the configured data source definition and returns the resulting data source descriptor.
    
    Registration produces the immutable data-source descriptor that is later resolved against generator hooks during execution build.
