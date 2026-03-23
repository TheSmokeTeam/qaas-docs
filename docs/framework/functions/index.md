<!-- generated hash:c37baff253ae sources:Framework, functions -->

# Framework Functions

This page is generated from the docs generator function manifest and the current source tree.

## Configuration

### Placeholders

#### `PlaceholderConfigurationBuilderExtension.AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder) : IConfigurationBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/PlaceholderConfigurationBuilderExtension.cs:15`

Resolves placeholders in the configurationBuilder

### YAML

#### `YamlConfigurationBuilderExtension.AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null) : IConfigurationBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:21`

Adds the HttpGetYamlConfigurationSource configuration source to the IConfigurationBuilder

#### `YamlConfigurationBuilderExtension.AddYaml(this IConfigurationBuilder builder, string yamlPath) : IConfigurationBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:36`

Adds a YAML to the IConfigurationBuilder with CollapseShiftLeftArrowsInConfiguration support, if the yaml starts with http:// or https:// adds it using AddYamlFromHttpGet else adds it using the `AddYamlFile`

## Framework APIs

### Contexts

#### `ContextBuilder.SetLogger(ILogger logger) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:68`

_No XML summary provided._

#### `ContextBuilder.SetConfigurationFile(string? configurationFile) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:75`

_No XML summary provided._

#### `ContextBuilder.WithOverwriteFile(string? overwriteFile) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:83`

_No XML summary provided._

#### `ContextBuilder.WithOverwriteFolder(string? overwriteFolder) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:91`

_No XML summary provided._

#### `ContextBuilder.SetCase(string? caseFile) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:99`

_No XML summary provided._

#### `ContextBuilder.SetExecutionId(string? executionId) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:109`

_No XML summary provided._

#### `ContextBuilder.WithOverwriteArgument(string? argument) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:116`

_No XML summary provided._

#### `ContextBuilder.WithReferenceResolution(ReferenceConfig referenceConfig) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:124`

_No XML summary provided._

#### `ContextBuilder.ResolveCaseLast() : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:131`

_No XML summary provided._

#### `ContextBuilder.WithEnvironmentVariableResolution() : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:138`

_No XML summary provided._

#### `ContextBuilder.SetCurrentRunningSessions(IInternalRunningSessions runningSessions) : IContextBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:145`

_No XML summary provided._

#### `ContextBuilder.BuildInternal() : InternalContext`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:187`

_No XML summary provided._

#### `ContextBuilder.Build() : Context`

- Kind: `function`
- Location: `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:199`

_No XML summary provided._

### Data Sources

#### `DataSourceBuilder.Named(string name) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:60`

_No XML summary provided._

#### `DataSourceBuilder.HookNamed(string hookName) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:66`

_No XML summary provided._

#### `DataSourceBuilder.AddDataSourceName(string dataSourceName) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:72`

_No XML summary provided._

#### `DataSourceBuilder.AddDataSourcePattern(string dataSourcePattern) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:78`

_No XML summary provided._

#### `DataSourceBuilder.WithSerializer(SerializeConfig serializeConfig) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:84`

_No XML summary provided._

#### `DataSourceBuilder.WithDeserializer(DeserializeConfig deserializeConfig) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:90`

_No XML summary provided._

#### `DataSourceBuilder.IsLazy() : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:96`

_No XML summary provided._

#### `DataSourceBuilder.Configure(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:102`

_No XML summary provided._

#### `DataSourceBuilder.CreateConfiguration(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:112`

Compatibility alias for Configure that matches the configuration CRUD pattern used by other builders.

#### `DataSourceBuilder.Create(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:120`

Compatibility alias for CreateConfiguration .

#### `DataSourceBuilder.ReadConfiguration() : IConfiguration`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:128`

Returns the currently configured generator configuration.

#### `DataSourceBuilder.UpdateConfiguration(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:136`

Merges the provided configuration object into the current generator configuration.

#### `DataSourceBuilder.UpsertConfiguration(object configuration) : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:145`

Compatibility alias for UpdateConfiguration .

#### `DataSourceBuilder.DeleteConfiguration() : DataSourceBuilder`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:153`

Clears the configured generator configuration.

#### `DataSourceBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer) : void`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:159`

_No XML summary provided._

#### `DataSourceBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer) : void`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:165`

_No XML summary provided._

#### `DataSourceBuilder.Register() : DataSource`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:182`

_No XML summary provided._

#### `DataSourceBuilder.Build(InternalContext context, IEnumerable<DataSource> dataSources, IEnumerable<KeyValuePair<string, IGenerator>> generators) : DataSource`

- Kind: `function`
- Location: `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:196`

_No XML summary provided._

### Policies

#### `PolicyBuilder.Configure(IPolicyConfig config) : PolicyBuilder`

- Kind: `function`
- Location: `QaaS.Framework.Policies/PolicyBuilder.cs:36`

_No XML summary provided._

#### `PolicyBuilder.Build() : Policy`

- Kind: `function`
- Location: `QaaS.Framework.Policies/PolicyBuilder.cs:63`

_No XML summary provided._

#### `PolicyBuilder.BuildPolicies(PolicyBuilder[]? policyBuilders) : Policy?`

- Kind: `function`
- Location: `QaaS.Framework.Policies/PolicyBuilder.cs:93`

_No XML summary provided._

## Utilities

### Enumerables

#### `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable) : TItem`

- Kind: `function`
- Location: `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:17`

Validates the enumerable only consists of one item, if not throws indicative exception, if yes returns that one item

#### `EnumerableExtensions.GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList) : IList<TData>`

- Kind: `function`
- Location: `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:55`

Returns only the data objects from 'dataList' that pass the given filter.
