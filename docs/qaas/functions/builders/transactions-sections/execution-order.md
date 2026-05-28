---
id: qaas.functions.builders.transactions.sections.execution.order
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, execution, order]
summary: "Reference page for Transactions: Execution order."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: Execution order

> TL;DR: Reference page for Transactions: Execution order.

This page mirrors the `Execution order` section from [Transactions](../transactions.md).

## `AtStage` {: #atstage}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
