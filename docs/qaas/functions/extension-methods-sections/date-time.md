---
id: qaas.functions.extension.methods.sections.date.time
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, extension, methods, sections, date, time]
summary: "Reference page for Extension Methods: Date time."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\ContextArtifactExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\DetailedDataExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\SessionExtensions.cs -->

# Extension Methods: Date time

> TL;DR — Reference page for Extension Methods: Date time.

This page mirrors the `Date time` section from [Extension Methods](../extension-methods.md).

## `ConvertDateTimeToUtcByTimeZoneOffset` {: #convertdatetimetoutcbytimezoneoffset}

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

## `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset` {: #convertdatetimefromutctotimezonebytimezoneoffset}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
