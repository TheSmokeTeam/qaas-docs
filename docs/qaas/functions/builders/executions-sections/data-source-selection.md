# Executions: Data source selection

This page mirrors the `Data source selection` section from [Executions](../executions.md).

## `AddDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSources`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadDataSources()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<DataSourceBuilder> ReadDataSources()
    ```
    
    **Docstring**
    
    Returns the configured data sources currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
