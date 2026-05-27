---
id: qaas.functions.builders.consumers.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, consumers, sections, identity, and, hook, selection]
summary: "Reference page for Consumers: Identity and hook selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Consumers\Builders\ConsumerBuilderLogic.cs -->

# Consumers: Identity and hook selection

> TL;DR: Reference page for Consumers: Identity and hook selection.

This page mirrors the `Identity and hook selection` section from [Consumers](../consumers.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
