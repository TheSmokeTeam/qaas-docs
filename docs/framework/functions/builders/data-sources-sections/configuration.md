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

> TL;DR — Reference page for Data Sources: Configuration.

This page mirrors the `Configuration` section from [Data Sources](../data-sources.md).

## `WithSerializer` {: #withserializer}

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
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithDeserializer` {: #withdeserializer}

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
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
