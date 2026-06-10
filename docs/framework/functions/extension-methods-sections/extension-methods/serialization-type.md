---
id: framework.functions.extension.methods.sections.extension.methods.serialization.type
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [framework]
keywords: [framework, reference]
summary: "Reference page for Extension Methods: Extension Methods / Serialization type."
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

# Extension Methods: Extension Methods / Serialization type

> TL;DR — This page mirrors the `Extension Methods / Serialization type` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `BuildSerializer` {: #buildserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `SerializationTypeExtensions.BuildSerializer(this SerializationType serializationType)`
    
    **Kind** `function`
    
    **Declaring Type** `SerializationTypeExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationTypeExtensions.cs`
    
    **Signature**
    ```csharp
    public static ISerializer BuildSerializer(this SerializationType serializationType)
    ```
    
    **Docstring**
    
    Builds the serializer that matches this serialization type
    
    Example: `var serializer = SerializationType.Yaml.BuildSerializer();`

### `BuildDeserializer` {: #builddeserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `SerializationTypeExtensions.BuildDeserializer(this SerializationType serializationType)`
    
    **Kind** `function`
    
    **Declaring Type** `SerializationTypeExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Serialization/SerializationTypeExtensions.cs`
    
    **Signature**
    ```csharp
    public static IDeserializer BuildDeserializer(this SerializationType serializationType)
    ```
    
    **Docstring**
    
    Builds the deserializer that matches this serialization type
    
    Example: `var deserializer = SerializationType.Yaml.BuildDeserializer();`

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
