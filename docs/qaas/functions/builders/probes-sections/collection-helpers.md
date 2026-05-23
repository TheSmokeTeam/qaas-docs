---
id: qaas.functions.builders.probes.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, probes, sections, collection, helpers]
summary: "Reference page for Probes: Collection helpers."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Probes\ProbeBuilder.cs -->

# Probes: Collection helpers

> TL;DR — This page mirrors the `Collection helpers` section from [Probes](../probes.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner probe builder instance.

### `RemoveConfiguration` {: #removeconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.RemoveConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder RemoveConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner probe builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Probes](../probes.md)
