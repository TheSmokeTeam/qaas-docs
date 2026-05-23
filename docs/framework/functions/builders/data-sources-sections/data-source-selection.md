---
id: framework.functions.builders.data.sources.sections.data.source.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, data, sources, sections, source, selection]
summary: "Reference page for Data Sources: Data source selection."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs -->

# Data Sources: Data source selection

> TL;DR — This page mirrors the `Data source selection` section from [Data Sources](../data-sources.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddDataSourceName` {: #adddatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Framework data source builder instance.

### `RemoveDataSourceName` {: #removedatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Framework data source builder instance.

### `RemoveDataSourceNameAt` {: #removedatasourcenameat}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.RemoveDataSourceNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder RemoveDataSourceNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source name at the specified index from the current Framework data source builder instance.

### `AddDataSourcePattern` {: #adddatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Framework data source builder instance.

### `RemoveDataSourcePattern` {: #removedatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Framework data source builder instance.

### `RemoveDataSourcePatternAt` {: #removedatasourcepatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.RemoveDataSourcePatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder RemoveDataSourcePatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern at the specified index from the current Framework data source builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Data Sources](../data-sources.md)
