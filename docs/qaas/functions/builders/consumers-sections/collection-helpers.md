---
id: qaas.functions.builders.consumers-sections.collection-helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, consumers, sections, collection]
summary: "This page mirrors the Collection helpers section from Consumers."
---
# Consumers: Collection helpers

This page mirrors the `Collection helpers` section from [Consumers](../consumers.md).

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
