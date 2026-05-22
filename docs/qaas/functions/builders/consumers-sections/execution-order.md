---
id: qaas.functions.builders.consumers-sections.execution-order
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, consumers, sections, execution]
summary: "This page mirrors the Execution order section from Consumers."
---
# Consumers: Execution order

This page mirrors the `Execution order` section from [Consumers](../consumers.md).

## `AtStage`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
