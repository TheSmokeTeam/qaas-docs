---
id: framework.functions.builders.data.sources.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, data, sources, sections, general]
summary: "Reference page for Data Sources: General."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs -->

# Data Sources: General

> TL;DR — This page mirrors the `General` section from [Data Sources](../data-sources.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `IsLazy` {: #islazy}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.IsLazy()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder IsLazy()
    ```
    
    **Docstring**
    
    Marks the data source for lazy resolution.

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Replaces the generator configuration with the supplied object.
    
    The supplied object is serialized to JSON and loaded into the builder as the new generator configuration.

### `Register` {: #register}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Register()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSource Register()
    ```
    
    **Docstring**
    
    Registers the configured data source definition and returns the resulting data source descriptor.
    
    Registration produces the immutable data-source descriptor that is later resolved against generator hooks during execution build.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Data Sources](../data-sources.md)
