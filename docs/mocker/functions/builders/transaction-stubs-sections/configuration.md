# Transaction Stubs: Configuration

This page mirrors the `Configuration` section from [Transaction Stubs](../transaction-stubs.md).

## `WithRequestBodyDeserialization`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.WithRequestBodyDeserialization(DeserializeConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder WithRequestBodyDeserialization(DeserializeConfig config)
    ```
    
    **Docstring**
    
    Sets how request bodies are deserialized before the stub processor runs.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithResponseBodySerialization`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.WithResponseBodySerialization(SerializeConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder WithResponseBodySerialization(SerializeConfig config)
    ```
    
    **Docstring**
    
    Sets how response bodies are serialized after the stub processor runs.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
