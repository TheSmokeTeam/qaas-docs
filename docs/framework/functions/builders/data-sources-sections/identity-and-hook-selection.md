# Data Sources: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Data Sources](../data-sources.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `HookNamed`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
