# Assertions: Data source selection

This page mirrors the `Data source selection` section from [Assertions](../assertions.md).

## `CreateDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source name entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourceNames`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadDataSourceNames()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourceNames()
    ```
    
    **Docstring**
    
    Returns the configured data source names currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateDataSourceName(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateDataSourceName(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source name stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourcePattern`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source pattern entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourcePatterns`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadDataSourcePatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourcePatterns()
    ```
    
    **Docstring**
    
    Returns the configured data source patterns currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourcePattern`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateDataSourcePattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source pattern stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveDataSourcePattern`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
