<!-- generated hash:6ce89d265cdd sources:Mocker, functions -->

# Mocker Functions

This page is generated from the docs generator function manifest and the current source tree.

## Configuration as Code

### Executions

#### `ExecutionBuilder.WithContext(InternalContext context) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:152`

Replaces the execution context used by the builder.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.WithLogger(ILogger logger) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:165`

Configures logger on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:178`

Replaces the root configuration stored on the current execution context.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:191`

Sets the execution mode used by the resulting mocker runtime.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.RunLocally(bool runLocally = true) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:204`

Configures whether the mocker waits for an interactive local shutdown signal.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:217`

Sets the template output folder used by template mode.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:230`

Creates or adds the configured data source entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadDataSource(string dataSourceName) : DataSourceBuilder?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:251`

Returns the configured data source currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:264`

Updates the configured data source stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:293`

Removes the configured data source from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateStub(TransactionStubBuilder stubBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:312`

Creates or adds the configured stub entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateStub(TransactionStubConfig stubConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:321`

Creates or adds the configured stub entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadStub(string stubName) : TransactionStubConfig?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:341`

Returns the configured stub currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:354`

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:372`

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:382`

Updates the configured stub stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteStub(string stubName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:411`

Removes the configured stub from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadServer() : ServerConfig?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:430`

Returns the configured server currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.ReadServers() : IReadOnlyList<ServerConfig>`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:439`

Returns the configured servers currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.CreateServer(ServerConfig serverConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:448`

Creates or adds the configured server entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReplaceServer(ServerConfig serverConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:466`

Configures replace server on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

#### `ExecutionBuilder.AddServer(ServerConfig serverConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:482`

Adds the supplied server to the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReplaceServers(params ServerConfig[] serverConfigs) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:498`

Configures replace servers on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

#### `ExecutionBuilder.UpdateServer(Action<ServerConfig> configureAction) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:514`

Updates the configured server stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadController() : ControllerConfig?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:531`

Returns the configured controller currently stored on the Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.CreateController(ControllerConfig controllerConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:540`

Creates or adds the configured controller entry on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReplaceController(ControllerConfig? controllerConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:556`

Configures replace controller on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

#### `ExecutionBuilder.UpdateController(Action<ControllerConfig> configureAction) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:569`

Updates the configured controller stored on the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteController() : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:586`

Removes the configured controller from the current Mocker execution builder instance.

Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.Build() : BaseExecution`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:640`

Builds the configured Mocker execution builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

#### `ExecutionBuilder.Validate(ValidationContext validationContext) : IEnumerable<ValidationResult>`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:743`

Validates the current Mocker execution builder configuration.

Validation results are returned instead of thrown so callers can aggregate or report configuration problems before running the product.

### Transaction Stubs

#### `TransactionStubBuilder.Named(string name) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:70`

Sets the name used for the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.HookNamed(string processorName) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:83`

Sets the hook implementation name used by the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.AddDataSourceName(string dataSourceName) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:96`

Adds the supplied data source name to the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.WithDataSourceNames(IEnumerable<string> dataSourceNames) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:109`

Configures data source names on the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.ClearDataSourceNames() : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:122`

Configures clear data source names on the current Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Transaction Stubs'.

#### `TransactionStubBuilder.Configure(IConfiguration configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:135`

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.CreateConfiguration(IConfiguration configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:148`

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.Configure(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:160`

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.CreateConfiguration(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:174`

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.Create(IConfiguration configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:186`

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.Create(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:198`

Sets the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:210`

Returns the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `TransactionStubBuilder.UpdateConfiguration(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:222`

Updates the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.DeleteConfiguration() : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:235`

Clears the configuration currently stored on the Mocker transaction stub builder instance.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.DeserializeRequestBodyWith(DeserializeConfig config) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:248`

Sets how request bodies are deserialized before the stub processor runs.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.SerializeResponseBodyWith(SerializeConfig config) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:261`

Sets how response bodies are serialized after the stub processor runs.

Use this method when working with the documented Mocker transaction stub builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionStubBuilder.Build() : TransactionStubConfig`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:274`

Builds the configured Mocker transaction stub builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

#### `TransactionStubBuilder.FromConfig(TransactionStubConfig config) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:299`

Creates a new Mocker transaction stub builder instance from an existing configuration object.

Use this when an existing immutable configuration needs to be brought back into the fluent builder workflow for incremental changes.

## Getting Started

### Bootstrap

#### `Bootstrap.New(IEnumerable<string>? args = null) : MockerRunner`

- Kind: `function`
- Location: `QaaS.Mocker/Bootstrap.cs:21`

Creates a new Mocker bootstrap instance from the supplied bootstrap inputs.

This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## Runtime

### Mocker Runner

#### `MockerRunner.Run() : void`

- Kind: `function`
- Location: `QaaS.Mocker/MockerRunner.cs:20`

Runs the configured QaaS.Mocker execution.

Call this after the mocker execution has been configured and resolved. The method delegates to the underlying execution host.
