# Assertions

Source-driven reference for `Runner` functions in the `Builders / Assertions` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `ReportOnlyStatuses`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReportOnlyStatuses(IList<AssertionStatus> statusesToReport)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:137`
    
    **Signature**
    ```csharp
    public AssertionBuilder ReportOnlyStatuses(IList<AssertionStatus> statusesToReport)
    ```
    
    **Docstring**
    
    Sets which assertion statuses should be included in reports.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithCategory`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WithCategory(string category)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:150`
    
    **Signature**
    ```csharp
    public AssertionBuilder WithCategory(string category)
    ```
    
    **Docstring**
    
    Configures category on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveSessionData`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveSessionData(bool weatherToSaveSessionData)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:163`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveSessionData(bool weatherToSaveSessionData)
    ```
    
    **Docstring**
    
    Configures whether session data is saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveLogs`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveLogs(bool weatherToSaveLogs)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:176`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveLogs(bool weatherToSaveLogs)
    ```
    
    **Docstring**
    
    Configures whether logs are saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveConfigurationTemplate`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:189`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate)
    ```
    
    **Docstring**
    
    Configures whether the rendered configuration template is saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSeverity`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WithSeverity(AssertionSeverity severity)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:202`
    
    **Signature**
    ```csharp
    public AssertionBuilder WithSeverity(AssertionSeverity severity)
    ```
    
    **Docstring**
    
    Sets the severity associated with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveAttachments`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveAttachments(bool weatherToSaveAttachments)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:215`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveAttachments(bool weatherToSaveAttachments)
    ```
    
    **Docstring**
    
    Configures whether attachments are saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToDisplayTrace`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToDisplayTrace(bool weatherToDisplayTrace)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:228`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToDisplayTrace(bool weatherToDisplayTrace)
    ```
    
    **Docstring**
    
    Configures whether the assertion trace is displayed with the result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Assertions'.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:241`
    
    **Signature**
    ```csharp
    public AssertionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `HookNamed`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:254`
    
    **Signature**
    ```csharp
    public AssertionBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:267`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:280`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source name entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourceNames`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadDataSourceNames()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:292`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourceNames()
    ```
    
    **Docstring**
    
    Returns the configured data source names currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateDataSourceName(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:304`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateDataSourceName(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source name stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:322`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:335`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:348`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source pattern entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourcePatterns`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadDataSourcePatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:360`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourcePatterns()
    ```
    
    **Docstring**
    
    Returns the configured data source patterns currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:372`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateDataSourcePattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source pattern stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:390`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddSessionName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.AddSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:403`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Adds the supplied session name to the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateSessionName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:416`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Creates or adds the configured session name entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadSessionNames`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadSessionNames()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:428`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadSessionNames()
    ```
    
    **Docstring**
    
    Returns the configured session names currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateSessionName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateSessionName(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:440`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateSessionName(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured session name stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteSessionName`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:463`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session name from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddSessionPattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.AddSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:476`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Adds the supplied session pattern to the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateSessionPattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:491`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured session pattern entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadSessionPatterns`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadSessionPatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:503`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadSessionPatterns()
    ```
    
    **Docstring**
    
    Returns the configured session patterns currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateSessionPattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateSessionPattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:515`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateSessionPattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured session pattern stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteSessionPattern`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:538`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Removes the configured session pattern from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddLink`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.AddLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:551`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied link to the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateLink`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:564`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured link entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadLinks`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadLinks()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:576`
    
    **Signature**
    ```csharp
    public IReadOnlyList<LinkBuilder> ReadLinks()
    ```
    
    **Docstring**
    
    Returns the configured links currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateLink`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateLink(string name, LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:588`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateLink(string name, LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Updates the configured link stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteLink`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteLink(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:606`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteLink(string name)
    ```
    
    **Docstring**
    
    Removes the configured link from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:619`
    
    **Signature**
    ```csharp
    public AssertionBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:633`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.Create(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:645`
    
    **Signature**
    ```csharp
    public AssertionBuilder Create(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:657`
    
    **Signature**
    ```csharp
    public IConfiguration ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:669`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:682`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
