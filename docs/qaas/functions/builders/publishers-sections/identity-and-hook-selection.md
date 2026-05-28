---
id: qaas.functions.builders.publishers.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, publishers, sections, identity, and, hook, selection]
summary: "Reference page for Publishers: Identity and hook selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Publishers\Builders\PublisherBuilderLogic.cs -->

# Publishers: Identity and hook selection

> TL;DR — Reference page for Publishers: Identity and hook selection.

This page mirrors the `Identity and hook selection` section from [Publishers](../publishers.md).

## `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
