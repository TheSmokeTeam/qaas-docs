# Transaction Stubs

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection

### `Named`

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

### `HookNamed`

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

## Data source selection

### `CreateDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.CreateDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder CreateDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Configures data source names on the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `ReadDataSourceNames`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.ReadDataSourceNames()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourceNames()
    ```
    
    **Docstring**
    
    Returns the configured data source names currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

### `UpdateDataSourceName`

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

### `DeleteDataSourceName`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.DeleteDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder DeleteDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Configuration

### `WithRequestBodyDeserialization`

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

### `WithResponseBodySerialization`

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

## Inspection

### `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public IConfiguration ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## Collection helpers

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Mocker transaction stub builder instance.
    
    Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## General

### `Configure`

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

### `Configure`

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

### `Build`

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

### `FromConfig`

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
