---
id: qaas.functions.builders.assertions.sections.data.source.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, assertions, sections, data, source, selection]
summary: "Reference page for Assertions: Data source selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\AssertionBuilder.cs -->

# Assertions: Data source selection

> TL;DR — This page mirrors the `Data source selection` section from [Assertions](../assertions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddDataSourceName` {: #adddatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Runner assertion builder instance.

### `RemoveDataSourceName` {: #removedatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Runner assertion builder instance.

### `RemoveDataSourceNameAt` {: #removedatasourcenameat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourceNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourceNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source name at the specified index from the current Runner assertion builder instance.

### `AddDataSourcePattern` {: #adddatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner assertion builder instance.

### `RemoveDataSourcePattern` {: #removedatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner assertion builder instance.

### `RemoveDataSourcePatternAt` {: #removedatasourcepatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourcePatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourcePatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern at the specified index from the current Runner assertion builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Assertions](../assertions.md)
