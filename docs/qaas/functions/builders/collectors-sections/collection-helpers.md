---
id: qaas.functions.builders.collectors.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, collectors, sections, collection, helpers]
summary: "Reference page for Collectors: Collection helpers."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Collectors\CollectorBuilder.cs -->

# Collectors: Collection helpers

> TL;DR: Reference page for Collectors: Collection helpers.

This page mirrors the `Collection helpers` section from [Collectors](../collectors.md).

## `UpdateConfiguration` {: #updateconfiguration}

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
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
