---
id: framework.functions.builders.data.sources.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, data, sources, sections, configuration]
summary: "Reference page for Data Sources: Configuration."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs -->

# Data Sources: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Data Sources](../data-sources.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithSerializer` {: #withserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.WithSerializer(SerializeConfig serializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder WithSerializer(SerializeConfig serializeConfig)
    ```
    
    **Docstring**
    
    Sets the serializer configuration used by the current Framework data source builder instance.

### `WithDeserializer` {: #withdeserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder WithDeserializer(DeserializeConfig deserializeConfig)
    ```
    
    **Docstring**
    
    Sets the deserializer configuration used by the current Framework data source builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Data Sources](../data-sources.md)
