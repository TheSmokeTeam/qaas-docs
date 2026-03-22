<!-- generated hash:2a150f8a369c sources:Mocker, functions -->

# Mocker Functions

This page is generated from the docs generator function manifest and the current source tree.

## Configuration as Code

### Executions

#### `ExecutionBuilder.WithContext(InternalContext context) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:148`

Replaces the execution context used when building the runtime.

#### `ExecutionBuilder.WithLogger(ILogger logger) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:157`

Replaces the logger stored on the current execution context.

#### `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:166`

Replaces the root configuration stored on the current execution context.

#### `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:175`

Sets the execution mode for the resulting runtime.

#### `ExecutionBuilder.RunLocally(bool runLocally = true) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:184`

Configures whether the built execution waits for an interactive local shutdown signal.

#### `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:193`

Sets the template output folder used by template mode.

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:202`

Adds a new data source and enforces a unique name within the builder.

#### `ExecutionBuilder.ReadDataSource(string dataSourceName) : DataSourceBuilder?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:219`

Returns a configured data source by name, or null when it does not exist.

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:228`

Replaces an existing data source by name.

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:253`

Removes a configured data source by name.

#### `ExecutionBuilder.CreateStub(TransactionStubBuilder stubBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:268`

Adds a new stub from a code-first stub builder.

#### `ExecutionBuilder.CreateStub(TransactionStubConfig stubConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:273`

Adds a new stub configuration and enforces a unique stub name.

#### `ExecutionBuilder.ReadStub(string stubName) : TransactionStubConfig?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:289`

Returns a configured stub by name, or null when it does not exist.

#### `ExecutionBuilder.UpdateStub(string stubName, Action<TransactionStubBuilder> configureAction) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:298`

Updates an existing stub through a mutable builder callback.

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubBuilder stubBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:312`

Replaces an existing stub from a code-first stub builder.

#### `ExecutionBuilder.UpdateStub(string stubName, TransactionStubConfig stubConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:318`

Replaces an existing stub configuration by name.

#### `ExecutionBuilder.DeleteStub(string stubName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:343`

Removes a configured stub by name.

#### `ExecutionBuilder.ReadServer() : ServerConfig?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:358`

Returns the legacy single-server configuration, if present.

#### `ExecutionBuilder.ReadServers() : IReadOnlyList<ServerConfig>`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:363`

Returns the currently configured servers as a normalized read-only list.

#### `ExecutionBuilder.CreateServer(ServerConfig serverConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:368`

Configures the builder to use a single server definition.

#### `ExecutionBuilder.ReplaceServer(ServerConfig serverConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:382`

Replaces any existing server configuration with a new single server definition.

#### `ExecutionBuilder.AddServer(ServerConfig serverConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:394`

Adds a server to the multi-server configuration and clears the legacy single-server field.

#### `ExecutionBuilder.ReplaceServers(params ServerConfig[] serverConfigs) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:406`

Replaces the multi-server configuration and clears the legacy single-server field.

#### `ExecutionBuilder.UpdateServer(Action<ServerConfig> configureAction) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:418`

Mutates the legacy single-server configuration in place.

#### `ExecutionBuilder.ReadController() : ControllerConfig?`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:431`

Returns the optional controller configuration.

#### `ExecutionBuilder.CreateController(ControllerConfig controllerConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:436`

Adds controller configuration when one has not already been configured.

#### `ExecutionBuilder.ReplaceController(ControllerConfig? controllerConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:448`

Replaces the current controller configuration.

#### `ExecutionBuilder.UpdateController(Action<ControllerConfig> configureAction) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:457`

Mutates the current controller configuration in place.

#### `ExecutionBuilder.DeleteController() : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:470`

Removes the current controller configuration.

#### `ExecutionBuilder.Build() : BaseExecution`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:520`

Validates the current configuration and builds the executable runtime graph.

#### `ExecutionBuilder.Validate(ValidationContext validationContext) : IEnumerable<ValidationResult>`

- Kind: `function`
- Location: `QaaS.Mocker/ExecutionBuilder.cs:619`

Validates mutually exclusive server settings and multi-server action-name collisions.

### Transaction Stubs

#### `TransactionStubBuilder.Named(string name) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:63`

Sets the stub name.

#### `TransactionStubBuilder.HookNamed(string processorName) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:72`

Sets the processor hook name.

#### `TransactionStubBuilder.AddDataSourceName(string dataSourceName) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:81`

Adds a single data source name to the stub.

#### `TransactionStubBuilder.WithDataSourceNames(IEnumerable<string> dataSourceNames) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:90`

Replaces the data source name list.

#### `TransactionStubBuilder.ClearDataSourceNames() : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:99`

Removes every configured data source name.

#### `TransactionStubBuilder.Configure(IConfiguration configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:108`

Replaces the processor configuration with an existing configuration object.

#### `TransactionStubBuilder.CreateConfiguration(IConfiguration configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:117`

Compatibility alias for IConfiguration) that matches the configuration CRUD pattern used by other builders.

#### `TransactionStubBuilder.Configure(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:125`

Serializes an object into JSON-backed processor configuration.

#### `TransactionStubBuilder.CreateConfiguration(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:135`

Compatibility alias for Configure(object) that matches the configuration CRUD pattern used by other builders.

#### `TransactionStubBuilder.Create(IConfiguration configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:143`

Compatibility alias for IConfiguration) .

#### `TransactionStubBuilder.Create(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:151`

Compatibility alias for CreateConfiguration(object) .

#### `TransactionStubBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:159`

Returns the currently configured processor configuration.

#### `TransactionStubBuilder.UpdateConfiguration(object configuration) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:167`

Merges the provided configuration object into the current processor configuration.

#### `TransactionStubBuilder.DeleteConfiguration() : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:176`

Clears the configured processor configuration.

#### `TransactionStubBuilder.DeserializeRequestBodyWith(DeserializeConfig config) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:185`

Configures how request bodies are deserialized before processor execution.

#### `TransactionStubBuilder.SerializeResponseBodyWith(SerializeConfig config) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:194`

Configures how response bodies are serialized after processor execution.

#### `TransactionStubBuilder.Build() : TransactionStubConfig`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:203`

Materializes the fluent builder into an immutable configuration record.

#### `TransactionStubBuilder.FromConfig(TransactionStubConfig config) : TransactionStubBuilder`

- Kind: `function`
- Location: `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs:224`

Creates a fluent builder from an existing configuration record.

## Getting Started

### Bootstrap

#### `Bootstrap.New(IEnumerable<string>? args = null) : MockerRunner`

- Kind: `function`
- Location: `QaaS.Mocker/Bootstrap.cs:17`

Creates a new MockerRunner from command-line arguments.

## Runtime

### Mocker Runner

#### `MockerRunner.Run() : void`

- Kind: `function`
- Location: `QaaS.Mocker/MockerRunner.cs:13`

_No XML summary provided._
