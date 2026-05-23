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

# Extension Methods: Date time

> TL;DR — This page mirrors the `Date time` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
