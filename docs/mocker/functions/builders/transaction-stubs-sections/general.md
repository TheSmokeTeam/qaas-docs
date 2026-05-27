# Transaction Stubs: General

This page mirrors the `General` section from [Transaction Stubs](../transaction-stubs.md).

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Configure(IConfiguration configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder Configure(IConfiguration configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Build`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubConfig Build()
    ```
    
    **Docstring**
    
    Builds the configured Mocker transaction stub builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## `FromConfig`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.FromConfig(TransactionStubConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public static TransactionStubBuilder FromConfig(TransactionStubConfig config)
    ```
    
    **Docstring**
    
    Creates a new Mocker transaction stub builder instance from an existing configuration object.
    
    Use this when an existing immutable configuration needs to be brought back into the fluent builder workflow for incremental changes.
