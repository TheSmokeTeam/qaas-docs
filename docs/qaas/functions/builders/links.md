---
id: qaas.functions.builders.links
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, links]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\LinkBuilder.cs -->

# Links

> TL;DR — This page lists the public Runner functions in the `Links` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection {: #identity-and-hook-selection}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner link builder instance.

## Collection helpers {: #collection-helpers}

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.

## General {: #general}

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Configure(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Configure(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.

## See also {: #see-also}

- [Runner Functions](../index.md)
