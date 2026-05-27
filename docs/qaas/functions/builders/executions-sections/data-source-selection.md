---
id: qaas.functions.builders.executions.sections.data.source.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections, data, source, selection]
summary: "Reference page for Executions: Data source selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: Data source selection

> TL;DR — This page mirrors the `Data source selection` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddDataSource` {: #adddatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner execution builder instance.

### `UpdateDataSource` {: #updatedatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner execution builder instance.

### `RemoveDataSource` {: #removedatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner execution builder instance.

### `RemoveDataSourceAt` {: #removedatasourceat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveDataSourceAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveDataSourceAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source at the specified index from the current Runner execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
