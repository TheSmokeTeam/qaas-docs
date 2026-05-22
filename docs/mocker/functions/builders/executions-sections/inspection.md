---
id: mocker.functions.builders.executions-sections.inspection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections, inspection]
summary: "This page mirrors the Inspection section from Executions."
---
# Executions: Inspection

This page mirrors the `Inspection` section from [Executions](../executions.md).

## `ReadController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ControllerConfig? ReadController()
    ```
    
    **Docstring**
    
    Returns the configured controller currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
