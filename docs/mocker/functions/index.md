<!-- generated hash:7217de98aa47 sources:Mocker, functions -->

# Mocker Functions

This page is generated from source-level `qaas-docs` annotations and the current source tree.

## Configuration as Code

### Executions

<hr class="function-separator" />

#### `ExecutionBuilder()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:133`

**Complete Signature**
```csharp
public ExecutionBuilder()
```

**Docstring**

Creates a new Mocker execution builder with an empty default context.

Use this constructor when bootstrapping a mocker execution entirely in code before any configuration or runtime services have been attached.

<hr class="function-separator" />

#### `ExecutionBuilder.WithLogger(ILogger logger)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:165`

**Complete Signature**
```csharp
public ExecutionBuilder WithLogger(ILogger logger)
```

**Docstring**

Replaces the logger stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:178`

**Complete Signature**
```csharp
public ExecutionBuilder WithRootConfiguration(IConfiguration configuration)
```

**Docstring**

Replaces the root configuration stored on the current execution context.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:191`

**Complete Signature**
```csharp
public ExecutionBuilder WithExecutionMode(ExecutionMode executionMode)
```

**Docstring**

Sets the execution mode used by the resulting mocker runtime.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.RunLocally(bool runLocally = true)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:204`

**Complete Signature**
```csharp
public ExecutionBuilder RunLocally(bool runLocally = true)
```

**Docstring**

Configures whether the mocker waits for an interactive local shutdown signal.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:217`

**Complete Signature**
```csharp
public ExecutionBuilder WithTemplateOutputFolder(string? templateOutputFolder)
```

**Docstring**

Sets the template output folder used by template mode.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:230`

**Complete Signature**
```csharp
public ExecutionBuilder CreateDataSource(DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Creates or adds the configured data source entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadDataSource(string dataSourceName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:251`

**Complete Signature**
```csharp
public DataSourceBuilder? ReadDataSource(string dataSourceName)
```

**Docstring**

Returns the configured data source currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:264`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Updates the configured data source stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:293`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteDataSource(string dataSourceName)
```

**Docstring**

Removes the configured data source from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateStub(TransactionStubBuilder stubBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:312`

**Complete Signature**
```csharp
public ExecutionBuilder CreateStub(TransactionStubBuilder stubBuilder)
```

**Docstring**

Creates or adds the configured stub entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateStub(TransactionStubConfig stubConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:321`

**Complete Signature**
```csharp
public ExecutionBuilder CreateStub(TransactionStubConfig stubConfig)
```

**Docstring**

Creates or adds the configured stub entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadStub(string stubName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:341`

**Complete Signature**
```csharp
public TransactionStubConfig? ReadStub(string stubName)
```

**Docstring**

Returns the configured stub currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:354`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction)
```

**Docstring**

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:372`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStub(string stubName, TransactionStubBuilder stubBuilder)
```

**Docstring**

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:382`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStub(string stubName, TransactionStubConfig stubConfig)
```

**Docstring**

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteStub(string stubName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:411`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteStub(string stubName)
```

**Docstring**

Removes the configured stub from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadServer()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:430`

**Complete Signature**
```csharp
public ServerConfig? ReadServer()
```

**Docstring**

Returns the configured server currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadServers()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:439`

**Complete Signature**
```csharp
public IReadOnlyList<ServerConfig> ReadServers()
```

**Docstring**

Returns the configured servers currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateServer(ServerConfig serverConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:448`

**Complete Signature**
```csharp
public ExecutionBuilder CreateServer(ServerConfig serverConfig)
```

**Docstring**

Creates or adds the configured server entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReplaceServer(ServerConfig serverConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:466`

**Complete Signature**
```csharp
public ExecutionBuilder ReplaceServer(ServerConfig serverConfig)
```

**Docstring**

Replaces the configured single-server definition on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

<hr class="function-separator" />

#### `ExecutionBuilder.AddServer(ServerConfig serverConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:482`

**Complete Signature**
```csharp
public ExecutionBuilder AddServer(ServerConfig serverConfig)
```

**Docstring**

Adds the supplied server to the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReplaceServers(params ServerConfig[] serverConfigs)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:498`

**Complete Signature**
```csharp
public ExecutionBuilder ReplaceServers(params ServerConfig[] serverConfigs)
```

**Docstring**

Replaces the configured multi-server definitions on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateServer(Action<ServerConfig> configureAction)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:514`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateServer(Action<ServerConfig> configureAction)
```

**Docstring**

Updates the configured server stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadController()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:531`

**Complete Signature**
```csharp
public ControllerConfig? ReadController()
```

**Docstring**

Returns the configured controller currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateController(ControllerConfig controllerConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:540`

**Complete Signature**
```csharp
public ExecutionBuilder CreateController(ControllerConfig controllerConfig)
```

**Docstring**

Creates or adds the configured controller entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReplaceController(ControllerConfig? controllerConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:556`

**Complete Signature**
```csharp
public ExecutionBuilder ReplaceController(ControllerConfig? controllerConfig)
```

**Docstring**

Replaces the configured controller on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateController(Action<ControllerConfig> configureAction)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:569`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateController(Action<ControllerConfig> configureAction)
```

**Docstring**

Updates the configured controller stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteController()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:586`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteController()
```

**Docstring**

Removes the configured controller from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.Build()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:640`

**Complete Signature**
```csharp
public override BaseExecution Build()
```

**Docstring**

Builds the configured Mocker execution builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

<hr class="function-separator" />

#### `ExecutionBuilder.Validate(ValidationContext validationContext)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:744`

**Complete Signature**
```csharp
public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
```

**Docstring**

Validates the current Mocker execution builder configuration.

Validation results are returned instead of thrown so callers can aggregate or report configuration problems before running the product.

### Transaction Stubs

<hr class="function-separator" />

#### `TransactionStubBuilder.Named(string name)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:63`

**Complete Signature**
```csharp
public TransactionStubBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.HookNamed(string processorName)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:76`

**Complete Signature**
```csharp
public TransactionStubBuilder HookNamed(string processorName)
```

**Docstring**

Sets the hook implementation name used by the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.AddDataSourceName(string dataSourceName)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:89`

**Complete Signature**
```csharp
public TransactionStubBuilder AddDataSourceName(string dataSourceName)
```

**Docstring**

Adds the supplied data source name to the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.WithDataSourceNames(IEnumerable<string> dataSourceNames)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:102`

**Complete Signature**
```csharp
public TransactionStubBuilder WithDataSourceNames(IEnumerable<string> dataSourceNames)
```

**Docstring**

Configures data source names on the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.ClearDataSourceNames()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:115`

**Complete Signature**
```csharp
public TransactionStubBuilder ClearDataSourceNames()
```

**Docstring**

Clears all configured data source names from the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Transaction Stubs'.

<hr class="function-separator" />

#### `TransactionStubBuilder.Configure(IConfiguration configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:128`

**Complete Signature**
```csharp
public TransactionStubBuilder Configure(IConfiguration configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.CreateConfiguration(IConfiguration configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:141`

**Complete Signature**
```csharp
public TransactionStubBuilder CreateConfiguration(IConfiguration configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Configure(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:153`

**Complete Signature**
```csharp
public TransactionStubBuilder Configure(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.CreateConfiguration(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:167`

**Complete Signature**
```csharp
public TransactionStubBuilder CreateConfiguration(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Create(IConfiguration configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:179`

**Complete Signature**
```csharp
public TransactionStubBuilder Create(IConfiguration configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Create(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:191`

**Complete Signature**
```csharp
public TransactionStubBuilder Create(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.ReadConfiguration()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:203`

**Complete Signature**
```csharp
public IConfiguration ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `TransactionStubBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:225`

**Complete Signature**
```csharp
public TransactionStubBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.DeleteConfiguration()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:238`

**Complete Signature**
```csharp
public TransactionStubBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.DeserializeRequestBodyWith(DeserializeConfig config)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:251`

**Complete Signature**
```csharp
public TransactionStubBuilder DeserializeRequestBodyWith(DeserializeConfig config)
```

**Docstring**

Sets how request bodies are deserialized before the stub processor runs.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.SerializeResponseBodyWith(SerializeConfig config)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:264`

**Complete Signature**
```csharp
public TransactionStubBuilder SerializeResponseBodyWith(SerializeConfig config)
```

**Docstring**

Sets how response bodies are serialized after the stub processor runs.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Build()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:277`

**Complete Signature**
```csharp
public TransactionStubConfig Build()
```

**Docstring**

Builds the configured Mocker transaction stub builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

<hr class="function-separator" />

#### `TransactionStubBuilder.FromConfig(TransactionStubConfig config)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:302`

**Complete Signature**
```csharp
public static TransactionStubBuilder FromConfig(TransactionStubConfig config)
```

**Docstring**

Creates a new Mocker transaction stub builder instance from an existing configuration object.

Use this when an existing immutable configuration needs to be brought back into the fluent builder workflow for incremental changes.

## Getting Started

### Bootstrap

<hr class="function-separator" />

#### `Bootstrap.New(IEnumerable<string>? args = null)`

**Location** `QaaS.Mocker/Bootstrap.cs:21`

**Complete Signature**
```csharp
public static MockerRunner New(IEnumerable<string>? args = null)
```

**Docstring**

Creates a new MockerRunner instance from the supplied bootstrap inputs.

This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## Runtime

### Mocker Runner

<hr class="function-separator" />

#### `MockerRunner.Run()`

**Location** `QaaS.Mocker/MockerRunner.cs:20`

**Complete Signature**
```csharp
public void Run()
```

**Docstring**

Runs the configured QaaS.Mocker execution.

Call this after the mocker execution has been configured and resolved. The method delegates to the underlying execution host.
