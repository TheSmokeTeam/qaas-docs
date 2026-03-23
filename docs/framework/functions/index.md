<!-- generated hash:ab8ac2d43851 sources:Framework, functions -->

# Framework Functions

This page is generated from source-level `qaas-docs` annotations and the current source tree.

## Configuration

### Placeholders

<hr class="function-separator" />

#### `PlaceholderConfigurationBuilderExtension.AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)`

**Location** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/PlaceholderConfigurationBuilderExtension.cs:17`

**Complete Signature**
```csharp
public static IConfigurationBuilder AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)
```

**Docstring**

Adds the placeholder-resolving configuration source to the configuration builder.

Call this extension before building IConfiguration when placeholder expansion should be applied as part of the configuration pipeline.

### YAML

<hr class="function-separator" />

#### `YamlConfigurationBuilderExtension.AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)`

**Location** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:20`

**Complete Signature**
```csharp
public static IConfigurationBuilder AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)
```

**Docstring**

Adds a YAML configuration source that is loaded through HTTP GET.

Call this extension during configuration bootstrap when YAML should be loaded remotely instead of from the local file system.

<hr class="function-separator" />

#### `YamlConfigurationBuilderExtension.AddYaml(this IConfigurationBuilder builder, string yamlPath)`

**Location** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:33`

**Complete Signature**
```csharp
public static IConfigurationBuilder AddYaml(this IConfigurationBuilder builder, string yamlPath)
```

**Docstring**

Adds a YAML configuration source from a local file path or URL.

Call this extension during configuration bootstrap so YAML sources go through the same QaaS-aware loading path for files and remote URLs.

## Framework APIs

### Contexts

<hr class="function-separator" />

#### `ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:44`

**Complete Signature**
```csharp
public ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
```

**Docstring**

Creates a context builder that starts from a base QaaS configuration file.

Use this constructor when the context should load its initial configuration from a file path before overwrite sources and reference resolution are applied.

<hr class="function-separator" />

#### `ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:66`

**Complete Signature**
```csharp
public ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
```

**Docstring**

Creates a context builder that starts from an existing configuration builder pipeline.

Use this constructor when configuration sources are assembled externally and should be handed to the QaaS context pipeline as-is.

<hr class="function-separator" />

#### `ContextBuilder.SetLogger(ILogger logger)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:82`

**Complete Signature**
```csharp
public IContextBuilder SetLogger(ILogger logger)
```

**Docstring**

Sets the logger stored on the built context.

The configured logger becomes the logger used by the context itself and by runtime components resolved from that context.

<hr class="function-separator" />

#### `ContextBuilder.SetConfigurationFile(string? configurationFile)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:95`

**Complete Signature**
```csharp
public IContextBuilder SetConfigurationFile(string? configurationFile)
```

**Docstring**

Sets the base configuration file used by the context builder.

Use this when the base configuration file should be selected or replaced after the builder has been created.

<hr class="function-separator" />

#### `ContextBuilder.WithOverwriteFile(string? overwriteFile)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:109`

**Complete Signature**
```csharp
public IContextBuilder WithOverwriteFile(string? overwriteFile)
```

**Docstring**

Adds an overwrite file that should be applied during context construction.

Overwrite files are applied after the base configuration and before the final configuration is built.

<hr class="function-separator" />

#### `ContextBuilder.WithOverwriteFolder(string? overwriteFolder)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:123`

**Complete Signature**
```csharp
public IContextBuilder WithOverwriteFolder(string? overwriteFolder)
```

**Docstring**

Adds an overwrite folder whose YAML files should be applied during context construction.

Every YAML file discovered in the folder is applied as an overwrite source in the order returned by the file-system enumeration.

<hr class="function-separator" />

#### `ContextBuilder.SetCase(string? caseFile)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:137`

**Complete Signature**
```csharp
public IContextBuilder SetCase(string? caseFile)
```

**Docstring**

Sets the case file used during context construction.

The supplied value is also stored as the case name on the built context.

<hr class="function-separator" />

#### `ContextBuilder.SetExecutionId(string? executionId)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:153`

**Complete Signature**
```csharp
public IContextBuilder SetExecutionId(string? executionId)
```

**Docstring**

Sets the execution identifier stored on the built context.

The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

<hr class="function-separator" />

#### `ContextBuilder.WithOverwriteArgument(string? argument)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:166`

**Complete Signature**
```csharp
public IContextBuilder WithOverwriteArgument(string? argument)
```

**Docstring**

Adds a command-line style overwrite argument to the context builder.

Use this when command-line style overrides should participate in the same configuration pipeline as YAML sources.

<hr class="function-separator" />

#### `ContextBuilder.WithReferenceResolution(ReferenceConfig referenceConfig)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:180`

**Complete Signature**
```csharp
public IContextBuilder WithReferenceResolution(ReferenceConfig referenceConfig)
```

**Docstring**

Adds a reference-resolution rule to the context builder.

Reference-resolution rules are applied while building the final configuration so linked configuration values can be expanded consistently.

<hr class="function-separator" />

#### `ContextBuilder.ResolveCaseLast()`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:193`

**Complete Signature**
```csharp
public IContextBuilder ResolveCaseLast()
```

**Docstring**

Delays case-file application until after reference resolution has completed.

This changes resolution order so the case overlay is applied after references are expanded from the base configuration and overwrites.

<hr class="function-separator" />

#### `ContextBuilder.WithEnvironmentVariableResolution()`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:206`

**Complete Signature**
```csharp
public IContextBuilder WithEnvironmentVariableResolution()
```

**Docstring**

Enables environment-variable expansion while the context is being built.

Enable this when configuration values should resolve environment variables while the context is being built.

<hr class="function-separator" />

#### `ContextBuilder.SetCurrentRunningSessions(IInternalRunningSessions runningSessions)`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:219`

**Complete Signature**
```csharp
public IContextBuilder SetCurrentRunningSessions(IInternalRunningSessions runningSessions)
```

**Docstring**

Sets the running-session store used by the built context.

The running-session store allows runtime components to coordinate and inspect active sessions through the built context.

<hr class="function-separator" />

#### `ContextBuilder.BuildInternal()`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:267`

**Complete Signature**
```csharp
public InternalContext BuildInternal()
```

**Docstring**

Builds an internal QaaS context from the current builder state.

Call this after all configuration inputs, overwrite sources, and resolution options have been registered on the builder. The returned internal context is used by the runtime bootstrap flow.

<hr class="function-separator" />

#### `ContextBuilder.Build()`

**Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:285`

**Complete Signature**
```csharp
[Obsolete("Function no longer in use, Use BuildInternal instead")] public Context Build()
```

**Docstring**

Builds the obsolete public Context projection from the current builder state.

Prefer BuildInternal() for the active runtime path.

### Data Sources

<hr class="function-separator" />

#### `DataSourceBuilder.Named(string name)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:67`

**Complete Signature**
```csharp
public DataSourceBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.HookNamed(string hookName)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:80`

**Complete Signature**
```csharp
public DataSourceBuilder HookNamed(string hookName)
```

**Docstring**

Sets the hook implementation name used by the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.AddDataSourceName(string dataSourceName)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:93`

**Complete Signature**
```csharp
public DataSourceBuilder AddDataSourceName(string dataSourceName)
```

**Docstring**

Adds the supplied data source name to the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.AddDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:106`

**Complete Signature**
```csharp
public DataSourceBuilder AddDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Adds the supplied data source pattern to the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.WithSerializer(SerializeConfig serializeConfig)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:119`

**Complete Signature**
```csharp
public DataSourceBuilder WithSerializer(SerializeConfig serializeConfig)
```

**Docstring**

Sets the serializer configuration used by the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:132`

**Complete Signature**
```csharp
public DataSourceBuilder WithDeserializer(DeserializeConfig deserializeConfig)
```

**Docstring**

Sets the deserializer configuration used by the current Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.IsLazy()`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:145`

**Complete Signature**
```csharp
public DataSourceBuilder IsLazy()
```

**Docstring**

Marks the data source for lazy resolution.

Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `DataSourceBuilder.Configure(object configuration)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:158`

**Complete Signature**
```csharp
public DataSourceBuilder Configure(object configuration)
```

**Docstring**

Replaces the generator configuration with the supplied object.

The supplied object is serialized to JSON and loaded into the builder as the new generator configuration.

<hr class="function-separator" />

#### `DataSourceBuilder.CreateConfiguration(object configuration)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:172`

**Complete Signature**
```csharp
public DataSourceBuilder CreateConfiguration(object configuration)
```

**Docstring**

Creates the generator configuration from the supplied object.

This is an alias for Configure and replaces any existing generator configuration.

<hr class="function-separator" />

#### `DataSourceBuilder.Create(object configuration)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:184`

**Complete Signature**
```csharp
public DataSourceBuilder Create(object configuration)
```

**Docstring**

Creates the generator configuration from the supplied object.

This is a shorthand alias for CreateConfiguration.

<hr class="function-separator" />

#### `DataSourceBuilder.ReadConfiguration()`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:196`

**Complete Signature**
```csharp
public IConfiguration ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Framework data source builder instance.

Use this method when working with the documented Framework data source builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `DataSourceBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:208`

**Complete Signature**
```csharp
public DataSourceBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Merges the supplied object into the current generator configuration.

Use this when only part of the generator configuration should change and existing values should be preserved where possible.

<hr class="function-separator" />

#### `DataSourceBuilder.UpsertConfiguration(object configuration)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:221`

**Complete Signature**
```csharp
public DataSourceBuilder UpsertConfiguration(object configuration)
```

**Docstring**

Updates or creates the generator configuration from the supplied object.

This is an alias for UpdateConfiguration.

<hr class="function-separator" />

#### `DataSourceBuilder.DeleteConfiguration()`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:233`

**Complete Signature**
```csharp
public DataSourceBuilder DeleteConfiguration()
```

**Docstring**

Clears the current generator configuration.

After this call, the builder holds an empty configuration until a new one is supplied.

<hr class="function-separator" />

#### `DataSourceBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:246`

**Complete Signature**
```csharp
public void Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)
```

**Docstring**

Rejects custom YAML deserialization for DataSourceBuilder.

DataSourceBuilder only supports YAML serialization through Write; custom deserialization through IYamlConvertible.Read is intentionally unsupported.

<hr class="function-separator" />

#### `DataSourceBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:259`

**Complete Signature**
```csharp
public void Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)
```

**Docstring**

Writes the current Framework data source builder configuration to the configured serializer output.

This method participates in the YAML serialization surface that backs configuration-as-code support.

<hr class="function-separator" />

#### `DataSourceBuilder.Register()`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:283`

**Complete Signature**
```csharp
public DataSource Register()
```

**Docstring**

Registers the configured data source definition and returns the resulting data source descriptor.

Registration produces the immutable data-source descriptor that is later resolved against generator hooks during execution build.

<hr class="function-separator" />

#### `DataSourceBuilder.Build(InternalContext context, IEnumerable<DataSource> dataSources, IEnumerable<KeyValuePair<string, IGenerator>> generators)`

**Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:304`

**Complete Signature**
```csharp
public DataSource Build(InternalContext context, IEnumerable<DataSource> dataSources, IEnumerable<KeyValuePair<string, IGenerator>> generators)
```

**Docstring**

Builds the configured data source for execution.

This resolves the configured generator, links any referenced data sources, and finalizes the registered data source before execution begins.

### Policies

<hr class="function-separator" />

#### `PolicyBuilder.Configure(IPolicyConfig config)`

**Location** `QaaS.Framework.Policies/PolicyBuilder.cs:43`

**Complete Signature**
```csharp
public PolicyBuilder Configure(IPolicyConfig config)
```

**Docstring**

Sets the configuration currently stored on the Framework policy builder instance.

Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PolicyBuilder.Build()`

**Location** `QaaS.Framework.Policies/PolicyBuilder.cs:77`

**Complete Signature**
```csharp
public Policy Build()
```

**Docstring**

Builds the configured Framework policy builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

<hr class="function-separator" />

#### `PolicyBuilder.BuildPolicies(PolicyBuilder[]? policyBuilders)`

**Location** `QaaS.Framework.Policies/PolicyBuilder.cs:114`

**Complete Signature**
```csharp
public static Policy? BuildPolicies(PolicyBuilder[]? policyBuilders)
```

**Docstring**

Builds a policy chain from the supplied policy builder collection.

This helper lets callers collapse several fluent policy builders into the policy chain consumed by the runtime configuration surface.

## Utilities

### Enumerables

<hr class="function-separator" />

#### `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable)`

**Location** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:17`

**Complete Signature**
```csharp
public static TItem AsSingle<TItem>(this IEnumerable<TItem> enumerable)
```

**Docstring**

Returns the single item contained in the provided sequence.

The helper enforces the invariant that exactly one item must be present and throws when the sequence is empty or contains more than one value.

<hr class="function-separator" />

#### `EnumerableExtensions.GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList)`

**Location** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:44`

**Complete Signature**
```csharp
public static IList<TData> GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList)
```

**Docstring**

Filters configuration objects by the supplied conditions and returns the matching items.

Throws when a requested condition does not match any item so callers can fail fast on invalid configuration references.
