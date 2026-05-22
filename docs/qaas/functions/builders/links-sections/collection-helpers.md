---
id: qaas.functions.builders.links-sections.collection-helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, links, sections, collection]
summary: "This page mirrors the Collection helpers section from Links."
---
# Links: Collection helpers

This page mirrors the `Collection helpers` section from [Links](../links.md).

## `UpdateConfiguration`

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
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
