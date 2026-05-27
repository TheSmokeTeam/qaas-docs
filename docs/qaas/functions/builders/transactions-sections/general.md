---
id: qaas.functions.builders.transactions.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, general]
summary: "Reference page for Transactions: General."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: General

> TL;DR: Reference page for Transactions: General.

This page mirrors the `General` section from [Transactions](../transactions.md).

## `InLoops`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.InLoops()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder InLoops()
    ```
    
    **Docstring**
    
    Marks the transaction to execute continuously in loop mode.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.Configure(ITransactorConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder Configure(ITransactorConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
