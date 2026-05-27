---
id: qaas.functions.builders.executions.sections.links
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, executions, sections, links]
summary: "Reference page for Executions: Links."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions: Links

> TL;DR — This page mirrors the `Links` section from [Executions](../executions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddLink` {: #addlink}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied link to the current Runner execution builder instance.

### `UpdateLinkAt` {: #updatelinkat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateLinkAt(int index, LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateLinkAt(int index, LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Updates the configured link at the specified index on the current Runner execution builder instance.

### `RemoveLink` {: #removelink}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveLink(string linkName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveLink(string linkName)
    ```
    
    **Docstring**
    
    Removes the configured link from the current Runner execution builder instance.

### `RemoveLinkAt` {: #removelinkat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveLinkAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveLinkAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured link at the specified index from the current Runner execution builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Executions](../executions.md)
