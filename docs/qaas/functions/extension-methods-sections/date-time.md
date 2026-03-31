# Extension Methods: Date time

This page mirrors the `Date time` section from [Extension Methods](../extension-methods.md).

## `ConvertDateTimeToUtcByTimeZoneOffset`

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)
    ```
    
    **Docstring**
    
    Converts a local wall-clock value into UTC using a summer-time offset and optional DST override.

## `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset`

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)
    ```
    
    **Docstring**
    
    Converts a UTC value into a local wall-clock value using a summer-time offset and optional DST override.
