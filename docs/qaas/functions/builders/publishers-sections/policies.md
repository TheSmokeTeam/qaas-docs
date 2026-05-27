---
id: qaas.functions.builders.publishers.sections.policies
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, publishers, sections, policies]
summary: "Reference page for Publishers: Policies."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Publishers\Builders\PublisherBuilderLogic.cs -->

# Publishers: Policies

> TL;DR: Reference page for Publishers: Policies.

This page mirrors the `Policies` section from [Publishers](../publishers.md).

## `AddPolicy` {: #addpolicy}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.AddPolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder AddPolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Adds the supplied policy to the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdatePolicyAt` {: #updatepolicyat}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemovePolicyAt` {: #removepolicyat}

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.RemovePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder RemovePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
