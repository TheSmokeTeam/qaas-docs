---
id: qaas.functions.builders.transactions.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, identity, and, hook, selection]
summary: "Reference page for Transactions: Identity and hook selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: Identity and hook selection

> TL;DR: Reference page for Transactions: Identity and hook selection.

This page mirrors the `Identity and hook selection` section from [Transactions](../transactions.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
