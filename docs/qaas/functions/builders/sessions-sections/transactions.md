---
id: qaas.functions.builders.sessions.sections.transactions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, sessions, sections, transactions]
summary: "Reference page for Sessions: Transactions."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions: Transactions

> TL;DR — This page mirrors the `Transactions` section from [Sessions](../sessions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddTransaction` {: #addtransaction}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddTransaction(TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddTransaction(TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied transaction to the current Runner session builder instance.

### `UpdateTransaction` {: #updatetransaction}

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

### `RemoveTransaction` {: #removetransaction}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveTransaction(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveTransaction(string name)
    ```
    
    **Docstring**
    
    Removes the configured transaction from the current Runner session builder instance.

### `RemoveTransactionAt` {: #removetransactionat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveTransactionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveTransactionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured transaction at the specified index from the current Runner session builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Sessions](../sessions.md)
