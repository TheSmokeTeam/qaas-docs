---
id: framework.functions.extension.methods.sections.extension.methods.serializer
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [framework]
keywords: [framework, reference]
summary: "Reference page for Extension Methods: Extension Methods / Serializer."
---

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
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\SessionDataExtensions.cs -->

# Extension Methods: Extension Methods / Serializer

> TL;DR — This page mirrors the `Extension Methods / Serializer` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `SerializeToString` {: #serializetostring}

??? info "Source file, signature, and docstring"
    **Member**
    `SerializerExtensions.SerializeToString(this ISerializer serializer, object? data)`
    
    **Kind** `function`
    
    **Declaring Type** `SerializerExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`
    
    **Signature**
    ```csharp
    public static string? SerializeToString(this ISerializer serializer, object? data)
    ```
    
    **Docstring**
    
    Serializes the given data and returns the result as a UTF-8 string, most useful for the text based formats (Json, Yaml, Xml, XmlElement)
    
    Example: `string? json = SerializationType.Json.BuildSerializer().SerializeToString(order);`

### `TrySerialize` {: #tryserialize}

??? info "Source file, signature, and docstring"
    **Member**
    `SerializerExtensions.TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)`
    
    **Kind** `function`
    
    **Declaring Type** `SerializerExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)
    ```
    
    **Docstring**
    
    Attempts to serialize the given data, never throws
    
    Example: `if (serializer.TrySerialize(order, out var payload)) { ... }`

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
