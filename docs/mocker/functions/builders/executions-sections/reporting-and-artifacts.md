---
id: mocker.functions.builders.executions.sections.reporting.and.artifacts
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections, reporting, and, artifacts]
summary: "Reference page for Executions: Reporting and artifacts."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->

# Executions: Reporting and artifacts

> TL;DR — This page mirrors the `Reporting and artifacts` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithLogger` {: #withlogger}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithLogger(ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithLogger(ILogger logger)
    ```
    
    **Docstring**
    
    Replaces the logger stored on the current Mocker execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
