---
id: framework.functions.extension.methods.sections.extension.methods.date.time
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, date, time]
summary: "Reference page for Extension Methods: Extension Methods / Date time."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.Infrastructure\DateTimeExtensions.cs -->

# Extension Methods: Extension Methods / Date time

> TL;DR — This page mirrors the `Extension Methods / Date time` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `ConvertDateTimeToUtcByTimeZoneOffset` {: #convertdatetimetoutcbytimezoneoffset}

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
    ```
    
    **Docstring**
    
    converts the given time to utc based on the timezone offset in summer time given

### `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset` {: #convertdatetimefromutctotimezonebytimezoneoffset}

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
    ```
    
    **Docstring**
    
    adds a timezone offset to the given utc time based on the timezone offset in summer time given

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
