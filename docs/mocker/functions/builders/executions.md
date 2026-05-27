# Executions

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Data source selection

### `AddDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveDataSource`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveDataSourceAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveDataSourceAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveDataSourceAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source at the specified index from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Output selection

### `WithTemplateOutputFolder`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithTemplateOutputFolder(string? templateOutputFolder)
    ```
    
    **Docstring**
    
    Sets the template output folder used by template mode.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Servers

### `WithServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Sets the single-server configuration used by the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `AddServers`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddServers(params ServerConfig[] serverConfigs)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddServers(params ServerConfig[] serverConfigs)
    ```
    
    **Docstring**
    
    Adds the supplied servers to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Updates the configured single-server definition on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `AddServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Adds the supplied server to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateServerAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateServerAt(int index, ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateServerAt(int index, ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Updates the configured server stored at the specified index on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveServer()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveServer()
    ```
    
    **Docstring**
    
    Removes the configured single-server definition from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveServerAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveServerAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveServerAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured server stored at the specified index from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Transaction stubs

### `AddStub`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStub(TransactionStubBuilder stubBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStub(TransactionStubBuilder stubBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied stub to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `AddStub`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStub(TransactionStubConfig stubConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStub(TransactionStubConfig stubConfig)
    ```
    
    **Docstring**
    
    Adds the supplied stub to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateStub`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, TransactionStubBuilder stubBuilder)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateStub`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, TransactionStubConfig stubConfig)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveStubAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveStubAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveStubAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured stub at the specified index from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveStub`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveStub(string stubName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveStub(string stubName)
    ```
    
    **Docstring**
    
    Removes the configured stub from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Executions

### `ExecutionBuilder`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder()`
    
    **Kind** `constructor`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder()
    ```
    
    **Docstring**
    
    Creates a new Mocker execution builder with an empty default context.
    
    Use this constructor when bootstrapping a mocker execution entirely in code before any configuration or runtime services have been attached.

### `WithExecutionMode`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithExecutionMode(ExecutionMode executionMode)
    ```
    
    **Docstring**
    
    Sets the execution mode used by the resulting mocker runtime.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Configuration

### `WithRootConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithRootConfiguration(IConfiguration configuration)
    ```
    
    **Docstring**
    
    Replaces the root configuration stored on the current execution context.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `WithController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Sets the controller configuration used by the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Reporting and artifacts

### `WithLogger`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithLogger(ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithLogger(ILogger logger)
    ```
    
    **Docstring**
    
    Replaces the logger stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Collection helpers

### `UpdateController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Updates the configured controller stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `RemoveController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveController()
    ```
    
    **Docstring**
    
    Removes the configured controller from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## General

### `RunLocally`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RunLocally(bool runLocally = true)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RunLocally(bool runLocally = true)
    ```
    
    **Docstring**
    
    Configures whether the mocker waits for an interactive local shutdown signal.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `Build`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public override BaseExecution Build()
    ```
    
    **Docstring**
    
    Builds the configured Mocker execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### `Validate`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Validate(ValidationContext validationContext)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    ```
    
    **Docstring**
    
    Validates the current Mocker execution builder configuration.
    
    Validation results are returned instead of thrown so callers can aggregate or report configuration problems before running the product.
