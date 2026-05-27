# Transaction Stubs: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Transaction Stubs](../transaction-stubs.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `HookNamed`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.HookNamed(string processorName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder HookNamed(string processorName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
