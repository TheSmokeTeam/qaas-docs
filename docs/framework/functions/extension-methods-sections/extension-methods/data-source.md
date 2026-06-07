---
id: framework.functions.extension.methods.sections.extension.methods.data.source
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, data, source]
summary: "Reference page for Extension Methods: Extension Methods / Data source."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataSourceExtensions.cs -->

# Extension Methods: Extension Methods / Data source

> TL;DR — This page mirrors the `Extension Methods / Data source` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `GetDataSourceByName` {: #getdatasourcebyname}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceExtensions.GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`
    
    **Signature**
    ```csharp
    public static DataSource GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)
    ```
    
    **Docstring**
    
    Retrieves a DataSource from an enumerable of DataSources by its name

### `RetrieveAndCast<TCastTo>` {: #retrieveandcast-tcastto}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceExtensions.RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`
    
    **Signature**
    ```csharp
    public static IEnumerable<Data<TCastTo>> RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)
    ```
    
    **Docstring**
    
    Casts a DataSource to a different type

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
