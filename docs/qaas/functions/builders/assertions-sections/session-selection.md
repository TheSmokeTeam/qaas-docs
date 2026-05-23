---
id: qaas.functions.builders.assertions.sections.session.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, assertions, sections, session, selection]
summary: "Reference page for Assertions: Session selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\AssertionBuilder.cs -->

# Assertions: Session selection

> TL;DR — This page mirrors the `Session selection` section from [Assertions](../assertions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddSessionName` {: #addsessionname}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Adds the supplied session name to the current Runner assertion builder instance.

### `RemoveSessionName` {: #removesessionname}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session name from the current Runner assertion builder instance.

### `RemoveSessionNameAt` {: #removesessionnameat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session name at the specified index from the current Runner assertion builder instance.

### `AddSessionPattern` {: #addsessionpattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Adds the supplied session pattern to the current Runner assertion builder instance.

### `RemoveSessionPattern` {: #removesessionpattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Removes the configured session pattern from the current Runner assertion builder instance.

### `RemoveSessionPatternAt` {: #removesessionpatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionPatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionPatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session pattern at the specified index from the current Runner assertion builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Assertions](../assertions.md)
