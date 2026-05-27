---
id: qaas.functions.builders.transactions.sections.input.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, input, selection]
summary: "Reference page for Transactions: Input selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: Input selection

This page mirrors the `Input selection` section from [Transactions](../transactions.md).

## `FilterInputData`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.FilterInputData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder FilterInputData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the input data filter used by the transaction.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
