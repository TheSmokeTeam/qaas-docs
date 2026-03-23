<!-- generated hash:d3523ed27bd1 sources:Runner, functions -->

# Runner Functions

This page is generated from the docs generator function manifest and the current source tree.

## Configuration as Code

### Assertions

#### `AssertionBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:113`

Reads the serialized configuration for the current Runner assertion builder instance.

This method participates in the YAML serialization surface that backs configuration-as-code support.

#### `AssertionBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:126`

Writes the current Runner assertion builder configuration to the configured serializer output.

This method participates in the YAML serialization surface that backs configuration-as-code support.

#### `AssertionBuilder.ReportOnlyStatuses(IList<AssertionStatus> statusesToReport) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:151`

Sets which assertion statuses should be included in reports.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WithCategory(string category) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:164`

Configures category on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WeatherToSaveSessionData(bool weatherToSaveSessionData) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:177`

Configures whether session data is saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WeatherToSaveLogs(bool weatherToSaveLogs) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:190`

Configures whether logs are saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:203`

Configures whether the rendered configuration template is saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WithSeverity(AssertionSeverity severity) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:216`

Sets the severity associated with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WeatherToSaveAttachments(bool weatherToSaveAttachments) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:229`

Configures whether attachments are saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.WeatherToDisplayTrace(bool weatherToDisplayTrace) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:242`

Configures whether the assertion trace is displayed with the result.

Use this method when working with the documented Runner assertion builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Assertions'.

#### `AssertionBuilder.Named(string name) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:255`

Sets the name used for the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.HookNamed(string hookName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:268`

Sets the hook implementation name used by the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.AddDataSourceName(string dataSourceName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:281`

Adds the supplied data source name to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.CreateDataSourceName(string dataSourceName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:294`

Creates or adds the configured data source name entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.ReadDataSourceNames() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:306`

Returns the configured data source names currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `AssertionBuilder.UpdateDataSourceName(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:318`

Updates the configured data source name stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.DeleteDataSourceName(string dataSourceName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:336`

Removes the configured data source name from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.AddDataSourcePattern(string dataSourcePattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:349`

Adds the supplied data source pattern to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.CreateDataSourcePattern(string dataSourcePattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:362`

Creates or adds the configured data source pattern entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:374`

Returns the configured data source patterns currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `AssertionBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:386`

Updates the configured data source pattern stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.DeleteDataSourcePattern(string dataSourcePattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:404`

Removes the configured data source pattern from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.AddSessionName(string sessionName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:417`

Adds the supplied session name to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.CreateSessionName(string sessionName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:430`

Creates or adds the configured session name entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.ReadSessionNames() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:442`

Returns the configured session names currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `AssertionBuilder.UpdateSessionName(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:454`

Updates the configured session name stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.DeleteSessionName(string sessionName) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:477`

Removes the configured session name from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.AddSessionPattern(string sessionPattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:490`

Adds the supplied session pattern to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.CreateSessionPattern(string sessionPattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:505`

Creates or adds the configured session pattern entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.ReadSessionPatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:517`

Returns the configured session patterns currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `AssertionBuilder.UpdateSessionPattern(string existingValue, string newValue) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:529`

Updates the configured session pattern stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.DeleteSessionPattern(string sessionPattern) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:552`

Removes the configured session pattern from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.AddLink(LinkBuilder linkBuilder) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:565`

Adds the supplied link to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.CreateLink(LinkBuilder linkBuilder) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:578`

Creates or adds the configured link entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.ReadLinks() : IReadOnlyList<LinkBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:590`

Returns the configured links currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `AssertionBuilder.UpdateLink(string name, LinkBuilder linkBuilder) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:602`

Updates the configured link stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.DeleteLink(string name) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:620`

Removes the configured link from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.Configure(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:633`

Sets the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.CreateConfiguration(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:647`

Sets the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.Create(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:659`

Sets the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:671`

Returns the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `AssertionBuilder.UpdateConfiguration(object configuration) : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:683`

Updates the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `AssertionBuilder.DeleteConfiguration() : AssertionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:696`

Clears the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Collectors

#### `CollectorBuilder.Named(string name) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:54`

Sets the name used for the current Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.FilterData(DataFilter dataFilter) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:67`

Sets the data filter used by the current Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.CollectInRange(CollectionRange collectionRange) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:80`

Configures collect in range on the current Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Collectors'.

#### `CollectorBuilder.Create(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:93`

Sets the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.CreateConfiguration(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:105`

Sets the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.ReadConfiguration() : IFetcherConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:117`

Returns the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `CollectorBuilder.UpdateConfiguration(Func<IFetcherConfig, IFetcherConfig> update) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:129`

Updates the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.UpdateConfiguration(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:143`

Updates the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.UpdateConfiguration(object configuration) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:157`

Updates the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.DeleteConfiguration() : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:171`

Clears the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `CollectorBuilder.Configure(IFetcherConfig config) : CollectorBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:189`

Sets the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Consumers

#### `ConsumerBuilder.Named(string name) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:34`

Sets the name used for the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.AtStage(int stage) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:47`

Sets the stage used by the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.WithTimeout(int timeoutMs) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:60`

Configures timeout on the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.FilterData(DataFilter dataFilter) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:73`

Sets the data filter used by the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.WithDeserializer(DeserializeConfig deserializeConfig) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:86`

Sets the deserializer configuration used by the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.AddPolicy(PolicyBuilder policy) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:99`

Adds the supplied policy to the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.CreatePolicy(PolicyBuilder policy) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:114`

Creates or adds the configured policy entry on the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.ReadPolicies() : IReadOnlyList<PolicyBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:126`

Returns the configured policies currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ConsumerBuilder.UpdatePolicyAt(int index, PolicyBuilder policy) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:138`

Updates the configured policy at stored on the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.DeletePolicyAt(int index) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:156`

Removes the configured policy at from the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.CreateConfiguration(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:174`

Sets the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.Create(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:186`

Sets the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.ReadConfiguration() : IReaderConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:198`

Returns the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ConsumerBuilder.UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:219`

Updates the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.UpdateConfiguration(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:233`

Updates the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.UpdateConfiguration(object configuration) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:247`

Updates the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.DeleteConfiguration() : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:261`

Clears the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ConsumerBuilder.Configure(IReaderConfig config) : ConsumerBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:288`

Sets the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Executions

#### `ExecutionBuilder.WithGlobalDict(Dictionary<string, object?> globalDict) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:246`

Replaces the global dictionary stored on the runner execution context.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:259`

Adds the supplied session to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateSession(SessionBuilder sessionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:272`

Creates or adds the configured session entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadSessions() : IReadOnlyList<SessionBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:284`

Returns the configured sessions currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:296`

Updates the configured session stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteSession(string sessionName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:309`

Removes the configured session from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:322`

Adds the supplied assertion to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateAssertion(AssertionBuilder assertionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:335`

Creates or adds the configured assertion entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadAssertions() : IReadOnlyList<AssertionBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:347`

Returns the configured assertions currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:359`

Updates the configured assertion stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteAssertion(string assertionName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:372`

Removes the configured assertion from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.AddStorage(StorageBuilder storageBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:385`

Adds the supplied storage to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateStorage(StorageBuilder storageBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:398`

Creates or adds the configured storage entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadStorages() : IReadOnlyList<StorageBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:410`

Returns the configured storages currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateStorageAt(int index, StorageBuilder storageBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:422`

Updates the configured storage at stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteStorageAt(int index) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:435`

Removes the configured storage at from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:448`

Adds the supplied data source to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:461`

Creates or adds the configured data source entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadDataSources() : IReadOnlyList<DataSourceBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:473`

Returns the configured data sources currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:485`

Updates the configured data source stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:498`

Removes the configured data source from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.AddLink(LinkBuilder linkBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:511`

Adds the supplied link to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.CreateLink(LinkBuilder linkBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:524`

Creates or adds the configured link entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ReadLinks() : IReadOnlyList<LinkBuilder>`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:536`

Returns the configured links currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ExecutionBuilder.UpdateLinkAt(int index, LinkBuilder linkBuilder) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:548`

Updates the configured link at stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.DeleteLinkAt(int index) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:561`

Removes the configured link at from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.ExecutionType(ExecutionType executionType) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:574`

Sets the execution type used when the runner execution is built.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.SetCase(string caseName) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:593`

Sets the case file applied by the context builder.

Case files are used as the final scenario-specific overlay that shapes the runtime configuration for a specific execution.

#### `ExecutionBuilder.SetExecutionId(string executionId) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:606`

Sets the execution identifier stored on the built context.

The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

#### `ExecutionBuilder.WithMetadata(MetaDataConfig metaDataConfig) : ExecutionBuilder`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:619`

Sets the metadata configuration stored on the execution.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ExecutionBuilder.Build() : Execution`

- Kind: `function`
- Location: `QaaS.Runner/ExecutionBuilder.cs:914`

Builds the configured Runner execution builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### Links

#### `LinkBuilder.Named(string name) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:35`

Sets the name used for the current Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.Create(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:48`

Sets the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.CreateConfiguration(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:60`

Sets the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.ReadConfiguration() : ILinkConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:72`

Returns the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `LinkBuilder.UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:94`

Updates the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.UpdateConfiguration(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:108`

Updates the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.UpdateConfiguration(object configuration) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:122`

Updates the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.DeleteConfiguration() : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:136`

Clears the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `LinkBuilder.Configure(ILinkConfig config) : LinkBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:156`

Sets the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Mocker Commands

#### `MockerCommandBuilder.Named(string name) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:55`

Sets the name used for the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.AtStage(int stage) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:68`

Sets the stage used by the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.WithServerName(string serverName) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:81`

Configures server name on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.WithRedis(RedisConfig redis) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:94`

Configures redis on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.WithRequestDurationMs(int requestDurationMs) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:107`

Configures request duration ms on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.WithRequestRetries(int requestRetries) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:120`

Configures request retries on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.Configure(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:133`

Sets the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.WithCommand(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:146`

Configures command on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.CreateConfiguration(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:158`

Sets the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.Create(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:170`

Sets the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.ReadConfiguration() : MockerCommandConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:182`

Returns the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `MockerCommandBuilder.UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:194`

Updates the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.UpdateConfiguration(MockerCommandConfig command) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:208`

Updates the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.UpdateConfiguration(object configuration) : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:223`

Updates the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `MockerCommandBuilder.DeleteConfiguration() : MockerCommandBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:238`

Clears the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Probes

#### `ProbeBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:55`

Reads the serialized configuration for the current Runner probe builder instance.

This method participates in the YAML serialization surface that backs configuration-as-code support.

#### `ProbeBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer) : void`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:68`

Writes the current Runner probe builder configuration to the configured serializer output.

This method participates in the YAML serialization surface that backs configuration-as-code support.

#### `ProbeBuilder.Named(string name) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:88`

Sets the name used for the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.AtStage(int stage) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:101`

Sets the stage used by the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.HookNamed(string hookName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:114`

Sets the hook implementation name used by the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.AddDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:127`

Adds the supplied data source name to the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.CreateDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:142`

Creates or adds the configured data source name entry on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.ReadDataSourceNames() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:154`

Returns the configured data source names currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ProbeBuilder.UpdateDataSourceName(string existingValue, string newValue) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:166`

Updates the configured data source name stored on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.DeleteDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:184`

Removes the configured data source name from the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.RemoveDataSourceName(string dataSourceName) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:197`

Configures remove data source name on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Probes'.

#### `ProbeBuilder.AddDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:209`

Adds the supplied data source pattern to the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.CreateDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:224`

Creates or adds the configured data source pattern entry on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:236`

Returns the configured data source patterns currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ProbeBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:248`

Updates the configured data source pattern stored on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.DeleteDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:266`

Removes the configured data source pattern from the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.RemoveDataSourcePattern(string dataSourcePattern) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:279`

Configures remove data source pattern on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Probes'.

#### `ProbeBuilder.Configure(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:291`

Sets the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.CreateConfiguration(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:305`

Sets the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.Create(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:317`

Sets the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:329`

Returns the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `ProbeBuilder.UpdateConfiguration(object configuration) : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:341`

Updates the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `ProbeBuilder.DeleteConfiguration() : ProbeBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:354`

Clears the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Publishers

#### `PublisherBuilder.Named(string name) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:37`

Sets the name used for the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.AtStage(int stage) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:50`

Sets the stage used by the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.FilterData(DataFilter dataFilter) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:63`

Sets the data filter used by the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.WithSerializer(SerializeConfig serializeConfig) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:76`

Sets the serializer configuration used by the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.WithIterations(int iterations) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:89`

Sets how many iterations the transaction should execute.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.AddDataSource(string dataSourceName) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:102`

Adds the supplied data source to the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.CreateDataSource(string dataSourceName) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:117`

Creates or adds the configured data source entry on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.ReadDataSources() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:129`

Returns the configured data sources currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `PublisherBuilder.UpdateDataSource(string existingValue, string newValue) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:141`

Updates the configured data source stored on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.DeleteDataSource(string dataSourceName) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:164`

Removes the configured data source from the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.AddDataSourcePattern(string dataSourcePattern) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:177`

Adds the supplied data source pattern to the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.CreateDataSourcePattern(string dataSourcePattern) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:192`

Creates or adds the configured data source pattern entry on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:204`

Returns the configured data source patterns currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `PublisherBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:216`

Updates the configured data source pattern stored on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.DeleteDataSourcePattern(string dataSourcePattern) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:239`

Removes the configured data source pattern from the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.InLoops() : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:252`

Marks the transaction to execute continuously in loop mode.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.WithSleep(ulong sleepTimeMs) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:265`

Sets the delay applied between transaction iterations.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.WithChunks(Chunks chunks) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:278`

Configures chunks on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.AddPolicy(PolicyBuilder policy) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:291`

Adds the supplied policy to the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.CreatePolicy(PolicyBuilder policy) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:306`

Creates or adds the configured policy entry on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.ReadPolicies() : IReadOnlyList<PolicyBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:318`

Returns the configured policies currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `PublisherBuilder.UpdatePolicyAt(int index, PolicyBuilder policy) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:330`

Updates the configured policy at stored on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.DeletePolicyAt(int index) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:348`

Removes the configured policy at from the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.WithParallelism(int parallelism) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:366`

Configures parallelism on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.CreateConfiguration(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:379`

Sets the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.Create(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:391`

Sets the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.ReadConfiguration() : ISenderConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:403`

Returns the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `PublisherBuilder.UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:425`

Updates the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.UpdateConfiguration(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:439`

Updates the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.UpdateConfiguration(object configuration) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:453`

Updates the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.DeleteConfiguration() : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:467`

Clears the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PublisherBuilder.Configure(ISenderConfig config) : PublisherBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:495`

Sets the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Sessions

#### `SessionBuilder.Named(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:25`

Sets the name used for the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.WithTimeoutBefore(uint timeout) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:38`

Sets the timeout applied before the session runs.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.WithTimeoutAfter(uint timeout) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:51`

Sets the timeout applied after the session runs.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AtStage(int stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:64`

Sets the stage used by the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.RunSessionUntilStage(int stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:78`

Limits the session to run only until the specified stage.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DiscardData() : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:91`

Disables data persistence for the configured session.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.WithinCategory(string category) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:104`

Sets the category used by the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddConsumer(ConsumerBuilder consumerBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:117`

Adds the supplied consumer to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreateConsumer(ConsumerBuilder consumerBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:130`

Creates or adds the configured consumer entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadConsumers() : IReadOnlyList<ConsumerBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:142`

Returns the configured consumers currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadConsumer(string name) : ConsumerBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:154`

Returns the configured consumer currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdateConsumer(string name, ConsumerBuilder consumerBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:166`

Updates the configured consumer stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:179`

Updates the configured consumer stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeleteConsumer(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:192`

Removes the configured consumer from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddPublisher(PublisherBuilder publisherBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:205`

Adds the supplied publisher to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreatePublisher(PublisherBuilder publisherBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:218`

Creates or adds the configured publisher entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadPublishers() : IReadOnlyList<PublisherBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:230`

Returns the configured publishers currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadPublisher(string name) : PublisherBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:242`

Returns the configured publisher currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdatePublisher(string name, PublisherBuilder publisherBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:254`

Updates the configured publisher stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:267`

Updates the configured publisher stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeletePublisher(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:280`

Removes the configured publisher from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddTransaction(TransactionBuilder transactionBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:293`

Adds the supplied transaction to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreateTransaction(TransactionBuilder transactionBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:306`

Creates or adds the configured transaction entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadTransactions() : IReadOnlyList<TransactionBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:318`

Returns the configured transactions currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadTransaction(string name) : TransactionBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:330`

Returns the configured transaction currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdateTransaction(string name, TransactionBuilder transactionBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:342`

Updates the configured transaction stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:355`

Updates the configured transaction stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeleteTransaction(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:368`

Removes the configured transaction from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddProbe(ProbeBuilder probeBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:381`

Adds the supplied probe to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreateProbe(ProbeBuilder probeBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:394`

Creates or adds the configured probe entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadProbes() : IReadOnlyList<ProbeBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:406`

Returns the configured probes currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadProbe(string name) : ProbeBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:418`

Returns the configured probe currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdateProbe(string name, ProbeBuilder probeBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:430`

Updates the configured probe stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.UpdateProbe(string name, Func<ProbeBuilder, ProbeBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:443`

Updates the configured probe stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeleteProbe(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:456`

Removes the configured probe from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddCollector(CollectorBuilder collectorBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:469`

Adds the supplied collector to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreateCollector(CollectorBuilder collectorBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:482`

Creates or adds the configured collector entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadCollectors() : IReadOnlyList<CollectorBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:494`

Returns the configured collectors currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadCollector(string name) : CollectorBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:506`

Returns the configured collector currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdateCollector(string name, CollectorBuilder collectorBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:518`

Updates the configured collector stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:531`

Updates the configured collector stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeleteCollector(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:544`

Removes the configured collector from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddMockerCommand(MockerCommandBuilder mockerCommandBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:557`

Adds the supplied mocker command to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:572`

Creates or adds the configured mocker command entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadMockerCommands() : IReadOnlyList<MockerCommandBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:584`

Returns the configured mocker commands currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadMockerCommand(string name) : MockerCommandBuilder?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:596`

Returns the configured mocker command currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:608`

Updates the configured mocker command stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:621`

Updates the configured mocker command stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeleteMockerCommand(string name) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:634`

Removes the configured mocker command from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.AddStage(StageConfig stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:647`

Adds the supplied stage to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.CreateStage(StageConfig stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:660`

Creates or adds the configured stage entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.ReadStages() : IReadOnlyList<StageConfig>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:672`

Returns the configured stages currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.ReadStage(int stageNumber) : StageConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:684`

Returns the configured stage currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `SessionBuilder.UpdateStage(int stageNumber, StageConfig stage) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:696`

Updates the configured stage stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `SessionBuilder.DeleteStage(int stageNumber) : SessionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:715`

Removes the configured stage from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Storages

#### `StorageBuilder.WithJsonStorageFormat(Formatting format) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:45`

Sets the JSON formatting used by runtime storages.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.Create(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:58`

Sets the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.CreateConfiguration(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:70`

Sets the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.ReadConfiguration() : IStorageConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:82`

Returns the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `StorageBuilder.UpdateConfiguration(Func<IStorageConfig, IStorageConfig> update) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:94`

Updates the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.UpdateConfiguration(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:108`

Updates the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.UpdateConfiguration(object configuration) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:122`

Updates the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.DeleteConfiguration() : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:136`

Clears the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `StorageBuilder.Configure(IStorageConfig storageConfig) : StorageBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Storage/StorageBuilder.cs:148`

Sets the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Transactions

#### `TransactionBuilder.Named(string name) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:87`

Sets the name used for the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.AtStage(int stage) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:100`

Sets the stage used by the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.WithTimeout(int timeoutMs) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:113`

Configures timeout on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.FilterInputData(DataFilter dataFilter) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:126`

Sets the input data filter used by the transaction.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.FilterOutputData(DataFilter dataFilter) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:139`

Sets the output data filter used by the transaction.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.WithDeserializer(DeserializeConfig deserializeConfig) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:152`

Sets the deserializer configuration used by the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.WithSerializer(SerializeConfig serializeConfig) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:165`

Sets the serializer configuration used by the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.WithIterations(int iterations) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:178`

Sets how many iterations the transaction should execute.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.AddDataSource(string dataSourceName) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:191`

Adds the supplied data source to the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.CreateDataSource(string dataSourceName) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:206`

Creates or adds the configured data source entry on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.AddDataSourcePattern(string dataSourcePattern) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:218`

Adds the supplied data source pattern to the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.CreateDataSourcePattern(string dataSourcePattern) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:233`

Creates or adds the configured data source pattern entry on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.InLoops() : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:245`

Marks the transaction to execute continuously in loop mode.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.WithSleep(ulong sleepTimeMs) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:258`

Sets the delay applied between transaction iterations.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.AddPolicy(PolicyBuilder policy) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:271`

Adds the supplied policy to the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.CreatePolicy(PolicyBuilder policy) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:286`

Creates or adds the configured policy entry on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.ReadPolicies() : IReadOnlyList<PolicyBuilder>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:298`

Returns the configured policies currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `TransactionBuilder.UpdatePolicyAt(int index, PolicyBuilder policy) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:310`

Updates the configured policy at stored on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.DeletePolicyAt(int index) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:328`

Removes the configured policy at from the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.ReadDataSources() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:346`

Returns the configured data sources currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `TransactionBuilder.UpdateDataSource(string existingValue, string newValue) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:358`

Updates the configured data source stored on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.DeleteDataSource(string dataSourceName) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:381`

Removes the configured data source from the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.ReadDataSourcePatterns() : IReadOnlyList<string>`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:394`

Returns the configured data source patterns currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `TransactionBuilder.UpdateDataSourcePattern(string existingValue, string newValue) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:406`

Updates the configured data source pattern stored on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.DeleteDataSourcePattern(string dataSourcePattern) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:429`

Removes the configured data source pattern from the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.CreateConfiguration(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:442`

Sets the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.Create(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:454`

Sets the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.ReadConfiguration() : ITransactorConfig?`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:466`

Returns the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `TransactionBuilder.UpdateConfiguration(Func<ITransactorConfig, ITransactorConfig> update) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:478`

Updates the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.UpdateConfiguration(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:492`

Updates the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.UpdateConfiguration(object configuration) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:506`

Updates the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.DeleteConfiguration() : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:520`

Clears the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `TransactionBuilder.Configure(ITransactorConfig config) : TransactionBuilder`

- Kind: `function`
- Location: `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:539`

Sets the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Getting Started

### Bootstrap

#### `Bootstrap.New(IEnumerable<string>? args = null) : Runner`

- Kind: `function`
- Location: `QaaS.Runner/Bootstrap.cs:30`

Creates a new Runner bootstrap instance from the supplied bootstrap inputs.

This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

#### `Bootstrap.New<TRunner>(IEnumerable<string>? args = null) : Runner`

- Kind: `function`
- Location: `QaaS.Runner/Bootstrap.cs:42`

Creates a new Runner bootstrap instance from the supplied bootstrap inputs.

This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## Runtime

### Runner

#### `Runner.Run() : void`

- Kind: `function`
- Location: `QaaS.Runner/Runner.cs:70`

Runs the configured lifecycle and applies the resulting exit code policy.

Call this when the current process should honor Runner exit behavior. If the caller needs to inspect the exit code without terminating the process, prefer RunAndGetExitCode().

#### `Runner.RunAndGetExitCode() : int`

- Kind: `function`
- Location: `QaaS.Runner/Runner.cs:83`

Runs the configured lifecycle and returns the resulting exit code to the caller.

Call this when the caller wants to control how the resulting exit code is handled instead of letting Runner apply its default process policy.

#### `Runner.Dispose() : void`

- Kind: `function`
- Location: `QaaS.Runner/Runner.cs:234`

Releases the resources owned by the Runner runner instance.

Dispose should be called exactly once when the host is no longer needed so scopes, loggers, and other runtime resources are released deterministically.
