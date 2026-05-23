---
id: mocker.functions.builders.executions.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections, collection, helpers]
summary: "Reference page for Executions: Collection helpers."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->

# Executions: Collection helpers

> TL;DR — This page mirrors the `Collection helpers` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `UpdateController` {: #updatecontroller}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Updates the configured controller stored on the current Mocker execution builder instance.

### `RemoveController` {: #removecontroller}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveController()
    ```
    
    **Docstring**
    
    Removes the configured controller from the current Mocker execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
