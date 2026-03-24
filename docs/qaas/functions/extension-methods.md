# Extension Methods

This page collects public `Runner` extension methods that have XML documentation or explicit docs annotations.

Annotated extension methods continue to appear in their regular category pages; this page gives the extension surface a dedicated view.

## Configuration mutation

### `UpdateConfiguration<TConfiguration>`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationMutationExtensions.UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMutationExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/ConfigurationMutationExtensions.cs:15`
    
    **Signature**
    ```csharp
    public static TConfiguration UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration) where TConfiguration : class
    ```
    
    **Docstring**
    
    Forwards typed configuration updates to ConfigurationUpdateExtensions .

### `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationMutationExtensions.UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMutationExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/ConfigurationMutationExtensions.cs:26`
    
    **Signature**
    ```csharp
    public static IConfiguration UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)
    ```
    
    **Docstring**
    
    Forwards raw IConfiguration updates to ConfigurationUpdateExtensions .

## Context artifact

### `SetRenderedConfigurationTemplate`

??? info "Location, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.SetRenderedConfigurationTemplate(this Context context, string template)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs:22`
    
    **Signature**
    ```csharp
    public static void SetRenderedConfigurationTemplate(this Context context, string template)
    ```
    
    **Docstring**
    
    Saves the rendered runner configuration template for the current execution scope.

### `GetRenderedConfigurationTemplate`

??? info "Location, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.GetRenderedConfigurationTemplate(this Context context)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs:30`
    
    **Signature**
    ```csharp
    public static string? GetRenderedConfigurationTemplate(this Context context)
    ```
    
    **Docstring**
    
    Returns the rendered configuration template captured for the current execution scope, if one exists.

### `AppendSessionLog`

??? info "Location, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.AppendSessionLog(this Context context, string sessionName, string message)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs:39`
    
    **Signature**
    ```csharp
    public static void AppendSessionLog(this Context context, string sessionName, string message)
    ```
    
    **Docstring**
    
    Appends a session-scoped log line that can later be attached to reports.

### `GetSessionLog`

??? info "Location, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.GetSessionLog(this Context context, string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs:54`
    
    **Signature**
    ```csharp
    public static string? GetSessionLog(this Context context, string sessionName)
    ```
    
    **Docstring**
    
    Returns the concatenated session log text for a session, or null when nothing was captured.

## Date time

### `ConvertDateTimeToUtcByTimeZoneOffset`

??? info "Location, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/DateTimeExtensions.cs:25`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)
    ```
    
    **Docstring**
    
    Converts a local wall-clock value into UTC using a summer-time offset and optional DST override.

### `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset`

??? info "Location, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Location** `QaaS.Runner.Infrastructure/DateTimeExtensions.cs:51`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)
    ```
    
    **Docstring**
    
    Converts a UTC value into a local wall-clock value using a summer-time offset and optional DST override.

## Detailed data

### `AddIoMatchIndexToDetailedData<T>`

??? info "Location, signature, and docstring"
    **Member**
    `DetailedDataExtensions.AddIoMatchIndexToDetailedData<T>(this DetailedData<T> data, int index)`
    
    **Kind** `function`
    
    **Declaring Type** `DetailedDataExtensions (extension type)`
    
    **Location** `QaaS.Runner.Sessions/Extensions/DetailedDataExtensions.cs:11`
    
    **Signature**
    ```csharp
    public static DetailedData<T> AddIoMatchIndexToDetailedData<T>(this DetailedData<T> data, int index)
    ```
    
    **Docstring**
    
    Adds an index to a detailed data object

## Session

### `DisposeOfEnumerable<TEnumerable>`

??? info "Location, signature, and docstring"
    **Member**
    `SessionExtensions.DisposeOfEnumerable<TEnumerable>(this IEnumerable<TEnumerable>? enumerable, string enumerableName, ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionExtensions (extension type)`
    
    **Location** `QaaS.Runner.Sessions/Extensions/SessionExtensions.cs:17`
    
    **Signature**
    ```csharp
    public static void DisposeOfEnumerable<TEnumerable>(this IEnumerable<TEnumerable>? enumerable, string enumerableName, ILogger logger) where TEnumerable : IDisposable
    ```
    
    **Docstring**
    
    Disposes of an enumerable of items that extend the `IDisposable` interface

### `AppendActionFailure`

??? info "Location, signature, and docstring"
    **Member**
    `SessionExtensions.AppendActionFailure(this IList<ActionFailure> actionFailures, Exception exception, string sessionName, ILogger logger, string actionType, string actionRuntimeName, string? actionProtocol = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionExtensions (extension type)`
    
    **Location** `QaaS.Runner.Sessions/Extensions/SessionExtensions.cs:47`
    
    **Signature**
    ```csharp
    public static void AppendActionFailure(this IList<ActionFailure> actionFailures, Exception exception, string sessionName, ILogger logger, string actionType, string actionRuntimeName, string? actionProtocol = null)
    ```
    
    **Docstring**
    
    Appends a failed action to the action failure list, and logs accordingly.
