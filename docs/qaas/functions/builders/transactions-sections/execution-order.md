---
id: qaas.functions.builders.transactions-sections.execution-order
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, transactions, sections, execution]
summary: "This page mirrors the Execution order section from Transactions."
---
# Transactions: Execution order

This page mirrors the `Execution order` section from [Transactions](../transactions.md).

## `AtStage`

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
