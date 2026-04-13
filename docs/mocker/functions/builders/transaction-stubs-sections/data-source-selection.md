# Transaction Stubs: Data source selection

This page mirrors the `Data source selection` section from [Transaction Stubs](../transaction-stubs.md).

## `AddDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithDataSourceNames`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.WithDataSourceNames(IEnumerable<string> dataSourceNames)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder WithDataSourceNames(IEnumerable<string> dataSourceNames)
    ```
    
    **Docstring**
    
    Configures data source names on the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ClearDataSourceNames`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.ClearDataSourceNames()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder ClearDataSourceNames()
    ```
    
    **Docstring**
    
    Clears all configured data source names from the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Transaction Stubs'.
