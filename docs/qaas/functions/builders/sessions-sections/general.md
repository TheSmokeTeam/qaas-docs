---
id: qaas.functions.builders.sessions-sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, sessions, sections, general]
summary: "This page mirrors the General section from Sessions."
---
# Sessions: General

This page mirrors the `General` section from [Sessions](../sessions.md).

## `DiscardData`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DiscardData()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DiscardData()
    ```
    
    **Docstring**
    
    Disables data persistence for the configured session.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
