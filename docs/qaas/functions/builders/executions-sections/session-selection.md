---
id: qaas.functions.builders.executions.sections.session.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections, session, selection]
summary: "Reference page for Executions: Session selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: Session selection

> TL;DR — This page mirrors the `Session selection` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddSession` {: #addsession}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddSession(SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied session to the current Runner execution builder instance.

### `UpdateSession` {: #updatesession}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateSession(string sessionName, SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured session stored on the current Runner execution builder instance.

### `RemoveSession` {: #removesession}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveSession(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveSession(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session from the current Runner execution builder instance.

### `RemoveSessionAt` {: #removesessionat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveSessionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveSessionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session at the specified index from the current Runner execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
