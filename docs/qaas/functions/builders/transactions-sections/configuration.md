# Transactions: Configuration

This page mirrors the `Configuration` section from [Transactions](../transactions.md).

## `WithTimeout`

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
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithDeserializer`

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
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSerializer`

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
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithIterations`

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
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSleep`

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
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
