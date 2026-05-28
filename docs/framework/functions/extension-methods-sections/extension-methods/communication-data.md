---
id: framework.functions.extension.methods.sections.extension.methods.communication.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, communication, data]
summary: "Reference page for Extension Methods: Extension Methods / Communication data."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\CommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\ConfigurationMergeUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\IConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\PlaceholderConfigurationBuilderExtension.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\YamlConfigurationBuilderExtension.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUpdateExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\References\ConfigurationReferencesParser.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\ContextGlobalDictionaryExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataSourceExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\LoggingExetentions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningCommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningSessionDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\SessionDataExtensions.cs -->

# Extension Methods: Extension Methods / Communication data

> TL;DR — Reference page for Extension Methods: Extension Methods / Communication data.

This page mirrors the `Extension Methods / Communication data` section from [Extension Methods](../../extension-methods.md).

## `GetCommunicationDataByName<TData>` {: #getcommunicationdatabyname-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TData> GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Retrieves a CommunicationData from an enumerable of CommunicationData by its name

## `CastCommunicationData<TCastTo>` {: #castcommunicationdata-tcastto}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TCastTo> CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Casts a CommunicationData to a different type

## `GetDataByIoMatchIndex<TData>` {: #getdatabyiomatchindex-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)
    ```
    
    **Docstring**
    
    Retrieves data by its IoMatchIndex from a CommunicationData object

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
