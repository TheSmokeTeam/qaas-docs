# Transactions: Identity and hook selection

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
