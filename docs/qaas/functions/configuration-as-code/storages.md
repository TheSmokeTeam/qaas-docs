<!-- generated hash:4e908b1f5801 sources:Runner, functions, Configuration as Code, Storages -->

# Storages

Source-driven reference for `Runner` functions in the `Configuration as Code / Storages` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `WithJsonStorageFormat`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.WithJsonStorageFormat(Formatting format)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:42`
    
    **Signature**
    ```csharp
    public StorageBuilder WithJsonStorageFormat(Formatting format)
    ```
    
    **Docstring**
    
    Sets the JSON formatting used by runtime storages.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.Create(IStorageConfig storageConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:55`
    
    **Signature**
    ```csharp
    public StorageBuilder Create(IStorageConfig storageConfig)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.CreateConfiguration(IStorageConfig storageConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:67`
    
    **Signature**
    ```csharp
    public StorageBuilder CreateConfiguration(IStorageConfig storageConfig)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:79`
    
    **Signature**
    ```csharp
    public IStorageConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.UpdateConfiguration(Func<IStorageConfig, IStorageConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:91`
    
    **Signature**
    ```csharp
    public StorageBuilder UpdateConfiguration(Func<IStorageConfig, IStorageConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.UpdateConfiguration(IStorageConfig storageConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:105`
    
    **Signature**
    ```csharp
    public StorageBuilder UpdateConfiguration(IStorageConfig storageConfig)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:119`
    
    **Signature**
    ```csharp
    public StorageBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:133`
    
    **Signature**
    ```csharp
    public StorageBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `StorageBuilder.Configure(IStorageConfig storageConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Location** `QaaS.Runner.Storage/StorageBuilder.cs:145`
    
    **Signature**
    ```csharp
    public StorageBuilder Configure(IStorageConfig storageConfig)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner storage builder instance.
    
    Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
