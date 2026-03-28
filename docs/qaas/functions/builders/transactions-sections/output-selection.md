# Transactions: Output selection

This page mirrors the `Output selection` section from [Transactions](../transactions.md).

## `FilterOutputData`

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
