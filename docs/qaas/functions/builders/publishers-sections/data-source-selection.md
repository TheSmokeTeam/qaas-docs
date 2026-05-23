---
id: qaas.functions.builders.publishers.sections.data.source.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, publishers, sections, data, source, selection]
summary: "Reference page for Publishers: Data source selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Publishers\Builders\PublisherBuilderLogic.cs -->

# Publishers: Data source selection

> TL;DR — This page mirrors the `Data source selection` section from [Publishers](../publishers.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddDataSource` {: #adddatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.AddDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder AddDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner publisher builder instance.

### `UpdateDataSource` {: #updatedatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateDataSource(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateDataSource(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner publisher builder instance.

### `RemoveDataSource` {: #removedatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.RemoveDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder RemoveDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner publisher builder instance.

### `RemoveDataSourceAt` {: #removedatasourceat}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.RemoveDataSourceAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder RemoveDataSourceAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source at the specified index from the current Runner publisher builder instance.

### `AddDataSourcePattern` {: #adddatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner publisher builder instance.

### `UpdateDataSourcePattern` {: #updatedatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateDataSourcePattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source pattern stored on the current Runner publisher builder instance.

### `RemoveDataSourcePattern` {: #removedatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner publisher builder instance.

### `RemoveDataSourcePatternAt` {: #removedatasourcepatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.RemoveDataSourcePatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder RemoveDataSourcePatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern at the specified index from the current Runner publisher builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Publishers](../publishers.md)
