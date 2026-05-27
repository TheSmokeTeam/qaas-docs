---
id: qaas.functions.builders.storages.sections.storages
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, storages, sections]
summary: "Reference page for Storages: Storages."
---

# Storages: Storages

This page mirrors the `Storages` section from [Storages](../storages.md).

## `WithJsonStorageFormat`

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.WithJsonStorageFormat(Formatting format)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder WithJsonStorageFormat(Formatting format)
    ```
    
    **Docstring**
    
    Sets the JSON formatting used by runtime storages.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
