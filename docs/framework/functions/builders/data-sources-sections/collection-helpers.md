---
id: framework.functions.builders.data.sources.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, data, sources, sections, collection, helpers]
summary: "Reference page for Data Sources: Collection helpers."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs -->

# Data Sources: Collection helpers

> TL;DR — This page mirrors the `Collection helpers` section from [Data Sources](../data-sources.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `RemoveConfiguration` {: #removeconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.RemoveConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder RemoveConfiguration()
    ```
    
    **Docstring**
    
    Clears the current generator configuration.
    
    After this call, the builder holds an empty configuration until a new one is supplied.

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Merges the supplied patch into the generator configuration stored on the current Framework data source builder instance.
    
    Use this method when only part of the generator configuration should change. Fields omitted from the patch are preserved from the current GeneratorConfiguration tree.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Data Sources](../data-sources.md)
