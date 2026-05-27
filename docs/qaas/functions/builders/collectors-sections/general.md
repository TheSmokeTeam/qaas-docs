---
id: qaas.functions.builders.collectors.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, collectors, sections, general]
summary: "Reference page for Collectors: General."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Collectors\CollectorBuilder.cs -->

# Collectors: General

> TL;DR — This page mirrors the `General` section from [Collectors](../collectors.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `FilterData` {: #filterdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner collector builder instance.

### `CollectInRange` {: #collectinrange}

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.CollectInRange(CollectionRange collectionRange)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder CollectInRange(CollectionRange collectionRange)
    ```
    
    **Docstring**
    
    Configures collect in range on the current Runner collector builder instance.

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.Configure(IFetcherConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder Configure(IFetcherConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner collector builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Collectors](../collectors.md)
