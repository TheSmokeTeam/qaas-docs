---
id: qaas.functions.builders.executions.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections, general]
summary: "Reference page for Executions: General."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: General

> TL;DR — Reference page for Executions: General.

This page mirrors the `General` section from [Executions](../executions.md).

## `Build` {: #build}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public override Execution Build()
    ```
    
    **Docstring**
    
    Builds the configured Runner execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
