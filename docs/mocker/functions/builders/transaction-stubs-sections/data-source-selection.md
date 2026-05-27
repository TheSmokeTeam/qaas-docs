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

## `UpdateDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.UpdateDataSourceName(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder UpdateDataSourceName(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source name stored on the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveDataSourceNameAt`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.RemoveDataSourceNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder RemoveDataSourceNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source name at the specified index from the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
