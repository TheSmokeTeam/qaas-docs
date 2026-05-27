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

> TL;DR — This page mirrors the `Policies` section from [Publishers](../publishers.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddPolicy` {: #addpolicy}

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

### `UpdatePolicyAt` {: #updatepolicyat}

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

### `RemovePolicyAt` {: #removepolicyat}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Publishers](../publishers.md)
