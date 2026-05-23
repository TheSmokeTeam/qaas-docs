---
id: mocker.functions.builders.executions.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections, general]
summary: "Reference page for Executions: General."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->

# Executions: General

> TL;DR — This page mirrors the `General` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `RunLocally` {: #runlocally}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RunLocally(bool runLocally = true)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RunLocally(bool runLocally = true)
    ```
    
    **Docstring**
    
    Configures whether the mocker waits for an interactive local shutdown signal.

### `Build` {: #build}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public override BaseExecution Build()
    ```
    
    **Docstring**
    
    Builds the configured Mocker execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### `Validate` {: #validate}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Validate(ValidationContext validationContext)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    ```
    
    **Docstring**
    
    Validates the current Mocker execution builder configuration.
    
    Validation results are returned instead of thrown so callers can aggregate or report configuration problems before running the product.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
