---
id: qaas.functions.builders.collectors
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, collectors]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Collectors\CollectorBuilder.cs -->

# Collectors

> TL;DR — This page lists the public Runner functions in the `Collectors` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection {: #identity-and-hook-selection}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner collector builder instance.

## Collection helpers {: #collection-helpers}

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner collector builder instance.

## General {: #general}

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

## See also {: #see-also}

- [Runner Functions](../index.md)
