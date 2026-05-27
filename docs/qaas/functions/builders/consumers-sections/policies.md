---
id: qaas.functions.builders.consumers.sections.policies
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, consumers, sections, policies]
summary: "Reference page for Consumers: Policies."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Consumers\Builders\ConsumerBuilderLogic.cs -->

# Consumers: Policies

> TL;DR — This page mirrors the `Policies` section from [Consumers](../consumers.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddPolicy` {: #addpolicy}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.AddPolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder AddPolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Adds the supplied policy to the current Runner consumer builder instance.

### `UpdatePolicyAt` {: #updatepolicyat}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner consumer builder instance.

### `RemovePolicyAt` {: #removepolicyat}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.RemovePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder RemovePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner consumer builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Consumers](../consumers.md)
