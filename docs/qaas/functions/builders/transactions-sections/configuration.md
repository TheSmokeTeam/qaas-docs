---
id: qaas.functions.builders.transactions.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, transactions, sections, configuration]
summary: "Reference page for Transactions: Configuration."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Transactions\Builders\TransactionBuilder.cs -->

# Transactions: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Transactions](../transactions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithTimeout` {: #withtimeout}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.WithTimeout(int timeoutMs)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithTimeout(int timeoutMs)
    ```
    
    **Docstring**
    
    Configures timeout on the current Runner transaction builder instance.
    
    Stores settings on this builder for validation and action construction.

### `WithDeserializer` {: #withdeserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithDeserializer(DeserializeConfig deserializeConfig)
    ```
    
    **Docstring**
    
    Sets the deserializer configuration used by the current Runner transaction builder instance.
    
    Stores settings on this builder for validation and action construction.

### `WithSerializer` {: #withserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.WithSerializer(SerializeConfig serializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithSerializer(SerializeConfig serializeConfig)
    ```
    
    **Docstring**
    
    Sets the serializer configuration used by the current Runner transaction builder instance.
    
    Stores settings on this builder for validation and action construction.

### `WithIterations` {: #withiterations}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.WithIterations(int iterations)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithIterations(int iterations)
    ```
    
    **Docstring**
    
    Sets how many iterations the transaction should execute.
    
    Stores settings on this builder for validation and action construction.

### `WithParallelism` {: #withparallelism}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.WithParallelism(int parallelism)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithParallelism(int parallelism)
    ```
    
    **Docstring**
    
    Sets the maximum concurrent workers for this transaction action.
    
    The value must be at least one. Each worker executes one request/response operation on the shared transactor. Omitting this setting runs sequentially. Parallel input is materialized before execution; worker limits do not bound retained session memory.

### `WithSleep` {: #withsleep}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionBuilder.WithSleep(ulong sleepTimeMs)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithSleep(ulong sleepTimeMs)
    ```
    
    **Docstring**
    
    Sets the delay applied between transaction iterations.
    
    Stores settings on this builder for validation and action construction.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Transactions](../transactions.md)
