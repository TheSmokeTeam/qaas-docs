---
id: qaas.functions.builders.assertions.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, assertions, sections, general]
summary: "Reference page for Assertions: General."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\AssertionBuilder.cs -->

# Assertions: General

> TL;DR — Reference page for Assertions: General.

This page mirrors the `General` section from [Assertions](../assertions.md).

## `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

- [Runner Functions](../index.md)
