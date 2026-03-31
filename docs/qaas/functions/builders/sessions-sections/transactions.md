# Sessions: Transactions

This page mirrors the `Transactions` section from [Sessions](../sessions.md).

## `CreateTransaction`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.CreateTransaction(TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateTransaction(TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured transaction entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadTransactions`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadTransactions()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<TransactionBuilder> ReadTransactions()
    ```
    
    **Docstring**
    
    Returns the configured transactions currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadTransaction`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadTransaction(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder? ReadTransaction(string name)
    ```
    
    **Docstring**
    
    Returns the configured transaction currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateTransaction`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateTransaction(string name, TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateTransaction(string name, TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured transaction stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateTransaction`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured transaction stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteTransaction`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteTransaction(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteTransaction(string name)
    ```
    
    **Docstring**
    
    Removes the configured transaction from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
