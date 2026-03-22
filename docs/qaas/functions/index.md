<!-- generated hash:baa8d09cb0d1 sources:Runner, functions -->

# Runner Functions

This page is generated from the docs generator function manifest and the current source tree.

## Configuration as Code

### Assertions

#### `AssertionBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:109`

Reads YAML configuration (not supported for AssertionBuilder)

#### `AssertionBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:118`

Writes the assertion builder configuration to YAML emitter

#### `AssertionBuilder.ReportOnlyStatuses(IList<AssertionStatus> statusesToReport) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:141`

Sets which assertion statuses should be reported

#### `AssertionBuilder.WithCategory(string category) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:152`

Sets the category for the assertion

#### `AssertionBuilder.WeatherToSaveSessionData(bool weatherToSaveSessionData) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:163`

Sets whether to save session data

#### `AssertionBuilder.WeatherToSaveLogs(bool weatherToSaveLogs) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:174`

Sets whether to save session logs.

#### `AssertionBuilder.WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:185`

Sets whether to save configuration template

#### `AssertionBuilder.WithSeverity(AssertionSeverity severity) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:196`

Sets the severity level for the assertion

#### `AssertionBuilder.WeatherToSaveAttachments(bool weatherToSaveAttachments) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:207`

Sets whether to save attachments

#### `AssertionBuilder.WeatherToDisplayTrace(bool weatherToDisplayTrace) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:218`

Sets whether to display assertion trace

#### `AssertionBuilder.Named(string name) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:229`

Sets the display name for the assertion

#### `AssertionBuilder.HookNamed(string hookName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:240`

Sets the assertion hook implementation name

#### `AssertionBuilder.AddDataSourceName(string dataSourceName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:251`

Adds a data source name filter

#### `AssertionBuilder.CreateDataSourceName(string dataSourceName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:257`

_No XML summary provided._

#### `AssertionBuilder.ReadDataSourceNames() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:262`

_No XML summary provided._

#### `AssertionBuilder.UpdateDataSourceName(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:267`

_No XML summary provided._

#### `AssertionBuilder.DeleteDataSourceName(string dataSourceName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:278`

_No XML summary provided._

#### `AssertionBuilder.AddDataSourcePattern(string dataSourcePattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:289`

Adds a data source pattern filter

#### `AssertionBuilder.CreateDataSourcePattern(string dataSourcePattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:295`

_No XML summary provided._

#### `AssertionBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:300`

_No XML summary provided._

#### `AssertionBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:305`

_No XML summary provided._

#### `AssertionBuilder.DeleteDataSourcePattern(string dataSourcePattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:316`

_No XML summary provided._

#### `AssertionBuilder.AddSessionName(string sessionName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:327`

Adds a session name filter

#### `AssertionBuilder.CreateSessionName(string sessionName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:333`

_No XML summary provided._

#### `AssertionBuilder.ReadSessionNames() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:338`

_No XML summary provided._

#### `AssertionBuilder.UpdateSessionName(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:343`

_No XML summary provided._

#### `AssertionBuilder.DeleteSessionName(string sessionName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:359`

_No XML summary provided._

#### `AssertionBuilder.AddSessionPattern(string sessionPattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:370`

Adds a session name pattern filter

#### `AssertionBuilder.CreateSessionPattern(string sessionPattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:378`

_No XML summary provided._

#### `AssertionBuilder.ReadSessionPatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:383`

_No XML summary provided._

#### `AssertionBuilder.UpdateSessionPattern(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:388`

_No XML summary provided._

#### `AssertionBuilder.DeleteSessionPattern(string sessionPattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:404`

_No XML summary provided._

#### `AssertionBuilder.AddLink(LinkBuilder linkBuilder) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:415`

Adds a link builder to the assertion

#### `AssertionBuilder.CreateLink(LinkBuilder linkBuilder) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:421`

_No XML summary provided._

#### `AssertionBuilder.ReadLinks() : IReadOnlyList<LinkBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:426`

_No XML summary provided._

#### `AssertionBuilder.UpdateLink(string name, LinkBuilder linkBuilder) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:431`

_No XML summary provided._

#### `AssertionBuilder.DeleteLink(string name) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:442`

_No XML summary provided._

#### `AssertionBuilder.Configure(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:453`

Configures the assertion with a configuration object

#### `AssertionBuilder.CreateConfiguration(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:463`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `AssertionBuilder.Create(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:471`

Compatibility alias for CreateConfiguration .

#### `AssertionBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:479`

Returns the currently configured assertion hook configuration.

#### `AssertionBuilder.UpdateConfiguration(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:487`

Merges the provided configuration object into the current assertion hook configuration.

#### `AssertionBuilder.DeleteConfiguration() : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:496`

Clears the configured assertion hook configuration.

### Collectors

#### `CollectorBuilder.Named(string name) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:50`

Sets the collector name.

#### `CollectorBuilder.FilterData(DataFilter dataFilter) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:59`

Sets the collector's data filter.

#### `CollectorBuilder.CollectInRange(CollectionRange collectionRange) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:68`

Sets the relative time window used for collection.

#### `CollectorBuilder.Create(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:77`

Compatibility alias for CreateConfiguration .

#### `CollectorBuilder.CreateConfiguration(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:85`

Sets the configured collector fetcher source.

#### `CollectorBuilder.ReadConfiguration() : IFetcherConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:93`

Returns the currently configured fetcher source, if any.

#### `CollectorBuilder.UpdateConfiguration(Func<IFetcherConfig, IFetcherConfig> update) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:101`

Applies a computed partial update to the current collector configuration while preserving omitted fields.

#### `CollectorBuilder.UpdateConfiguration(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:111`

Updates the collector configuration by merging same-type values and replacing the current type when needed.

#### `CollectorBuilder.UpdateConfiguration(object configuration) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:121`

Updates the collector configuration from an object-shaped patch while preserving omitted fields.

#### `CollectorBuilder.DeleteConfiguration() : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:131`

Clears the configured fetcher source.

#### `CollectorBuilder.Configure(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:145`

Replaces the current collector fetcher source with the provided configuration type.

### Consumers

#### `ConsumerBuilder.Named(string name) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:27`

_No XML summary provided._

#### `ConsumerBuilder.AtStage(int stage) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:33`

_No XML summary provided._

#### `ConsumerBuilder.WithTimeout(int timeoutMs) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:39`

_No XML summary provided._

#### `ConsumerBuilder.FilterData(DataFilter dataFilter) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:45`

_No XML summary provided._

#### `ConsumerBuilder.WithDeserializer(DeserializeConfig deserializeConfig) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:51`

_No XML summary provided._

#### `ConsumerBuilder.AddPolicy(PolicyBuilder policy) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:57`

_No XML summary provided._

#### `ConsumerBuilder.CreatePolicy(PolicyBuilder policy) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:65`

_No XML summary provided._

#### `ConsumerBuilder.ReadPolicies() : IReadOnlyList<PolicyBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:70`

_No XML summary provided._

#### `ConsumerBuilder.UpdatePolicyAt(int index, PolicyBuilder policy) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:75`

_No XML summary provided._

#### `ConsumerBuilder.DeletePolicyAt(int index) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:86`

_No XML summary provided._

#### `ConsumerBuilder.CreateConfiguration(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:100`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `ConsumerBuilder.Create(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:108`

Compatibility alias for CreateConfiguration .

#### `ConsumerBuilder.ReadConfiguration() : IReaderConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:116`

Returns the currently configured reader source, if any.

#### `ConsumerBuilder.UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:133`

Applies a computed partial update to the current consumer configuration while preserving omitted fields.

#### `ConsumerBuilder.UpdateConfiguration(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:143`

Updates the consumer configuration by merging same-type values and replacing the current type when needed.

#### `ConsumerBuilder.UpdateConfiguration(object configuration) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:153`

Updates the consumer configuration from an object-shaped patch while preserving omitted fields.

#### `ConsumerBuilder.DeleteConfiguration() : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:163`

Clears the configured reader source.

#### `ConsumerBuilder.Configure(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:186`

Replaces the current reader source with the provided configuration type.

### Executions

#### `ExecutionBuilder.WithGlobalDict(Dictionary<string, object?> globalDict) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:239`

_No XML summary provided._

#### `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:245`

_No XML summary provided._

#### `ExecutionBuilder.CreateSession(SessionBuilder sessionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:251`

_No XML summary provided._

#### `ExecutionBuilder.ReadSessions() : IReadOnlyList<SessionBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:256`

_No XML summary provided._

#### `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:261`

_No XML summary provided._

#### `ExecutionBuilder.DeleteSession(string sessionName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:267`

_No XML summary provided._

#### `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:273`

_No XML summary provided._

#### `ExecutionBuilder.CreateAssertion(AssertionBuilder assertionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:279`

_No XML summary provided._

#### `ExecutionBuilder.ReadAssertions() : IReadOnlyList<AssertionBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:284`

_No XML summary provided._

#### `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:289`

_No XML summary provided._

#### `ExecutionBuilder.DeleteAssertion(string assertionName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:295`

_No XML summary provided._

#### `ExecutionBuilder.AddStorage(StorageBuilder storageBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:301`

_No XML summary provided._

#### `ExecutionBuilder.CreateStorage(StorageBuilder storageBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:307`

_No XML summary provided._

#### `ExecutionBuilder.ReadStorages() : IReadOnlyList<StorageBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:312`

_No XML summary provided._

#### `ExecutionBuilder.UpdateStorageAt(int index, StorageBuilder storageBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:317`

_No XML summary provided._

#### `ExecutionBuilder.DeleteStorageAt(int index) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:323`

_No XML summary provided._

#### `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:329`

_No XML summary provided._

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:335`

_No XML summary provided._

#### `ExecutionBuilder.ReadDataSources() : IReadOnlyList<DataSourceBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:340`

_No XML summary provided._

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:345`

_No XML summary provided._

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:351`

_No XML summary provided._

#### `ExecutionBuilder.AddLink(LinkBuilder linkBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:357`

_No XML summary provided._

#### `ExecutionBuilder.CreateLink(LinkBuilder linkBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:363`

_No XML summary provided._

#### `ExecutionBuilder.ReadLinks() : IReadOnlyList<LinkBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:368`

_No XML summary provided._

#### `ExecutionBuilder.UpdateLinkAt(int index, LinkBuilder linkBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:373`

_No XML summary provided._

#### `ExecutionBuilder.DeleteLinkAt(int index) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:379`

_No XML summary provided._

#### `ExecutionBuilder.ExecutionType(ExecutionType executionType) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:385`

_No XML summary provided._

#### `ExecutionBuilder.SetCase(string caseName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:397`

_No XML summary provided._

#### `ExecutionBuilder.SetExecutionId(string executionId) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:403`

_No XML summary provided._

#### `ExecutionBuilder.WithMetadata(MetaDataConfig metaDataConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:409`

_No XML summary provided._

#### `ExecutionBuilder.Build() : Execution`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:698`

_No XML summary provided._

### Links

#### `LinkBuilder.Named(string name) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:31`

Sets the display name used for the generated link.

#### `LinkBuilder.Create(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:40`

Compatibility alias for CreateConfiguration .

#### `LinkBuilder.CreateConfiguration(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:48`

Sets the configured link source.

#### `LinkBuilder.ReadConfiguration() : ILinkConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:56`

Returns the currently configured link source, if any.

#### `LinkBuilder.UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:74`

Applies a computed partial update to the currently configured link config while preserving omitted fields.

#### `LinkBuilder.UpdateConfiguration(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:84`

Updates the configured link config by merging same-type values and replacing the current type when needed.

#### `LinkBuilder.UpdateConfiguration(object configuration) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:94`

Updates the configured link config from an object-shaped patch while preserving omitted fields.

#### `LinkBuilder.DeleteConfiguration() : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:104`

Clears the configured link source.

#### `LinkBuilder.Configure(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:120`

Replaces the current link source with the provided configuration type.

### Mocker Commands

#### `MockerCommandBuilder.Named(string name) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:51`

Sets the command name.

#### `MockerCommandBuilder.AtStage(int stage) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:60`

Sets the stage in which this command runs.

#### `MockerCommandBuilder.WithServerName(string serverName) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:69`

Sets the target mocker server name.

#### `MockerCommandBuilder.WithRedis(RedisConfig redis) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:78`

Sets redis connectivity used to communicate with the mocker.

#### `MockerCommandBuilder.WithRequestDurationMs(int requestDurationMs) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:87`

Sets per-request wait duration in milliseconds between retries.

#### `MockerCommandBuilder.WithRequestRetries(int requestRetries) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:96`

Sets retry count for ping/command requests.

#### `MockerCommandBuilder.Configure(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:105`

Sets command-specific configuration. Exactly one supported command type must be configured.

#### `MockerCommandBuilder.WithCommand(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:114`

Compatibility alias for Configure .

#### `MockerCommandBuilder.CreateConfiguration(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:122`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `MockerCommandBuilder.Create(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:130`

Compatibility alias for CreateConfiguration .

#### `MockerCommandBuilder.ReadConfiguration() : MockerCommandConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:138`

Returns the currently configured mocker command configuration, if any.

#### `MockerCommandBuilder.UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:146`

Applies a computed partial update to the current mocker command configuration while preserving omitted fields.

#### `MockerCommandBuilder.UpdateConfiguration(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:156`

Updates the mocker command configuration by merging same-type values and replacing the current type when needed.

#### `MockerCommandBuilder.UpdateConfiguration(object configuration) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:167`

Updates the mocker command configuration from an object-shaped patch while preserving omitted fields.

#### `MockerCommandBuilder.DeleteConfiguration() : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:178`

Clears the configured mocker command.

### Probes

#### `ProbeBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:51`

Reads YAML configuration for a probe builder.

#### `ProbeBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:60`

Writes the probe builder configuration to YAML.

#### `ProbeBuilder.Named(string name) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:76`

Sets the probe name.

#### `ProbeBuilder.AtStage(int stage) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:85`

Sets the stage in which the probe runs.

#### `ProbeBuilder.HookNamed(string hookName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:94`

Sets the probe hook implementation name.

#### `ProbeBuilder.AddDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:103`

Adds a data source name input to the probe.

#### `ProbeBuilder.CreateDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:114`

Compatibility alias for AddDataSourceName .

#### `ProbeBuilder.ReadDataSourceNames() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:122`

Returns the configured probe data source names.

#### `ProbeBuilder.UpdateDataSourceName(string existingValue, string newValue) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:130`

Replaces one configured probe data source name with another.

#### `ProbeBuilder.DeleteDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:144`

Removes a configured probe data source name.

#### `ProbeBuilder.RemoveDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:153`

Compatibility alias for DeleteDataSourceName .

#### `ProbeBuilder.AddDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:161`

Adds a data source pattern input to the probe.

#### `ProbeBuilder.CreateDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:172`

Compatibility alias for AddDataSourcePattern .

#### `ProbeBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:180`

Returns the configured probe data source patterns.

#### `ProbeBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:188`

Replaces one configured probe data source pattern with another.

#### `ProbeBuilder.DeleteDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:202`

Removes a configured probe data source pattern.

#### `ProbeBuilder.RemoveDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:211`

Compatibility alias for DeleteDataSourcePattern .

#### `ProbeBuilder.Configure(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:219`

Replaces the current probe configuration with the provided configuration object.

#### `ProbeBuilder.CreateConfiguration(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:229`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `ProbeBuilder.Create(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:237`

Compatibility alias for CreateConfiguration .

#### `ProbeBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:245`

Returns the currently configured probe configuration.

#### `ProbeBuilder.UpdateConfiguration(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:253`

Merges the provided configuration object into the current probe configuration.

#### `ProbeBuilder.DeleteConfiguration() : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:262`

Clears the configured probe configuration.

### Publishers

#### `PublisherBuilder.Named(string name) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:30`

_No XML summary provided._

#### `PublisherBuilder.AtStage(int stage) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:36`

_No XML summary provided._

#### `PublisherBuilder.FilterData(DataFilter dataFilter) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:42`

_No XML summary provided._

#### `PublisherBuilder.WithSerializer(SerializeConfig serializeConfig) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:48`

_No XML summary provided._

#### `PublisherBuilder.WithIterations(int iterations) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:54`

_No XML summary provided._

#### `PublisherBuilder.AddDataSource(string dataSourceName) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:60`

_No XML summary provided._

#### `PublisherBuilder.CreateDataSource(string dataSourceName) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:68`

_No XML summary provided._

#### `PublisherBuilder.ReadDataSources() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:73`

_No XML summary provided._

#### `PublisherBuilder.UpdateDataSource(string existingValue, string newValue) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:78`

_No XML summary provided._

#### `PublisherBuilder.DeleteDataSource(string dataSourceName) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:94`

_No XML summary provided._

#### `PublisherBuilder.AddDataSourcePattern(string dataSourcePattern) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:100`

_No XML summary provided._

#### `PublisherBuilder.CreateDataSourcePattern(string dataSourcePattern) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:108`

_No XML summary provided._

#### `PublisherBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:113`

_No XML summary provided._

#### `PublisherBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:118`

_No XML summary provided._

#### `PublisherBuilder.DeleteDataSourcePattern(string dataSourcePattern) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:134`

_No XML summary provided._

#### `PublisherBuilder.InLoops() : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:140`

_No XML summary provided._

#### `PublisherBuilder.WithSleep(ulong sleepTimeMs) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:146`

_No XML summary provided._

#### `PublisherBuilder.WithChunks(Chunks chunks) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:152`

_No XML summary provided._

#### `PublisherBuilder.AddPolicy(PolicyBuilder policy) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:158`

_No XML summary provided._

#### `PublisherBuilder.CreatePolicy(PolicyBuilder policy) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:166`

_No XML summary provided._

#### `PublisherBuilder.ReadPolicies() : IReadOnlyList<PolicyBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:171`

_No XML summary provided._

#### `PublisherBuilder.UpdatePolicyAt(int index, PolicyBuilder policy) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:176`

_No XML summary provided._

#### `PublisherBuilder.DeletePolicyAt(int index) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:187`

_No XML summary provided._

#### `PublisherBuilder.WithParallelism(int parallelism) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:198`

_No XML summary provided._

#### `PublisherBuilder.CreateConfiguration(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:207`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `PublisherBuilder.Create(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:215`

Compatibility alias for CreateConfiguration .

#### `PublisherBuilder.ReadConfiguration() : ISenderConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:223`

Returns the currently configured sender source, if any.

#### `PublisherBuilder.UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:241`

Applies a computed partial update to the current publisher configuration while preserving omitted fields.

#### `PublisherBuilder.UpdateConfiguration(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:251`

Updates the publisher configuration by merging same-type values and replacing the current type when needed.

#### `PublisherBuilder.UpdateConfiguration(object configuration) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:261`

Updates the publisher configuration from an object-shaped patch while preserving omitted fields.

#### `PublisherBuilder.DeleteConfiguration() : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:271`

Clears the configured sender source.

#### `PublisherBuilder.Configure(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:295`

Replaces the current sender source with the provided configuration type.

### Sessions

#### `SessionBuilder.Named(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:18`

_No XML summary provided._

#### `SessionBuilder.WithTimeoutBefore(uint timeout) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:24`

_No XML summary provided._

#### `SessionBuilder.WithTimeoutAfter(uint timeout) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:30`

_No XML summary provided._

#### `SessionBuilder.AtStage(int stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:36`

_No XML summary provided._

#### `SessionBuilder.RunSessionUntilStage(int stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:43`

_No XML summary provided._

#### `SessionBuilder.DiscardData() : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:49`

_No XML summary provided._

#### `SessionBuilder.WithinCategory(string category) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:55`

_No XML summary provided._

#### `SessionBuilder.AddConsumer(ConsumerBuilder consumerBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:61`

_No XML summary provided._

#### `SessionBuilder.CreateConsumer(ConsumerBuilder consumerBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:67`

_No XML summary provided._

#### `SessionBuilder.ReadConsumers() : IReadOnlyList<ConsumerBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:72`

_No XML summary provided._

#### `SessionBuilder.ReadConsumer(string name) : ConsumerBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:77`

_No XML summary provided._

#### `SessionBuilder.UpdateConsumer(string name, ConsumerBuilder consumerBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:82`

_No XML summary provided._

#### `SessionBuilder.UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:88`

_No XML summary provided._

#### `SessionBuilder.DeleteConsumer(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:94`

_No XML summary provided._

#### `SessionBuilder.AddPublisher(PublisherBuilder publisherBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:100`

_No XML summary provided._

#### `SessionBuilder.CreatePublisher(PublisherBuilder publisherBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:106`

_No XML summary provided._

#### `SessionBuilder.ReadPublishers() : IReadOnlyList<PublisherBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:111`

_No XML summary provided._

#### `SessionBuilder.ReadPublisher(string name) : PublisherBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:116`

_No XML summary provided._

#### `SessionBuilder.UpdatePublisher(string name, PublisherBuilder publisherBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:121`

_No XML summary provided._

#### `SessionBuilder.UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:127`

_No XML summary provided._

#### `SessionBuilder.DeletePublisher(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:133`

_No XML summary provided._

#### `SessionBuilder.AddTransaction(TransactionBuilder transactionBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:139`

_No XML summary provided._

#### `SessionBuilder.CreateTransaction(TransactionBuilder transactionBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:145`

_No XML summary provided._

#### `SessionBuilder.ReadTransactions() : IReadOnlyList<TransactionBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:150`

_No XML summary provided._

#### `SessionBuilder.ReadTransaction(string name) : TransactionBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:155`

_No XML summary provided._

#### `SessionBuilder.UpdateTransaction(string name, TransactionBuilder transactionBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:160`

_No XML summary provided._

#### `SessionBuilder.UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:166`

_No XML summary provided._

#### `SessionBuilder.DeleteTransaction(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:172`

_No XML summary provided._

#### `SessionBuilder.AddProbe(ProbeBuilder probeBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:178`

_No XML summary provided._

#### `SessionBuilder.CreateProbe(ProbeBuilder probeBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:184`

_No XML summary provided._

#### `SessionBuilder.ReadProbes() : IReadOnlyList<ProbeBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:189`

_No XML summary provided._

#### `SessionBuilder.ReadProbe(string name) : ProbeBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:194`

_No XML summary provided._

#### `SessionBuilder.UpdateProbe(string name, ProbeBuilder probeBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:199`

_No XML summary provided._

#### `SessionBuilder.UpdateProbe(string name, Func<ProbeBuilder, ProbeBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:205`

_No XML summary provided._

#### `SessionBuilder.DeleteProbe(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:211`

_No XML summary provided._

#### `SessionBuilder.AddCollector(CollectorBuilder collectorBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:217`

_No XML summary provided._

#### `SessionBuilder.CreateCollector(CollectorBuilder collectorBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:223`

_No XML summary provided._

#### `SessionBuilder.ReadCollectors() : IReadOnlyList<CollectorBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:228`

_No XML summary provided._

#### `SessionBuilder.ReadCollector(string name) : CollectorBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:233`

_No XML summary provided._

#### `SessionBuilder.UpdateCollector(string name, CollectorBuilder collectorBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:238`

_No XML summary provided._

#### `SessionBuilder.UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:244`

_No XML summary provided._

#### `SessionBuilder.DeleteCollector(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:250`

_No XML summary provided._

#### `SessionBuilder.AddMockerCommand(MockerCommandBuilder mockerCommandBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:256`

_No XML summary provided._

#### `SessionBuilder.CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:264`

_No XML summary provided._

#### `SessionBuilder.ReadMockerCommands() : IReadOnlyList<MockerCommandBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:269`

_No XML summary provided._

#### `SessionBuilder.ReadMockerCommand(string name) : MockerCommandBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:274`

_No XML summary provided._

#### `SessionBuilder.UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:279`

_No XML summary provided._

#### `SessionBuilder.UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:285`

_No XML summary provided._

#### `SessionBuilder.DeleteMockerCommand(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:291`

_No XML summary provided._

#### `SessionBuilder.AddStage(StageConfig stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:297`

_No XML summary provided._

#### `SessionBuilder.CreateStage(StageConfig stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:303`

_No XML summary provided._

#### `SessionBuilder.ReadStages() : IReadOnlyList<StageConfig>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:308`

_No XML summary provided._

#### `SessionBuilder.ReadStage(int stageNumber) : StageConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:313`

_No XML summary provided._

#### `SessionBuilder.UpdateStage(int stageNumber, StageConfig stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:318`

_No XML summary provided._

#### `SessionBuilder.DeleteStage(int stageNumber) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:330`

_No XML summary provided._

### Storages

#### `StorageBuilder.WithJsonStorageFormat(Formatting format) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:41`

Sets the JSON formatting used by runtime storages.

#### `StorageBuilder.Create(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:50`

Compatibility alias for CreateConfiguration .

#### `StorageBuilder.CreateConfiguration(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:58`

Sets the configured storage implementation source.

#### `StorageBuilder.ReadConfiguration() : IStorageConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:66`

Returns the currently configured storage source, if any.

#### `StorageBuilder.UpdateConfiguration(Func<IStorageConfig, IStorageConfig> update) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:74`

Applies a computed partial update to the current storage configuration while preserving omitted fields.

#### `StorageBuilder.UpdateConfiguration(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:84`

Updates the storage configuration by merging same-type values and replacing the current type when needed.

#### `StorageBuilder.UpdateConfiguration(object configuration) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:94`

Updates the storage configuration from an object-shaped patch while preserving omitted fields.

#### `StorageBuilder.DeleteConfiguration() : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:104`

Clears the configured storage source.

#### `StorageBuilder.Configure(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:112`

Replaces the current storage source with the provided configuration type.

### Transactions

#### `TransactionBuilder.Named(string name) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:80`

_No XML summary provided._

#### `TransactionBuilder.AtStage(int stage) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:86`

_No XML summary provided._

#### `TransactionBuilder.WithTimeout(int timeoutMs) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:92`

_No XML summary provided._

#### `TransactionBuilder.FilterInputData(DataFilter dataFilter) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:98`

_No XML summary provided._

#### `TransactionBuilder.FilterOutputData(DataFilter dataFilter) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:104`

_No XML summary provided._

#### `TransactionBuilder.WithDeserializer(DeserializeConfig deserializeConfig) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:110`

_No XML summary provided._

#### `TransactionBuilder.WithSerializer(SerializeConfig serializeConfig) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:116`

_No XML summary provided._

#### `TransactionBuilder.WithIterations(int iterations) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:122`

_No XML summary provided._

#### `TransactionBuilder.AddDataSource(string dataSourceName) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:128`

_No XML summary provided._

#### `TransactionBuilder.CreateDataSource(string dataSourceName) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:136`

_No XML summary provided._

#### `TransactionBuilder.AddDataSourcePattern(string dataSourcePattern) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:141`

_No XML summary provided._

#### `TransactionBuilder.CreateDataSourcePattern(string dataSourcePattern) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:149`

_No XML summary provided._

#### `TransactionBuilder.InLoops() : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:154`

_No XML summary provided._

#### `TransactionBuilder.WithSleep(ulong sleepTimeMs) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:160`

_No XML summary provided._

#### `TransactionBuilder.AddPolicy(PolicyBuilder policy) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:166`

_No XML summary provided._

#### `TransactionBuilder.CreatePolicy(PolicyBuilder policy) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:174`

_No XML summary provided._

#### `TransactionBuilder.ReadPolicies() : IReadOnlyList<PolicyBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:179`

_No XML summary provided._

#### `TransactionBuilder.UpdatePolicyAt(int index, PolicyBuilder policy) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:184`

_No XML summary provided._

#### `TransactionBuilder.DeletePolicyAt(int index) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:195`

_No XML summary provided._

#### `TransactionBuilder.ReadDataSources() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:206`

_No XML summary provided._

#### `TransactionBuilder.UpdateDataSource(string existingValue, string newValue) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:211`

_No XML summary provided._

#### `TransactionBuilder.DeleteDataSource(string dataSourceName) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:227`

_No XML summary provided._

#### `TransactionBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:233`

_No XML summary provided._

#### `TransactionBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:238`

_No XML summary provided._

#### `TransactionBuilder.DeleteDataSourcePattern(string dataSourcePattern) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:254`

_No XML summary provided._

#### `TransactionBuilder.CreateConfiguration(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:263`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `TransactionBuilder.Create(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:271`

Compatibility alias for CreateConfiguration .

#### `TransactionBuilder.ReadConfiguration() : ITransactorConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:279`

Returns the currently configured transactor source, if any.

#### `TransactionBuilder.UpdateConfiguration(Func<ITransactorConfig, ITransactorConfig> update) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:287`

Applies a computed partial update to the current transaction configuration while preserving omitted fields.

#### `TransactionBuilder.UpdateConfiguration(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:297`

Updates the transaction configuration by merging same-type values and replacing the current type when needed.

#### `TransactionBuilder.UpdateConfiguration(object configuration) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:307`

Updates the transaction configuration from an object-shaped patch while preserving omitted fields.

#### `TransactionBuilder.DeleteConfiguration() : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:317`

Clears the configured transactor source.

#### `TransactionBuilder.Configure(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:332`

Replaces the current transactor source with the provided configuration type.

## Getting Started

### Bootstrap

#### `Bootstrap.New(IEnumerable<string>? args = null) : Runner`

- Kind: `function`
- Location: `QaaS.Runner/Bootstrap.cs:28`

Creates a new Runner instance using default Runner type

#### `Bootstrap.New<TRunner>(IEnumerable<string>? args = null) : Runner`

- Kind: `function`
- Location: `QaaS.Runner/Bootstrap.cs:38`

Creates new Runner instance filled with QaaS objects based on parsed command-line arguments

## Runtime

### Runner

#### `Runner.Run() : void`

- Kind: `function`
- Location: `QaaS.Runner/Runner.cs:66`

Runs the configured lifecycle and applies the resulting exit code to the current process policy.

#### `Runner.RunAndGetExitCode() : int`

- Kind: `function`
- Location: `QaaS.Runner/Runner.cs:76`

Runs the configured lifecycle and returns the resulting exit code without terminating the current process.

#### `Runner.Dispose() : void`

- Kind: `function`
- Location: `QaaS.Runner/Runner.cs:223`

Disposes the runner scope exactly once.
