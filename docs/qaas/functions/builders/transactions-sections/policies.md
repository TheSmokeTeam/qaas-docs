---
id: qaas.functions.builders.transactions.sections.policies
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, policies]
summary: "Reference page for Transactions: Policies."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: Policies

> TL;DR — This page mirrors the `Policies` section from [Transactions](../transactions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddPolicy` {: #addpolicy}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.AddPolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder AddPolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Adds the supplied policy to the current Runner transaction builder instance.

### `UpdatePolicyAt` {: #updatepolicyat}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner transaction builder instance.

### `RemovePolicyAt` {: #removepolicyat}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.RemovePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder RemovePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner transaction builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Transactions](../transactions.md)
