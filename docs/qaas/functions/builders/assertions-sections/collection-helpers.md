---
id: qaas.functions.builders.assertions.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, assertions, sections, collection, helpers]
summary: "Reference page for Assertions: Collection helpers."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\AssertionBuilder.cs -->

# Assertions: Collection helpers

> TL;DR — This page mirrors the `Collection helpers` section from [Assertions](../assertions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.

### `RemoveConfiguration` {: #removeconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner assertion builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Assertions](../assertions.md)
