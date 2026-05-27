---
id: qaas.functions.builders.probes.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, probes, sections, general]
summary: "Reference page for Probes: General."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Probes\ProbeBuilder.cs -->

# Probes: General

> TL;DR: Reference page for Probes: General.

This page mirrors the `General` section from [Probes](../probes.md).

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner probe builder instance.
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
