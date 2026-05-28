---
id: qaas.functions.builders.links.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, links, sections, identity, and, hook, selection]
summary: "Reference page for Links: Identity and hook selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\LinkBuilder.cs -->

# Links: Identity and hook selection

> TL;DR: Reference page for Links: Identity and hook selection.

This page mirrors the `Identity and hook selection` section from [Links](../links.md).

## `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
