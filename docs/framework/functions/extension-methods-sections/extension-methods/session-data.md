---
id: framework.functions.extension.methods.sections.extension.methods.session.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, session, data]
summary: "Reference page for Extension Methods: Extension Methods / Session data."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\SessionDataExtensions.cs -->
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
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataSourceExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\LoggingExetentions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningCommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningSessionDataExtensions.cs -->

# Extension Methods: Extension Methods / Session data

> TL;DR — Reference page for Extension Methods: Extension Methods / Session data.

This page mirrors the `Extension Methods / Session data` section from [Extension Methods](../../extension-methods.md).

## `GetSessionDataByName<TInput, TOutput>` {: #getsessiondatabyname-tinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static GenericSessionData<TInput, TOutput> GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)
    ```
    
    **Docstring**
    
    Retrieves a SessionData from an enumerable of SessionData by its name

## `GetInputByName<TInput, TOutput>` {: #getinputbyname-tinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TInput> GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData from SessionData by its name

## `TryGetInputByName<TInput, TOutput>` {: #trygetinputbyname-tinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

## `GetOutputByName<TInput, TOutput>` {: #getoutputbyname-tinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)
    ```
    
    **Docstring**
    
    Retrieves an output CommunicationData from SessionData by its name

## `TryGetOutputByName<TInput, TOutput>` {: #trygetoutputbyname-tinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
