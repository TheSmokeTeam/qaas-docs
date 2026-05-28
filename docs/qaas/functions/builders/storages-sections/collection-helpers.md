---
id: qaas.functions.builders.storages.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, storages, sections, collection, helpers]
summary: "Reference page for Storages: Collection helpers."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Storage\StorageBuilder.cs -->

# Storages: Collection helpers

> TL;DR — Reference page for Storages: Collection helpers.

This page mirrors the `Collection helpers` section from [Storages](../storages.md).

## `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
