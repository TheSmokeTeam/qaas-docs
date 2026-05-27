---
id: qaas.functions.builders.probes.sections.execution.order
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, probes, sections, execution, order]
summary: "Reference page for Probes: Execution order."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Probes\ProbeBuilder.cs -->

# Probes: Execution order

> TL;DR: Reference page for Probes: Execution order.

This page mirrors the `Execution order` section from [Probes](../probes.md).

## `AtStage` {: #atstage}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
