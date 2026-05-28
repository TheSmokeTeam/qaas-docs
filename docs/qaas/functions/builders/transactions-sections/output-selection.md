---
id: qaas.functions.builders.transactions.sections.output.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, output, selection]
summary: "Reference page for Transactions: Output selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: Output selection

> TL;DR — Reference page for Transactions: Output selection.

This page mirrors the `Output selection` section from [Transactions](../transactions.md).

## `FilterOutputData` {: #filteroutputdata}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.FilterOutputData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder FilterOutputData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the output data filter used by the transaction.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
