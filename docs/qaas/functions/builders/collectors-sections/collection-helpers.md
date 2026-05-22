---
id: qaas.functions.builders.collectors-sections.collection-helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, collectors, sections, collection]
summary: "This page mirrors the Collection helpers section from Collectors."
---
# Collectors: Collection helpers

This page mirrors the `Collection helpers` section from [Collectors](../collectors.md).

## `UpdateConfiguration`

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
