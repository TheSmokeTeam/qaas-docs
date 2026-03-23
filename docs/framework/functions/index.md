<!-- generated hash:5a57e7dde9f5 sources:Framework, functions -->

# Framework Functions

This page is generated from the docs generator function manifest and the current source tree.

## Configuration

### Placeholders

#### `PlaceholderConfigurationBuilderExtension.AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder) : IConfigurationBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/PlaceholderConfigurationBuilderExtension.cs:17`

Adds the placeholder-resolving configuration source to the configuration builder.

Call this extension before building IConfiguration when placeholder expansion should be applied as part of the configuration pipeline.

### YAML

#### `YamlConfigurationBuilderExtension.AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null) : IConfigurationBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:20`

Adds a YAML configuration source that is loaded through HTTP GET.

Call this extension during configuration bootstrap when YAML should be loaded remotely instead of from the local file system.

#### `YamlConfigurationBuilderExtension.AddYaml(this IConfigurationBuilder builder, string yamlPath) : IConfigurationBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:33`

Adds a YAML configuration source from a local file path or URL.

Call this extension during configuration bootstrap so YAML sources go through the same QaaS-aware loading path for files and remote URLs.

## Framework APIs

### Contexts

#### `ContextBuilder.SetLogger(ILogger logger) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:74`

Sets the logger stored on the built context.

The configured logger becomes the logger used by the context itself and by runtime components resolved from that context.

#### `ContextBuilder.SetConfigurationFile(string? configurationFile) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:87`

Sets the base configuration file used by the context builder.

Use this when the base configuration file should be selected or replaced after the builder has been created.

#### `ContextBuilder.WithOverwriteFile(string? overwriteFile) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:101`

Adds an overwrite file that should be applied during context construction.

Overwrite files are applied after the base configuration and before the final configuration is built.

#### `ContextBuilder.WithOverwriteFolder(string? overwriteFolder) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:115`

Adds an overwrite folder whose YAML files should be applied during context construction.

Every YAML file discovered in the folder is applied as an overwrite source in the order returned by the file-system enumeration.

#### `ContextBuilder.SetCase(string? caseFile) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:129`

Sets the case file applied by the context builder.

Case files are used as the final scenario-specific overlay that shapes the runtime configuration for a specific execution.

#### `ContextBuilder.SetExecutionId(string? executionId) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:145`

Sets the execution identifier stored on the built context.

The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

#### `ContextBuilder.WithOverwriteArgument(string? argument) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:158`

Adds a command-line style overwrite argument to the context builder.

Use this when command-line style overrides should participate in the same configuration pipeline as YAML sources.

#### `ContextBuilder.WithReferenceResolution(ReferenceConfig referenceConfig) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:172`

Adds a reference-resolution rule to the context builder.

Reference-resolution rules are applied while building the final configuration so linked configuration values can be expanded consistently.

#### `ContextBuilder.ResolveCaseLast() : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:185`

Delays case-file application until after reference resolution has completed.

This changes resolution order so the case overlay is applied after references are expanded from the base configuration and overwrites.

#### `ContextBuilder.WithEnvironmentVariableResolution() : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:198`

Enables environment-variable expansion while the context is being built.

Enable this when configuration values should resolve environment variables while the context is being built.

#### `ContextBuilder.SetCurrentRunningSessions(IInternalRunningSessions runningSessions) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:211`

Sets the running-session store used by the built context.

The running-session store allows runtime components to coordinate and inspect active sessions through the built context.

#### `ContextBuilder.BuildInternal() : InternalContext`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:259`

Builds an internal QaaS context from the current builder state.

Call this after all configuration inputs, overwrite sources, and resolution options have been registered on the builder. The returned internal context is used by the runtime bootstrap flow.

#### `ContextBuilder.Build() : Context`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:277`

Builds a public QaaS context from the current builder state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### Data Sources

#### `DataSourceBuilder.Named(string name) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:67`

Sets the name used for the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.HookNamed(string hookName) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:80`

Sets the hook implementation name used by the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.AddDataSourceName(string dataSourceName) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:93`

Adds the supplied data source name to the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.AddDataSourcePattern(string dataSourcePattern) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:106`

Adds the supplied data source pattern to the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.WithSerializer(SerializeConfig serializeConfig) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:119`

Sets the serializer configuration used by the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.WithDeserializer(DeserializeConfig deserializeConfig) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:132`

Sets the deserializer configuration used by the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.IsLazy() : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:145`

Marks the data source for lazy resolution.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.Configure(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:158`

Sets the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.CreateConfiguration(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:172`

Sets the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.Create(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:184`

Sets the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:196`

Returns the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

#### `DataSourceBuilder.UpdateConfiguration(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:208`

Updates the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.UpsertConfiguration(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:221`

Updates or creates the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.DeleteConfiguration() : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:233`

Clears the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `DataSourceBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer) : void`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:246`

Reads the serialized configuration for the current Framework data source builder instance.

This method participates in the YAML serialization surface that backs configuration-as-code support.

#### `DataSourceBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer) : void`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:259`

Writes the current Framework data source builder configuration to the configured serializer output.

This method participates in the YAML serialization surface that backs configuration-as-code support.

#### `DataSourceBuilder.Register() : DataSource`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:283`

Registers the configured data source definition and returns the resulting data source descriptor.

Registration produces the immutable data-source descriptor that is later resolved against generator hooks during execution build.

#### `DataSourceBuilder.Build(InternalContext context, IEnumerable<DataSource> dataSources, IEnumerable<KeyValuePair<string, IGenerator>> generators) : DataSource`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:304`

Builds the configured Framework data source builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### Policies

#### `PolicyBuilder.Configure(IPolicyConfig config) : PolicyBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Policies/PolicyBuilder.cs:43`

Sets the configuration currently stored on the Framework policy builder instance.

Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

#### `PolicyBuilder.Build() : Policy`

- Kind: `function`
- Location: `QaaS.Framework.Policies/PolicyBuilder.cs:77`

Builds the configured Framework policy builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

#### `PolicyBuilder.BuildPolicies(PolicyBuilder[]? policyBuilders) : Policy?`

- Kind: `function`
- Location: `QaaS.Framework.Policies/PolicyBuilder.cs:114`

Builds a policy chain from the supplied policy builder collection.

This helper lets callers collapse several fluent policy builders into the policy chain consumed by the runtime configuration surface.

## Utilities

### Enumerables

#### `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable) : TItem`

- Kind: `function`
- Location: `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:17`

Returns the single item contained in the provided sequence.

The helper enforces the invariant that exactly one item must be present and throws when the sequence is empty or contains more than one value.

#### `EnumerableExtensions.GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList) : IList<TData>`

- Kind: `function`
- Location: `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:44`

Filters configuration objects by the supplied conditions and returns the matching items.

The helper keeps configuration filtering logic centralized so callers can apply consistent matching and error reporting across builder surfaces.
