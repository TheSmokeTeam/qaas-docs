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

> TL;DR: Reference page for Executions: Session selection.

This page mirrors the `Session selection` section from [Executions](../executions.md).

## `AddSession` {: #addsession}

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateSession` {: #updatesession}

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveSession` {: #removesession}

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveSessionAt` {: #removesessionat}

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
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
