---
id: qaas.functions.extension-methods
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, extension, methods]
summary: "This page collects public Runner extension methods that have XML documentation or explicit docs annotations."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\ContextArtifactExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\DetailedDataExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\SessionExtensions.cs -->

# Extension Methods

> TL;DR — This page lists the public Runner extension methods generated from XML documentation.

## When to use {: #when-to-use}

Use this page when you need extension-method signatures and doc comments for the Runner API surface.

This page collects public `Runner` extension methods that have XML documentation or explicit docs annotations.

Annotated extension methods continue to appear in their regular category pages; this page gives the extension surface a dedicated view.

## Context artifact {: #context-artifact}

### `SetRenderedConfigurationTemplate` {: #setrenderedconfigurationtemplate}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.SetRenderedConfigurationTemplate(this Context context, string template)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static void SetRenderedConfigurationTemplate(this Context context, string template)
    ```
    
    **Docstring**
    
    Saves the rendered runner configuration template for the current execution scope.

### `GetRenderedConfigurationTemplate` {: #getrenderedconfigurationtemplate}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.GetRenderedConfigurationTemplate(this Context context)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static string? GetRenderedConfigurationTemplate(this Context context)
    ```
    
    **Docstring**
    
    Returns the rendered configuration template captured for the current execution scope, if one exists.

### `AppendSessionLog` {: #appendsessionlog}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.AppendSessionLog(this Context context, string sessionName, string message)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static void AppendSessionLog(this Context context, string sessionName, string message)
    ```
    
    **Docstring**
    
    Appends a session-scoped log line that can later be attached to reports.

### `GetSessionLog` {: #getsessionlog}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.GetSessionLog(this Context context, string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static string? GetSessionLog(this Context context, string sessionName)
    ```
    
    **Docstring**
    
    Returns the concatenated session log text for a session, or null when nothing was captured.

## Date time {: #date-time}

### `ConvertDateTimeToUtcByTimeZoneOffset` {: #convertdatetimetoutcbytimezoneoffset}

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
    ```
    
    **Docstring**
    
    Converts a local wall-clock value into UTC using a summer-time offset and optional DST override.

### `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset` {: #convertdatetimefromutctotimezonebytimezoneoffset}

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
    ```
    
    **Docstring**
    
    Converts a UTC value into a local wall-clock value using a summer-time offset and optional DST override.

## Detailed data {: #detailed-data}

### `AddIoMatchIndexToDetailedData<T>` {: #addiomatchindextodetaileddatat}

??? info "Source file, signature, and docstring"
    **Member**
    `DetailedDataExtensions.AddIoMatchIndexToDetailedData<T>(this DetailedData<T> data, int index)`
    
    **Kind** `function`
    
    **Declaring Type** `DetailedDataExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Sessions/Extensions/DetailedDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<T> AddIoMatchIndexToDetailedData<T>(this DetailedData<T> data, int index)
    ```
    
    **Docstring**
    
    Adds an index to a detailed data object

## Session {: #session}

### `DisposeOfEnumerable<TEnumerable>` {: #disposeofenumerabletenumerable}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionExtensions.DisposeOfEnumerable<TEnumerable>(this IEnumerable<TEnumerable>? enumerable, string enumerableName, ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Sessions/Extensions/SessionExtensions.cs`
    
    **Signature**
    ```csharp
    public static void DisposeOfEnumerable<TEnumerable>(this IEnumerable<TEnumerable>? enumerable, string enumerableName, ILogger logger) where TEnumerable : IDisposable
    ```
    
    **Docstring**
    
    Disposes of an enumerable of items that extend the `IDisposable` interface

### `AppendActionFailure` {: #appendactionfailure}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionExtensions.AppendActionFailure(this IList<ActionFailure> actionFailures, Exception exception, string sessionName, ILogger logger, string actionType, string actionRuntimeName, string? actionProtocol = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Sessions/Extensions/SessionExtensions.cs`
    
    **Signature**
    ```csharp
    public static void AppendActionFailure(this IList<ActionFailure> actionFailures, Exception exception, string sessionName, ILogger logger, string actionType, string actionRuntimeName, string? actionProtocol = null)
    ```
    
    **Docstring**
    
    Appends a failed action to the action failure list, and logs accordingly.

## See also {: #see-also}

- [Runner Functions](index.md)
