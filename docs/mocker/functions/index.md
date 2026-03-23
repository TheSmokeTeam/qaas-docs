<!-- generated hash:c97e8a6c2c25 sources:Mocker, functions -->

# Mocker Functions

This page is generated from source-level `qaas-docs` annotations and the current source tree.

## Configuration as Code

### Executions

<hr class="function-separator" />

#### `ExecutionBuilder()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:137`

**Complete Signature**
```csharp
public ExecutionBuilder()
```

**Docstring**

Creates a new Mocker execution builder with an empty default context.

Use this constructor when bootstrapping a mocker execution entirely in code before any configuration or runtime services have been attached.

<hr class="function-separator" />

#### `ExecutionBuilder.WithContext(InternalContext context)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:156`

**Complete Signature**
```csharp
public ExecutionBuilder WithContext(InternalContext context)
```

**Docstring**

Replaces the execution context used by the builder.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithLogger(ILogger logger)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:169`

**Complete Signature**
```csharp
public ExecutionBuilder WithLogger(ILogger logger)
```

**Docstring**

Replaces the logger stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:182`

**Complete Signature**
```csharp
public ExecutionBuilder WithRootConfiguration(IConfiguration configuration)
```

**Docstring**

Replaces the root configuration stored on the current execution context.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:195`

**Complete Signature**
```csharp
public ExecutionBuilder WithExecutionMode(ExecutionMode executionMode)
```

**Docstring**

Sets the execution mode used by the resulting mocker runtime.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.RunLocally(bool runLocally = true)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:208`

**Complete Signature**
```csharp
public ExecutionBuilder RunLocally(bool runLocally = true)
```

**Docstring**

Configures whether the mocker waits for an interactive local shutdown signal.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:221`

**Complete Signature**
```csharp
public ExecutionBuilder WithTemplateOutputFolder(string? templateOutputFolder)
```

**Docstring**

Sets the template output folder used by template mode.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:234`

**Complete Signature**
```csharp
public ExecutionBuilder CreateDataSource(DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Creates or adds the configured data source entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadDataSource(string dataSourceName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:255`

**Complete Signature**
```csharp
public DataSourceBuilder? ReadDataSource(string dataSourceName)
```

**Docstring**

Returns the configured data source currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:268`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Updates the configured data source stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:297`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteDataSource(string dataSourceName)
```

**Docstring**

Removes the configured data source from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateStub(TransactionStubBuilder stubBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:316`

**Complete Signature**
```csharp
public ExecutionBuilder CreateStub(TransactionStubBuilder stubBuilder)
```

**Docstring**

Creates or adds the configured stub entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateStub(TransactionStubConfig stubConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:325`

**Complete Signature**
```csharp
public ExecutionBuilder CreateStub(TransactionStubConfig stubConfig)
```

**Docstring**

Creates or adds the configured stub entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadStub(string stubName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:345`

**Complete Signature**
```csharp
public TransactionStubConfig? ReadStub(string stubName)
```

**Docstring**

Returns the configured stub currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:358`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction)
```

**Docstring**

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:376`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStub(string stubName, TransactionStubBuilder stubBuilder)
```

**Docstring**

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:386`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStub(string stubName, TransactionStubConfig stubConfig)
```

**Docstring**

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteStub(string stubName)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:415`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteStub(string stubName)
```

**Docstring**

Removes the configured stub from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadServer()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:434`

**Complete Signature**
```csharp
public ServerConfig? ReadServer()
```

**Docstring**

Returns the configured server currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadServers()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:443`

**Complete Signature**
```csharp
public IReadOnlyList<ServerConfig> ReadServers()
```

**Docstring**

Returns the configured servers currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateServer(ServerConfig serverConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:452`

**Complete Signature**
```csharp
public ExecutionBuilder CreateServer(ServerConfig serverConfig)
```

**Docstring**

Creates or adds the configured server entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReplaceServer(ServerConfig serverConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:470`

**Complete Signature**
```csharp
public ExecutionBuilder ReplaceServer(ServerConfig serverConfig)
```

**Docstring**

Replaces the configured single-server definition on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

<hr class="function-separator" />

#### `ExecutionBuilder.AddServer(ServerConfig serverConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:486`

**Complete Signature**
```csharp
public ExecutionBuilder AddServer(ServerConfig serverConfig)
```

**Docstring**

Adds the supplied server to the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReplaceServers(params ServerConfig[] serverConfigs)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:502`

**Complete Signature**
```csharp
public ExecutionBuilder ReplaceServers(params ServerConfig[] serverConfigs)
```

**Docstring**

Replaces the configured multi-server definitions on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateServer(Action<ServerConfig> configureAction)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:518`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateServer(Action<ServerConfig> configureAction)
```

**Docstring**

Updates the configured server stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadController()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:535`

**Complete Signature**
```csharp
public ControllerConfig? ReadController()
```

**Docstring**

Returns the configured controller currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateController(ControllerConfig controllerConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:544`

**Complete Signature**
```csharp
public ExecutionBuilder CreateController(ControllerConfig controllerConfig)
```

**Docstring**

Creates or adds the configured controller entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReplaceController(ControllerConfig? controllerConfig)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:560`

**Complete Signature**
```csharp
public ExecutionBuilder ReplaceController(ControllerConfig? controllerConfig)
```

**Docstring**

Replaces the configured controller on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateController(Action<ControllerConfig> configureAction)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:573`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateController(Action<ControllerConfig> configureAction)
```

**Docstring**

Updates the configured controller stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteController()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:590`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteController()
```

**Docstring**

Removes the configured controller from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.Build()`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:644`

**Complete Signature**
```csharp
public override BaseExecution Build()
```

**Docstring**

Builds the configured Mocker execution builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

<hr class="function-separator" />

#### `ExecutionBuilder.Validate(ValidationContext validationContext)`

**Location** `QaaS.Mocker/ExecutionBuilder.cs:747`

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

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:66`

**Complete Signature**
```csharp
public TransactionStubBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.HookNamed(string processorName)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:79`

**Complete Signature**
```csharp
public TransactionStubBuilder HookNamed(string processorName)
```

**Docstring**

Sets the hook implementation name used by the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.AddDataSourceName(string dataSourceName)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:92`

**Complete Signature**
```csharp
public TransactionStubBuilder AddDataSourceName(string dataSourceName)
```

**Docstring**

Adds the supplied data source name to the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.WithDataSourceNames(IEnumerable<string> dataSourceNames)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:105`

**Complete Signature**
```csharp
public TransactionStubBuilder WithDataSourceNames(IEnumerable<string> dataSourceNames)
```

**Docstring**

Configures data source names on the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.ClearDataSourceNames()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:118`

**Complete Signature**
```csharp
public TransactionStubBuilder ClearDataSourceNames()
```

**Docstring**

Clears all configured data source names from the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Transaction Stubs'.

<hr class="function-separator" />

#### `TransactionStubBuilder.Configure(IConfiguration configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:131`

**Complete Signature**
```csharp
public TransactionStubBuilder Configure(IConfiguration configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.CreateConfiguration(IConfiguration configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:144`

**Complete Signature**
```csharp
public TransactionStubBuilder CreateConfiguration(IConfiguration configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Configure(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:156`

**Complete Signature**
```csharp
public TransactionStubBuilder Configure(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.CreateConfiguration(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:170`

**Complete Signature**
```csharp
public TransactionStubBuilder CreateConfiguration(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Create(IConfiguration configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:182`

**Complete Signature**
```csharp
public TransactionStubBuilder Create(IConfiguration configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Create(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:194`

**Complete Signature**
```csharp
public TransactionStubBuilder Create(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.ReadConfiguration()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:206`

**Complete Signature**
```csharp
public IConfiguration ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `TransactionStubBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:218`

**Complete Signature**
```csharp
public TransactionStubBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.DeleteConfiguration()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:231`

**Complete Signature**
```csharp
public TransactionStubBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.DeserializeRequestBodyWith(DeserializeConfig config)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:244`

**Complete Signature**
```csharp
public TransactionStubBuilder DeserializeRequestBodyWith(DeserializeConfig config)
```

**Docstring**

Sets how request bodies are deserialized before the stub processor runs.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.SerializeResponseBodyWith(SerializeConfig config)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:257`

**Complete Signature**
```csharp
public TransactionStubBuilder SerializeResponseBodyWith(SerializeConfig config)
```

**Docstring**

Sets how response bodies are serialized after the stub processor runs.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionStubBuilder.Build()`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:270`

**Complete Signature**
```csharp
public TransactionStubConfig Build()
```

**Docstring**

Builds the configured Mocker transaction stub builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

<hr class="function-separator" />

#### `TransactionStubBuilder.FromConfig(TransactionStubConfig config)`

**Location** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:295`

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
