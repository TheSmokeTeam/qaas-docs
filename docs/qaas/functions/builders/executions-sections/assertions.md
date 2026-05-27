---
id: qaas.functions.builders.executions.sections.assertions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections, assertions]
summary: "Reference page for Executions: Assertions."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: Assertions

> TL;DR — This page mirrors the `Assertions` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddAssertion` {: #addassertion}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddAssertion(AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied assertion to the current Runner execution builder instance.

### `UpdateAssertion` {: #updateassertion}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured assertion stored on the current Runner execution builder instance.

### `RemoveAssertion` {: #removeassertion}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveAssertion(string assertionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveAssertion(string assertionName)
    ```
    
    **Docstring**
    
    Removes the configured assertion from the current Runner execution builder instance.

### `RemoveAssertionAt` {: #removeassertionat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveAssertionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveAssertionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured assertion at the specified index from the current Runner execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
