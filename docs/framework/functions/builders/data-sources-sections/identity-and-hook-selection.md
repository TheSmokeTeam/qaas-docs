---
id: framework.functions.builders.data.sources.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, data, sources, sections, identity, and, hook, selection]
summary: "Reference page for Data Sources: Identity and hook selection."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs -->

# Data Sources: Identity and hook selection

> TL;DR — This page mirrors the `Identity and hook selection` section from [Data Sources](../data-sources.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Framework data source builder instance.

### `HookNamed` {: #hooknamed}

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`
    
    **Signature**
    ```csharp
    public DataSourceBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Framework data source builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Data Sources](../data-sources.md)
