<!-- generated hash:072edaaede2a sources:Mocker, functions, Configuration as Code, Executions -->

# Executions

Source-driven reference for `Mocker` functions in the `Configuration as Code / Executions` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `ExecutionBuilder`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder()`
    
    **Kind** `constructor`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:133`
    
    **Signature**
    ```csharp
    public ExecutionBuilder()
    ```
    
    **Docstring**
    
    Creates a new Mocker execution builder with an empty default context.
    
    Use this constructor when bootstrapping a mocker execution entirely in code before any configuration or runtime services have been attached.

## `WithLogger`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithLogger(ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:165`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithLogger(ILogger logger)
    ```
    
    **Docstring**
    
    Replaces the logger stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithRootConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:178`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithRootConfiguration(IConfiguration configuration)
    ```
    
    **Docstring**
    
    Replaces the root configuration stored on the current execution context.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithExecutionMode`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:191`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithExecutionMode(ExecutionMode executionMode)
    ```
    
    **Docstring**
    
    Sets the execution mode used by the resulting mocker runtime.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RunLocally`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.RunLocally(bool runLocally = true)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:204`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RunLocally(bool runLocally = true)
    ```
    
    **Docstring**
    
    Configures whether the mocker waits for an interactive local shutdown signal.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTemplateOutputFolder`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:217`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithTemplateOutputFolder(string? templateOutputFolder)
    ```
    
    **Docstring**
    
    Sets the template output folder used by template mode.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:230`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:251`
    
    **Signature**
    ```csharp
    public DataSourceBuilder? ReadDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Returns the configured data source currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:264`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:293`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateStub(TransactionStubBuilder stubBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:312`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateStub(TransactionStubBuilder stubBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured stub entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateStub(TransactionStubConfig stubConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:321`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateStub(TransactionStubConfig stubConfig)
    ```
    
    **Docstring**
    
    Creates or adds the configured stub entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadStub(string stubName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:341`
    
    **Signature**
    ```csharp
    public TransactionStubConfig? ReadStub(string stubName)
    ```
    
    **Docstring**
    
    Returns the configured stub currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:354`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:372`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, TransactionStubBuilder stubBuilder)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:382`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStub(string stubName, TransactionStubConfig stubConfig)
    ```
    
    **Docstring**
    
    Updates the configured stub stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteStub`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteStub(string stubName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:411`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteStub(string stubName)
    ```
    
    **Docstring**
    
    Removes the configured stub from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadServer`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadServer()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:430`
    
    **Signature**
    ```csharp
    public ServerConfig? ReadServer()
    ```
    
    **Docstring**
    
    Returns the configured server currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadServers`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadServers()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:439`
    
    **Signature**
    ```csharp
    public IReadOnlyList<ServerConfig> ReadServers()
    ```
    
    **Docstring**
    
    Returns the configured servers currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `CreateServer`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:448`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Creates or adds the configured server entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReplaceServer`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReplaceServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:466`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ReplaceServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Replaces the configured single-server definition on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

## `AddServer`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:482`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Adds the supplied server to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReplaceServers`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReplaceServers(params ServerConfig[] serverConfigs)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:498`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ReplaceServers(params ServerConfig[] serverConfigs)
    ```
    
    **Docstring**
    
    Replaces the configured multi-server definitions on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

## `UpdateServer`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateServer(Action<ServerConfig> configureAction)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:514`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateServer(Action<ServerConfig> configureAction)
    ```
    
    **Docstring**
    
    Updates the configured server stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadController`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:531`
    
    **Signature**
    ```csharp
    public ControllerConfig? ReadController()
    ```
    
    **Docstring**
    
    Returns the configured controller currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `CreateController`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:540`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Creates or adds the configured controller entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReplaceController`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReplaceController(ControllerConfig? controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:556`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ReplaceController(ControllerConfig? controllerConfig)
    ```
    
    **Docstring**
    
    Replaces the configured controller on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

## `UpdateController`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateController(Action<ControllerConfig> configureAction)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:569`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateController(Action<ControllerConfig> configureAction)
    ```
    
    **Docstring**
    
    Updates the configured controller stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteController`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:586`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteController()
    ```
    
    **Docstring**
    
    Removes the configured controller from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Build`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:640`
    
    **Signature**
    ```csharp
    public override BaseExecution Build()
    ```
    
    **Docstring**
    
    Builds the configured Mocker execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## `Validate`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.Validate(ValidationContext validationContext)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Mocker/ExecutionBuilder.cs:744`
    
    **Signature**
    ```csharp
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    ```
    
    **Docstring**
    
    Validates the current Mocker execution builder configuration.
    
    Validation results are returned instead of thrown so callers can aggregate or report configuration problems before running the product.
