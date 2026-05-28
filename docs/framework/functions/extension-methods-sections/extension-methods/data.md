---
id: framework.functions.extension.methods.sections.extension.methods.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, data]
summary: "Reference page for Extension Methods: Extension Methods / Data."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\ConfigurationMergeUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\IConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\PlaceholderConfigurationBuilderExtension.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\YamlConfigurationBuilderExtension.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUpdateExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\References\ConfigurationReferencesParser.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\CommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\ContextGlobalDictionaryExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataSourceExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\LoggingExetentions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningCommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningSessionDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\SessionDataExtensions.cs -->

# Extension Methods: Extension Methods / Data

> TL;DR — Reference page for Extension Methods: Extension Methods / Data.

This page mirrors the `Extension Methods / Data` section from [Extension Methods](../../extension-methods.md).

## `CastObjectData<TCasted>` {: #castobjectdata-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectData<TCasted>(this Data<object> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static Data<TCasted> CastObjectData<TCasted>(this Data<object> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException

## `CastToObjectData<TData>` {: #casttoobjectdata-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectData<TData>(this Data<TData> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static Data<object> CastToObjectData<TData>(this Data<TData> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of any type to a Data of type object, if the cast is not valid will throw InvalidCastException

## `CastObjectDetailedData<TCasted>` {: #castobjectdetaileddata-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TCasted> CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException

## `CastToObjectDetailedData<TData>` {: #casttoobjectdetaileddata-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<object> CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of any type to a DetailedData of type object, if the cast is not valid will throw InvalidCastException

## `FilterData<TData>` {: #filterdata-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter) where TData : class
    ```
    
    **Docstring**
    
    Filters the data of a detailed data item according to the given DataFilter

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
