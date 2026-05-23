---
id: qaas.functions.builders.probes.sections.data.source.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, probes, sections, data, source, selection]
summary: "Reference page for Probes: Data source selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Probes\ProbeBuilder.cs -->

# Probes: Data source selection

> TL;DR — This page mirrors the `Data source selection` section from [Probes](../probes.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddDataSourceName` {: #adddatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Runner probe builder instance.

### `RemoveDataSourceName` {: #removedatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Runner probe builder instance.

### `RemoveDataSourceNameAt` {: #removedatasourcenameat}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveDataSourceNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveDataSourceNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source name at the specified index from the current Runner probe builder instance.

### `AddDataSourcePattern` {: #adddatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner probe builder instance.

### `RemoveDataSourcePattern` {: #removedatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner probe builder instance.

### `RemoveDataSourcePatternAt` {: #removedatasourcepatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveDataSourcePatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveDataSourcePatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern at the specified index from the current Runner probe builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Probes](../probes.md)
