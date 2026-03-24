# Probes

Source-driven reference for `Runner` functions in the `Builders / Probes` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:83`
    
    **Signature**
    ```csharp
    public ProbeBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AtStage`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:96`
    
    **Signature**
    ```csharp
    public ProbeBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `HookNamed`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:109`
    
    **Signature**
    ```csharp
    public ProbeBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:122`
    
    **Signature**
    ```csharp
    public ProbeBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.CreateDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:137`
    
    **Signature**
    ```csharp
    public ProbeBuilder CreateDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source name entry on the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourceNames`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.ReadDataSourceNames()`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:149`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourceNames()
    ```
    
    **Docstring**
    
    Returns the configured data source names currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.UpdateDataSourceName(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:161`
    
    **Signature**
    ```csharp
    public ProbeBuilder UpdateDataSourceName(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source name stored on the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.DeleteDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:179`
    
    **Signature**
    ```csharp
    public ProbeBuilder DeleteDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:192`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Configures remove data source name on the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Probes'.

## `AddDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:204`
    
    **Signature**
    ```csharp
    public ProbeBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.CreateDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:219`
    
    **Signature**
    ```csharp
    public ProbeBuilder CreateDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source pattern entry on the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourcePatterns`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.ReadDataSourcePatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:231`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourcePatterns()
    ```
    
    **Docstring**
    
    Returns the configured data source patterns currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:243`
    
    **Signature**
    ```csharp
    public ProbeBuilder UpdateDataSourcePattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source pattern stored on the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.DeleteDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:261`
    
    **Signature**
    ```csharp
    public ProbeBuilder DeleteDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:274`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Configures remove data source pattern on the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Probes'.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:286`
    
    **Signature**
    ```csharp
    public ProbeBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.CreateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:300`
    
    **Signature**
    ```csharp
    public ProbeBuilder CreateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.Create(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:312`
    
    **Signature**
    ```csharp
    public ProbeBuilder Create(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:324`
    
    **Signature**
    ```csharp
    public IConfiguration ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:336`
    
    **Signature**
    ```csharp
    public ProbeBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ProbeBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:349`
    
    **Signature**
    ```csharp
    public ProbeBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
