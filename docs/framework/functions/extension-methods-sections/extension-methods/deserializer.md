---
id: framework.functions.extension.methods.sections.extension.methods.deserializer
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [framework]
keywords: [framework, reference]
summary: "Reference page for Extension Methods: Extension Methods / Deserializer."
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

# Extension Methods: Extension Methods / Deserializer

> TL;DR — This page mirrors the `Extension Methods / Deserializer` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `Deserialize<TResult>` {: #deserialize-tresult}

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.Deserialize<TResult>(this IDeserializer deserializer, byte[]? data)`
    
    **Kind** `function`
    
    **Declaring Type** `DeserializerExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`
    
    **Signature**
    ```csharp
    public static TResult? Deserialize<TResult>(this IDeserializer deserializer, byte[]? data)
    ```
    
    **Docstring**
    
    Deserializes the given byte[] directly to instead of object, removing the need to pass a Type instance and cast the result manually
    
    Example: `Order? order = deserializer.Deserialize<Order>(payload);`

### `DeserializeFromString<TResult>` {: #deserializefromstring-tresult}

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.DeserializeFromString<TResult>(this IDeserializer deserializer, string? data)`
    
    **Kind** `function`
    
    **Declaring Type** `DeserializerExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`
    
    **Signature**
    ```csharp
    public static TResult? DeserializeFromString<TResult>(this IDeserializer deserializer, string? data)
    ```
    
    **Docstring**
    
    Deserializes the given UTF-8 string directly to , most useful for the text based formats (Json, Yaml, Xml, XmlElement)
    
    Example: `Order? order = SerializationType.Json.BuildDeserializer().DeserializeFromString<Order>(json);`

### `DeserializeFromString` {: #deserializefromstring}

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.DeserializeFromString(this IDeserializer deserializer, string? data, Type? deserializeType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DeserializerExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`
    
    **Signature**
    ```csharp
    public static object? DeserializeFromString(this IDeserializer deserializer, string? data, Type? deserializeType = null)
    ```
    
    **Docstring**
    
    Deserializes the given UTF-8 string to an object, most useful for the text based formats (Json, Yaml, Xml, XmlElement)
    
    Example: `object? parsed = deserializer.DeserializeFromString(json, typeof(Order));`

### `TryDeserialize<TResult>` {: #trydeserialize-tresult}

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.TryDeserialize<TResult>(this IDeserializer deserializer, byte[]? data, out TResult? deserialized)`
    
    **Kind** `function`
    
    **Declaring Type** `DeserializerExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryDeserialize<TResult>(this IDeserializer deserializer, byte[]? data, out TResult? deserialized)
    ```
    
    **Docstring**
    
    Attempts to deserialize the given byte[] directly to , never throws
    
    Example: `if (deserializer.TryDeserialize<Order>(payload, out var order)) { ... }`

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
