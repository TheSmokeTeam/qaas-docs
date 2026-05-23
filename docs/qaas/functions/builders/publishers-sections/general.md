---
id: qaas.functions.builders.publishers.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, publishers, sections, general]
summary: "Reference page for Publishers: General."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Publishers\Builders\PublisherBuilderLogic.cs -->

# Publishers: General

> TL;DR — This page mirrors the `General` section from [Publishers](../publishers.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `FilterData` {: #filterdata}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner publisher builder instance.

### `InLoops` {: #inloops}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.InLoops()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder InLoops()
    ```
    
    **Docstring**
    
    Marks the transaction to execute continuously in loop mode.

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.Configure(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder Configure(ISenderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner publisher builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Publishers](../publishers.md)
