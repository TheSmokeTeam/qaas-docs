<!-- generated hash:cafc7919b9f6 sources:Runner, functions -->

# Runner Functions

This page is generated from source-level `qaas-docs` annotations and the current source tree.

## Configuration as Code

### Assertions

<hr class="function-separator" />

#### `AssertionBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:113`

**Complete Signature**
```csharp
public void Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)
```

**Docstring**

Reads the serialized configuration for the current Runner assertion builder instance.

This method participates in the YAML serialization surface that backs configuration-as-code support.

<hr class="function-separator" />

#### `AssertionBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:126`

**Complete Signature**
```csharp
public void Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)
```

**Docstring**

Writes the current Runner assertion builder configuration to the configured serializer output.

This method participates in the YAML serialization surface that backs configuration-as-code support.

<hr class="function-separator" />

#### `AssertionBuilder.ReportOnlyStatuses(IList<AssertionStatus> statusesToReport)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:151`

**Complete Signature**
```csharp
public AssertionBuilder ReportOnlyStatuses(IList<AssertionStatus> statusesToReport)
```

**Docstring**

Sets which assertion statuses should be included in reports.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WithCategory(string category)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:164`

**Complete Signature**
```csharp
public AssertionBuilder WithCategory(string category)
```

**Docstring**

Configures category on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WeatherToSaveSessionData(bool weatherToSaveSessionData)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:177`

**Complete Signature**
```csharp
public AssertionBuilder WeatherToSaveSessionData(bool weatherToSaveSessionData)
```

**Docstring**

Configures whether session data is saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WeatherToSaveLogs(bool weatherToSaveLogs)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:190`

**Complete Signature**
```csharp
public AssertionBuilder WeatherToSaveLogs(bool weatherToSaveLogs)
```

**Docstring**

Configures whether logs are saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:203`

**Complete Signature**
```csharp
public AssertionBuilder WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate)
```

**Docstring**

Configures whether the rendered configuration template is saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WithSeverity(AssertionSeverity severity)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:216`

**Complete Signature**
```csharp
public AssertionBuilder WithSeverity(AssertionSeverity severity)
```

**Docstring**

Sets the severity associated with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WeatherToSaveAttachments(bool weatherToSaveAttachments)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:229`

**Complete Signature**
```csharp
public AssertionBuilder WeatherToSaveAttachments(bool weatherToSaveAttachments)
```

**Docstring**

Configures whether attachments are saved with the assertion result.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.WeatherToDisplayTrace(bool weatherToDisplayTrace)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:242`

**Complete Signature**
```csharp
public AssertionBuilder WeatherToDisplayTrace(bool weatherToDisplayTrace)
```

**Docstring**

Configures whether the assertion trace is displayed with the result.

Use this method when working with the documented Runner assertion builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Assertions'.

<hr class="function-separator" />

#### `AssertionBuilder.Named(string name)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:255`

**Complete Signature**
```csharp
public AssertionBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.HookNamed(string hookName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:268`

**Complete Signature**
```csharp
public AssertionBuilder HookNamed(string hookName)
```

**Docstring**

Sets the hook implementation name used by the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.AddDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:281`

**Complete Signature**
```csharp
public AssertionBuilder AddDataSourceName(string dataSourceName)
```

**Docstring**

Adds the supplied data source name to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.CreateDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:294`

**Complete Signature**
```csharp
public AssertionBuilder CreateDataSourceName(string dataSourceName)
```

**Docstring**

Creates or adds the configured data source name entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.ReadDataSourceNames()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:306`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSourceNames()
```

**Docstring**

Returns the configured data source names currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `AssertionBuilder.UpdateDataSourceName(string existingValue, string newValue)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:318`

**Complete Signature**
```csharp
public AssertionBuilder UpdateDataSourceName(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source name stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.DeleteDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:336`

**Complete Signature**
```csharp
public AssertionBuilder DeleteDataSourceName(string dataSourceName)
```

**Docstring**

Removes the configured data source name from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.AddDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:349`

**Complete Signature**
```csharp
public AssertionBuilder AddDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Adds the supplied data source pattern to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.CreateDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:362`

**Complete Signature**
```csharp
public AssertionBuilder CreateDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Creates or adds the configured data source pattern entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.ReadDataSourcePatterns()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:374`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSourcePatterns()
```

**Docstring**

Returns the configured data source patterns currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `AssertionBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:386`

**Complete Signature**
```csharp
public AssertionBuilder UpdateDataSourcePattern(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source pattern stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.DeleteDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:404`

**Complete Signature**
```csharp
public AssertionBuilder DeleteDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Removes the configured data source pattern from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.AddSessionName(string sessionName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:417`

**Complete Signature**
```csharp
public AssertionBuilder AddSessionName(string sessionName)
```

**Docstring**

Adds the supplied session name to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.CreateSessionName(string sessionName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:430`

**Complete Signature**
```csharp
public AssertionBuilder CreateSessionName(string sessionName)
```

**Docstring**

Creates or adds the configured session name entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.ReadSessionNames()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:442`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadSessionNames()
```

**Docstring**

Returns the configured session names currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `AssertionBuilder.UpdateSessionName(string existingValue, string newValue)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:454`

**Complete Signature**
```csharp
public AssertionBuilder UpdateSessionName(string existingValue, string newValue)
```

**Docstring**

Updates the configured session name stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.DeleteSessionName(string sessionName)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:477`

**Complete Signature**
```csharp
public AssertionBuilder DeleteSessionName(string sessionName)
```

**Docstring**

Removes the configured session name from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.AddSessionPattern(string sessionPattern)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:490`

**Complete Signature**
```csharp
public AssertionBuilder AddSessionPattern(string sessionPattern)
```

**Docstring**

Adds the supplied session pattern to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.CreateSessionPattern(string sessionPattern)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:505`

**Complete Signature**
```csharp
public AssertionBuilder CreateSessionPattern(string sessionPattern)
```

**Docstring**

Creates or adds the configured session pattern entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.ReadSessionPatterns()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:517`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadSessionPatterns()
```

**Docstring**

Returns the configured session patterns currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `AssertionBuilder.UpdateSessionPattern(string existingValue, string newValue)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:529`

**Complete Signature**
```csharp
public AssertionBuilder UpdateSessionPattern(string existingValue, string newValue)
```

**Docstring**

Updates the configured session pattern stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.DeleteSessionPattern(string sessionPattern)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:552`

**Complete Signature**
```csharp
public AssertionBuilder DeleteSessionPattern(string sessionPattern)
```

**Docstring**

Removes the configured session pattern from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.AddLink(LinkBuilder linkBuilder)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:565`

**Complete Signature**
```csharp
public AssertionBuilder AddLink(LinkBuilder linkBuilder)
```

**Docstring**

Adds the supplied link to the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.CreateLink(LinkBuilder linkBuilder)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:578`

**Complete Signature**
```csharp
public AssertionBuilder CreateLink(LinkBuilder linkBuilder)
```

**Docstring**

Creates or adds the configured link entry on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.ReadLinks()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:590`

**Complete Signature**
```csharp
public IReadOnlyList<LinkBuilder> ReadLinks()
```

**Docstring**

Returns the configured links currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `AssertionBuilder.UpdateLink(string name, LinkBuilder linkBuilder)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:602`

**Complete Signature**
```csharp
public AssertionBuilder UpdateLink(string name, LinkBuilder linkBuilder)
```

**Docstring**

Updates the configured link stored on the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.DeleteLink(string name)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:620`

**Complete Signature**
```csharp
public AssertionBuilder DeleteLink(string name)
```

**Docstring**

Removes the configured link from the current Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.Configure(object configuration)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:633`

**Complete Signature**
```csharp
public AssertionBuilder Configure(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.CreateConfiguration(object configuration)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:647`

**Complete Signature**
```csharp
public AssertionBuilder CreateConfiguration(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.Create(object configuration)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:659`

**Complete Signature**
```csharp
public AssertionBuilder Create(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:671`

**Complete Signature**
```csharp
public IConfiguration ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `AssertionBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:683`

**Complete Signature**
```csharp
public AssertionBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `AssertionBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs:696`

**Complete Signature**
```csharp
public AssertionBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner assertion builder instance.

Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Collectors

<hr class="function-separator" />

#### `CollectorBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:54`

**Complete Signature**
```csharp
public CollectorBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.FilterData(DataFilter dataFilter)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:67`

**Complete Signature**
```csharp
public CollectorBuilder FilterData(DataFilter dataFilter)
```

**Docstring**

Sets the data filter used by the current Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.CollectInRange(CollectionRange collectionRange)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:80`

**Complete Signature**
```csharp
public CollectorBuilder CollectInRange(CollectionRange collectionRange)
```

**Docstring**

Configures collect in range on the current Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Collectors'.

<hr class="function-separator" />

#### `CollectorBuilder.Create(IFetcherConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:93`

**Complete Signature**
```csharp
public CollectorBuilder Create(IFetcherConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.CreateConfiguration(IFetcherConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:105`

**Complete Signature**
```csharp
public CollectorBuilder CreateConfiguration(IFetcherConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:117`

**Complete Signature**
```csharp
public IFetcherConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `CollectorBuilder.UpdateConfiguration(Func<IFetcherConfig, IFetcherConfig> update)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:129`

**Complete Signature**
```csharp
public CollectorBuilder UpdateConfiguration(Func<IFetcherConfig, IFetcherConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.UpdateConfiguration(IFetcherConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:143`

**Complete Signature**
```csharp
public CollectorBuilder UpdateConfiguration(IFetcherConfig config)
```

**Docstring**

Updates the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:157`

**Complete Signature**
```csharp
public CollectorBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:171`

**Complete Signature**
```csharp
public CollectorBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `CollectorBuilder.Configure(IFetcherConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:189`

**Complete Signature**
```csharp
public CollectorBuilder Configure(IFetcherConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner collector builder instance.

Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Consumers

<hr class="function-separator" />

#### `ConsumerBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:34`

**Complete Signature**
```csharp
public ConsumerBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.AtStage(int stage)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:47`

**Complete Signature**
```csharp
public ConsumerBuilder AtStage(int stage)
```

**Docstring**

Sets the stage used by the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.WithTimeout(int timeoutMs)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:60`

**Complete Signature**
```csharp
public ConsumerBuilder WithTimeout(int timeoutMs)
```

**Docstring**

Configures timeout on the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.FilterData(DataFilter dataFilter)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:73`

**Complete Signature**
```csharp
public ConsumerBuilder FilterData(DataFilter dataFilter)
```

**Docstring**

Sets the data filter used by the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:86`

**Complete Signature**
```csharp
public ConsumerBuilder WithDeserializer(DeserializeConfig deserializeConfig)
```

**Docstring**

Sets the deserializer configuration used by the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.AddPolicy(PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:99`

**Complete Signature**
```csharp
public ConsumerBuilder AddPolicy(PolicyBuilder policy)
```

**Docstring**

Adds the supplied policy to the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.CreatePolicy(PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:114`

**Complete Signature**
```csharp
public ConsumerBuilder CreatePolicy(PolicyBuilder policy)
```

**Docstring**

Creates or adds the configured policy entry on the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.ReadPolicies()`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:126`

**Complete Signature**
```csharp
public IReadOnlyList<PolicyBuilder> ReadPolicies()
```

**Docstring**

Returns the configured policies currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ConsumerBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:138`

**Complete Signature**
```csharp
public ConsumerBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
```

**Docstring**

Updates the configured policy at the specified index on the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.DeletePolicyAt(int index)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:156`

**Complete Signature**
```csharp
public ConsumerBuilder DeletePolicyAt(int index)
```

**Docstring**

Removes the configured policy at the specified index from the current Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.CreateConfiguration(IReaderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:174`

**Complete Signature**
```csharp
public ConsumerBuilder CreateConfiguration(IReaderConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.Create(IReaderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:186`

**Complete Signature**
```csharp
public ConsumerBuilder Create(IReaderConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:198`

**Complete Signature**
```csharp
public IReaderConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ConsumerBuilder.UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:219`

**Complete Signature**
```csharp
public ConsumerBuilder UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.UpdateConfiguration(IReaderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:233`

**Complete Signature**
```csharp
public ConsumerBuilder UpdateConfiguration(IReaderConfig config)
```

**Docstring**

Updates the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:247`

**Complete Signature**
```csharp
public ConsumerBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:261`

**Complete Signature**
```csharp
public ConsumerBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ConsumerBuilder.Configure(IReaderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:288`

**Complete Signature**
```csharp
public ConsumerBuilder Configure(IReaderConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner consumer builder instance.

Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Executions

<hr class="function-separator" />

#### `ExecutionBuilder.WithGlobalDict(Dictionary<string, object?> globalDict)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:246`

**Complete Signature**
```csharp
public ExecutionBuilder WithGlobalDict(Dictionary<string, object?> globalDict)
```

**Docstring**

Replaces the global dictionary stored on the runner execution context.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:259`

**Complete Signature**
```csharp
public ExecutionBuilder AddSession(SessionBuilder sessionBuilder)
```

**Docstring**

Adds the supplied session to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateSession(SessionBuilder sessionBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:272`

**Complete Signature**
```csharp
public ExecutionBuilder CreateSession(SessionBuilder sessionBuilder)
```

**Docstring**

Creates or adds the configured session entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadSessions()`

**Location** `QaaS.Runner/ExecutionBuilder.cs:284`

**Complete Signature**
```csharp
public IReadOnlyList<SessionBuilder> ReadSessions()
```

**Docstring**

Returns the configured sessions currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:296`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateSession(string sessionName, SessionBuilder sessionBuilder)
```

**Docstring**

Updates the configured session stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteSession(string sessionName)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:309`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteSession(string sessionName)
```

**Docstring**

Removes the configured session from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:322`

**Complete Signature**
```csharp
public ExecutionBuilder AddAssertion(AssertionBuilder assertionBuilder)
```

**Docstring**

Adds the supplied assertion to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateAssertion(AssertionBuilder assertionBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:335`

**Complete Signature**
```csharp
public ExecutionBuilder CreateAssertion(AssertionBuilder assertionBuilder)
```

**Docstring**

Creates or adds the configured assertion entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadAssertions()`

**Location** `QaaS.Runner/ExecutionBuilder.cs:347`

**Complete Signature**
```csharp
public IReadOnlyList<AssertionBuilder> ReadAssertions()
```

**Docstring**

Returns the configured assertions currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:359`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)
```

**Docstring**

Updates the configured assertion stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteAssertion(string assertionName)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:372`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteAssertion(string assertionName)
```

**Docstring**

Removes the configured assertion from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.AddStorage(StorageBuilder storageBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:385`

**Complete Signature**
```csharp
public ExecutionBuilder AddStorage(StorageBuilder storageBuilder)
```

**Docstring**

Adds the supplied storage to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateStorage(StorageBuilder storageBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:398`

**Complete Signature**
```csharp
public ExecutionBuilder CreateStorage(StorageBuilder storageBuilder)
```

**Docstring**

Creates or adds the configured storage entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadStorages()`

**Location** `QaaS.Runner/ExecutionBuilder.cs:410`

**Complete Signature**
```csharp
public IReadOnlyList<StorageBuilder> ReadStorages()
```

**Docstring**

Returns the configured storages currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateStorageAt(int index, StorageBuilder storageBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:422`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateStorageAt(int index, StorageBuilder storageBuilder)
```

**Docstring**

Updates the configured storage at the specified index on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteStorageAt(int index)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:435`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteStorageAt(int index)
```

**Docstring**

Removes the configured storage at the specified index from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:448`

**Complete Signature**
```csharp
public ExecutionBuilder AddDataSource(DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Adds the supplied data source to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:461`

**Complete Signature**
```csharp
public ExecutionBuilder CreateDataSource(DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Creates or adds the configured data source entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadDataSources()`

**Location** `QaaS.Runner/ExecutionBuilder.cs:473`

**Complete Signature**
```csharp
public IReadOnlyList<DataSourceBuilder> ReadDataSources()
```

**Docstring**

Returns the configured data sources currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:485`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
```

**Docstring**

Updates the configured data source stored on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteDataSource(string dataSourceName)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:498`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteDataSource(string dataSourceName)
```

**Docstring**

Removes the configured data source from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.AddLink(LinkBuilder linkBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:511`

**Complete Signature**
```csharp
public ExecutionBuilder AddLink(LinkBuilder linkBuilder)
```

**Docstring**

Adds the supplied link to the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.CreateLink(LinkBuilder linkBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:524`

**Complete Signature**
```csharp
public ExecutionBuilder CreateLink(LinkBuilder linkBuilder)
```

**Docstring**

Creates or adds the configured link entry on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ReadLinks()`

**Location** `QaaS.Runner/ExecutionBuilder.cs:536`

**Complete Signature**
```csharp
public IReadOnlyList<LinkBuilder> ReadLinks()
```

**Docstring**

Returns the configured links currently stored on the Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ExecutionBuilder.UpdateLinkAt(int index, LinkBuilder linkBuilder)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:548`

**Complete Signature**
```csharp
public ExecutionBuilder UpdateLinkAt(int index, LinkBuilder linkBuilder)
```

**Docstring**

Updates the configured link at the specified index on the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.DeleteLinkAt(int index)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:561`

**Complete Signature**
```csharp
public ExecutionBuilder DeleteLinkAt(int index)
```

**Docstring**

Removes the configured link at the specified index from the current Runner execution builder instance.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.ExecutionType(ExecutionType executionType)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:574`

**Complete Signature**
```csharp
public ExecutionBuilder ExecutionType(ExecutionType executionType)
```

**Docstring**

Sets the execution type used when the runner execution is built.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.SetCase(string caseName)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:593`

**Complete Signature**
```csharp
public ExecutionBuilder SetCase(string caseName)
```

**Docstring**

Sets the case file applied by the context builder.

Case files are used as the final scenario-specific overlay that shapes the runtime configuration for a specific execution.

<hr class="function-separator" />

#### `ExecutionBuilder.SetExecutionId(string executionId)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:606`

**Complete Signature**
```csharp
public ExecutionBuilder SetExecutionId(string executionId)
```

**Docstring**

Sets the execution identifier stored on the built context.

The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

<hr class="function-separator" />

#### `ExecutionBuilder.WithMetadata(MetaDataConfig metaDataConfig)`

**Location** `QaaS.Runner/ExecutionBuilder.cs:619`

**Complete Signature**
```csharp
public ExecutionBuilder WithMetadata(MetaDataConfig metaDataConfig)
```

**Docstring**

Sets the metadata configuration stored on the execution.

Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ExecutionBuilder.Build()`

**Location** `QaaS.Runner/ExecutionBuilder.cs:914`

**Complete Signature**
```csharp
public override Execution Build()
```

**Docstring**

Builds the configured Runner execution builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### Links

<hr class="function-separator" />

#### `LinkBuilder.Named(string name)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:35`

**Complete Signature**
```csharp
public LinkBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.Create(ILinkConfig config)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:48`

**Complete Signature**
```csharp
public LinkBuilder Create(ILinkConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.CreateConfiguration(ILinkConfig config)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:60`

**Complete Signature**
```csharp
public LinkBuilder CreateConfiguration(ILinkConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:72`

**Complete Signature**
```csharp
public ILinkConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `LinkBuilder.UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:94`

**Complete Signature**
```csharp
public LinkBuilder UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.UpdateConfiguration(ILinkConfig config)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:108`

**Complete Signature**
```csharp
public LinkBuilder UpdateConfiguration(ILinkConfig config)
```

**Docstring**

Updates the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:122`

**Complete Signature**
```csharp
public LinkBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:136`

**Complete Signature**
```csharp
public LinkBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `LinkBuilder.Configure(ILinkConfig config)`

**Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:156`

**Complete Signature**
```csharp
public LinkBuilder Configure(ILinkConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner link builder instance.

Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Mocker Commands

<hr class="function-separator" />

#### `MockerCommandBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:55`

**Complete Signature**
```csharp
public MockerCommandBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.AtStage(int stage)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:68`

**Complete Signature**
```csharp
public MockerCommandBuilder AtStage(int stage)
```

**Docstring**

Sets the stage used by the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.WithServerName(string serverName)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:81`

**Complete Signature**
```csharp
public MockerCommandBuilder WithServerName(string serverName)
```

**Docstring**

Configures server name on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.WithRedis(RedisConfig redis)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:94`

**Complete Signature**
```csharp
public MockerCommandBuilder WithRedis(RedisConfig redis)
```

**Docstring**

Configures redis on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.WithRequestDurationMs(int requestDurationMs)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:107`

**Complete Signature**
```csharp
public MockerCommandBuilder WithRequestDurationMs(int requestDurationMs)
```

**Docstring**

Configures request duration ms on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.WithRequestRetries(int requestRetries)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:120`

**Complete Signature**
```csharp
public MockerCommandBuilder WithRequestRetries(int requestRetries)
```

**Docstring**

Configures request retries on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.Configure(MockerCommandConfig command)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:133`

**Complete Signature**
```csharp
public MockerCommandBuilder Configure(MockerCommandConfig command)
```

**Docstring**

Sets the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.WithCommand(MockerCommandConfig command)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:146`

**Complete Signature**
```csharp
public MockerCommandBuilder WithCommand(MockerCommandConfig command)
```

**Docstring**

Configures command on the current Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.CreateConfiguration(MockerCommandConfig command)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:158`

**Complete Signature**
```csharp
public MockerCommandBuilder CreateConfiguration(MockerCommandConfig command)
```

**Docstring**

Sets the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.Create(MockerCommandConfig command)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:170`

**Complete Signature**
```csharp
public MockerCommandBuilder Create(MockerCommandConfig command)
```

**Docstring**

Sets the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:182`

**Complete Signature**
```csharp
public MockerCommandConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `MockerCommandBuilder.UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:194`

**Complete Signature**
```csharp
public MockerCommandBuilder UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.UpdateConfiguration(MockerCommandConfig command)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:208`

**Complete Signature**
```csharp
public MockerCommandBuilder UpdateConfiguration(MockerCommandConfig command)
```

**Docstring**

Updates the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:223`

**Complete Signature**
```csharp
public MockerCommandBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `MockerCommandBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:238`

**Complete Signature**
```csharp
public MockerCommandBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner mocker command builder instance.

Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Probes

<hr class="function-separator" />

#### `ProbeBuilder.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:55`

**Complete Signature**
```csharp
public void Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)
```

**Docstring**

Reads the serialized configuration for the current Runner probe builder instance.

This method participates in the YAML serialization surface that backs configuration-as-code support.

<hr class="function-separator" />

#### `ProbeBuilder.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:68`

**Complete Signature**
```csharp
public void Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)
```

**Docstring**

Writes the current Runner probe builder configuration to the configured serializer output.

This method participates in the YAML serialization surface that backs configuration-as-code support.

<hr class="function-separator" />

#### `ProbeBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:88`

**Complete Signature**
```csharp
public ProbeBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.AtStage(int stage)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:101`

**Complete Signature**
```csharp
public ProbeBuilder AtStage(int stage)
```

**Docstring**

Sets the stage used by the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.HookNamed(string hookName)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:114`

**Complete Signature**
```csharp
public ProbeBuilder HookNamed(string hookName)
```

**Docstring**

Sets the hook implementation name used by the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.AddDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:127`

**Complete Signature**
```csharp
public ProbeBuilder AddDataSourceName(string dataSourceName)
```

**Docstring**

Adds the supplied data source name to the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.CreateDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:142`

**Complete Signature**
```csharp
public ProbeBuilder CreateDataSourceName(string dataSourceName)
```

**Docstring**

Creates or adds the configured data source name entry on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.ReadDataSourceNames()`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:154`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSourceNames()
```

**Docstring**

Returns the configured data source names currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ProbeBuilder.UpdateDataSourceName(string existingValue, string newValue)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:166`

**Complete Signature**
```csharp
public ProbeBuilder UpdateDataSourceName(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source name stored on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.DeleteDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:184`

**Complete Signature**
```csharp
public ProbeBuilder DeleteDataSourceName(string dataSourceName)
```

**Docstring**

Removes the configured data source name from the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.RemoveDataSourceName(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:197`

**Complete Signature**
```csharp
public ProbeBuilder RemoveDataSourceName(string dataSourceName)
```

**Docstring**

Configures remove data source name on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Probes'.

<hr class="function-separator" />

#### `ProbeBuilder.AddDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:209`

**Complete Signature**
```csharp
public ProbeBuilder AddDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Adds the supplied data source pattern to the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.CreateDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:224`

**Complete Signature**
```csharp
public ProbeBuilder CreateDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Creates or adds the configured data source pattern entry on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.ReadDataSourcePatterns()`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:236`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSourcePatterns()
```

**Docstring**

Returns the configured data source patterns currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ProbeBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:248`

**Complete Signature**
```csharp
public ProbeBuilder UpdateDataSourcePattern(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source pattern stored on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.DeleteDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:266`

**Complete Signature**
```csharp
public ProbeBuilder DeleteDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Removes the configured data source pattern from the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.RemoveDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:279`

**Complete Signature**
```csharp
public ProbeBuilder RemoveDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Configures remove data source pattern on the current Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Probes'.

<hr class="function-separator" />

#### `ProbeBuilder.Configure(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:291`

**Complete Signature**
```csharp
public ProbeBuilder Configure(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.CreateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:305`

**Complete Signature**
```csharp
public ProbeBuilder CreateConfiguration(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.Create(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:317`

**Complete Signature**
```csharp
public ProbeBuilder Create(object configuration)
```

**Docstring**

Sets the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:329`

**Complete Signature**
```csharp
public IConfiguration ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `ProbeBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:341`

**Complete Signature**
```csharp
public ProbeBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `ProbeBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs:354`

**Complete Signature**
```csharp
public ProbeBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner probe builder instance.

Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Publishers

<hr class="function-separator" />

#### `PublisherBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:37`

**Complete Signature**
```csharp
public PublisherBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.AtStage(int stage)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:50`

**Complete Signature**
```csharp
public PublisherBuilder AtStage(int stage)
```

**Docstring**

Sets the stage used by the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.FilterData(DataFilter dataFilter)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:63`

**Complete Signature**
```csharp
public PublisherBuilder FilterData(DataFilter dataFilter)
```

**Docstring**

Sets the data filter used by the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.WithSerializer(SerializeConfig serializeConfig)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:76`

**Complete Signature**
```csharp
public PublisherBuilder WithSerializer(SerializeConfig serializeConfig)
```

**Docstring**

Sets the serializer configuration used by the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.WithIterations(int iterations)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:89`

**Complete Signature**
```csharp
public PublisherBuilder WithIterations(int iterations)
```

**Docstring**

Sets how many iterations the transaction should execute.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.AddDataSource(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:102`

**Complete Signature**
```csharp
public PublisherBuilder AddDataSource(string dataSourceName)
```

**Docstring**

Adds the supplied data source to the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.CreateDataSource(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:117`

**Complete Signature**
```csharp
public PublisherBuilder CreateDataSource(string dataSourceName)
```

**Docstring**

Creates or adds the configured data source entry on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.ReadDataSources()`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:129`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSources()
```

**Docstring**

Returns the configured data sources currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `PublisherBuilder.UpdateDataSource(string existingValue, string newValue)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:141`

**Complete Signature**
```csharp
public PublisherBuilder UpdateDataSource(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source stored on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.DeleteDataSource(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:164`

**Complete Signature**
```csharp
public PublisherBuilder DeleteDataSource(string dataSourceName)
```

**Docstring**

Removes the configured data source from the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.AddDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:177`

**Complete Signature**
```csharp
public PublisherBuilder AddDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Adds the supplied data source pattern to the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.CreateDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:192`

**Complete Signature**
```csharp
public PublisherBuilder CreateDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Creates or adds the configured data source pattern entry on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.ReadDataSourcePatterns()`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:204`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSourcePatterns()
```

**Docstring**

Returns the configured data source patterns currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `PublisherBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:216`

**Complete Signature**
```csharp
public PublisherBuilder UpdateDataSourcePattern(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source pattern stored on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.DeleteDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:239`

**Complete Signature**
```csharp
public PublisherBuilder DeleteDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Removes the configured data source pattern from the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.InLoops()`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:252`

**Complete Signature**
```csharp
public PublisherBuilder InLoops()
```

**Docstring**

Marks the transaction to execute continuously in loop mode.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.WithSleep(ulong sleepTimeMs)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:265`

**Complete Signature**
```csharp
public PublisherBuilder WithSleep(ulong sleepTimeMs)
```

**Docstring**

Sets the delay applied between transaction iterations.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.WithChunks(Chunks chunks)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:278`

**Complete Signature**
```csharp
public PublisherBuilder WithChunks(Chunks chunks)
```

**Docstring**

Configures chunks on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.AddPolicy(PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:291`

**Complete Signature**
```csharp
public PublisherBuilder AddPolicy(PolicyBuilder policy)
```

**Docstring**

Adds the supplied policy to the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.CreatePolicy(PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:306`

**Complete Signature**
```csharp
public PublisherBuilder CreatePolicy(PolicyBuilder policy)
```

**Docstring**

Creates or adds the configured policy entry on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.ReadPolicies()`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:318`

**Complete Signature**
```csharp
public IReadOnlyList<PolicyBuilder> ReadPolicies()
```

**Docstring**

Returns the configured policies currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `PublisherBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:330`

**Complete Signature**
```csharp
public PublisherBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
```

**Docstring**

Updates the configured policy at the specified index on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.DeletePolicyAt(int index)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:348`

**Complete Signature**
```csharp
public PublisherBuilder DeletePolicyAt(int index)
```

**Docstring**

Removes the configured policy at the specified index from the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.WithParallelism(int parallelism)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:366`

**Complete Signature**
```csharp
public PublisherBuilder WithParallelism(int parallelism)
```

**Docstring**

Configures parallelism on the current Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.CreateConfiguration(ISenderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:379`

**Complete Signature**
```csharp
public PublisherBuilder CreateConfiguration(ISenderConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.Create(ISenderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:391`

**Complete Signature**
```csharp
public PublisherBuilder Create(ISenderConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:403`

**Complete Signature**
```csharp
public ISenderConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `PublisherBuilder.UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:425`

**Complete Signature**
```csharp
public PublisherBuilder UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.UpdateConfiguration(ISenderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:439`

**Complete Signature**
```csharp
public PublisherBuilder UpdateConfiguration(ISenderConfig config)
```

**Docstring**

Updates the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:453`

**Complete Signature**
```csharp
public PublisherBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:467`

**Complete Signature**
```csharp
public PublisherBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `PublisherBuilder.Configure(ISenderConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:495`

**Complete Signature**
```csharp
public PublisherBuilder Configure(ISenderConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner publisher builder instance.

Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Sessions

<hr class="function-separator" />

#### `SessionBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:25`

**Complete Signature**
```csharp
public SessionBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.WithTimeoutBefore(uint timeout)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:38`

**Complete Signature**
```csharp
public SessionBuilder WithTimeoutBefore(uint timeout)
```

**Docstring**

Sets the timeout applied before the session runs.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.WithTimeoutAfter(uint timeout)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:51`

**Complete Signature**
```csharp
public SessionBuilder WithTimeoutAfter(uint timeout)
```

**Docstring**

Sets the timeout applied after the session runs.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AtStage(int stage)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:64`

**Complete Signature**
```csharp
public SessionBuilder AtStage(int stage)
```

**Docstring**

Sets the stage used by the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.RunSessionUntilStage(int stage)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:78`

**Complete Signature**
```csharp
public SessionBuilder RunSessionUntilStage(int stage)
```

**Docstring**

Limits the session to run only until the specified stage.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DiscardData()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:91`

**Complete Signature**
```csharp
public SessionBuilder DiscardData()
```

**Docstring**

Disables data persistence for the configured session.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.WithinCategory(string category)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:104`

**Complete Signature**
```csharp
public SessionBuilder WithinCategory(string category)
```

**Docstring**

Sets the category used by the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddConsumer(ConsumerBuilder consumerBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:117`

**Complete Signature**
```csharp
public SessionBuilder AddConsumer(ConsumerBuilder consumerBuilder)
```

**Docstring**

Adds the supplied consumer to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreateConsumer(ConsumerBuilder consumerBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:130`

**Complete Signature**
```csharp
public SessionBuilder CreateConsumer(ConsumerBuilder consumerBuilder)
```

**Docstring**

Creates or adds the configured consumer entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadConsumers()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:142`

**Complete Signature**
```csharp
public IReadOnlyList<ConsumerBuilder> ReadConsumers()
```

**Docstring**

Returns the configured consumers currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadConsumer(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:154`

**Complete Signature**
```csharp
public ConsumerBuilder? ReadConsumer(string name)
```

**Docstring**

Returns the configured consumer currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdateConsumer(string name, ConsumerBuilder consumerBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:166`

**Complete Signature**
```csharp
public SessionBuilder UpdateConsumer(string name, ConsumerBuilder consumerBuilder)
```

**Docstring**

Updates the configured consumer stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:179`

**Complete Signature**
```csharp
public SessionBuilder UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update)
```

**Docstring**

Updates the configured consumer stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeleteConsumer(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:192`

**Complete Signature**
```csharp
public SessionBuilder DeleteConsumer(string name)
```

**Docstring**

Removes the configured consumer from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddPublisher(PublisherBuilder publisherBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:205`

**Complete Signature**
```csharp
public SessionBuilder AddPublisher(PublisherBuilder publisherBuilder)
```

**Docstring**

Adds the supplied publisher to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreatePublisher(PublisherBuilder publisherBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:218`

**Complete Signature**
```csharp
public SessionBuilder CreatePublisher(PublisherBuilder publisherBuilder)
```

**Docstring**

Creates or adds the configured publisher entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadPublishers()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:230`

**Complete Signature**
```csharp
public IReadOnlyList<PublisherBuilder> ReadPublishers()
```

**Docstring**

Returns the configured publishers currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadPublisher(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:242`

**Complete Signature**
```csharp
public PublisherBuilder? ReadPublisher(string name)
```

**Docstring**

Returns the configured publisher currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdatePublisher(string name, PublisherBuilder publisherBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:254`

**Complete Signature**
```csharp
public SessionBuilder UpdatePublisher(string name, PublisherBuilder publisherBuilder)
```

**Docstring**

Updates the configured publisher stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:267`

**Complete Signature**
```csharp
public SessionBuilder UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update)
```

**Docstring**

Updates the configured publisher stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeletePublisher(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:280`

**Complete Signature**
```csharp
public SessionBuilder DeletePublisher(string name)
```

**Docstring**

Removes the configured publisher from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddTransaction(TransactionBuilder transactionBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:293`

**Complete Signature**
```csharp
public SessionBuilder AddTransaction(TransactionBuilder transactionBuilder)
```

**Docstring**

Adds the supplied transaction to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreateTransaction(TransactionBuilder transactionBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:306`

**Complete Signature**
```csharp
public SessionBuilder CreateTransaction(TransactionBuilder transactionBuilder)
```

**Docstring**

Creates or adds the configured transaction entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadTransactions()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:318`

**Complete Signature**
```csharp
public IReadOnlyList<TransactionBuilder> ReadTransactions()
```

**Docstring**

Returns the configured transactions currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadTransaction(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:330`

**Complete Signature**
```csharp
public TransactionBuilder? ReadTransaction(string name)
```

**Docstring**

Returns the configured transaction currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdateTransaction(string name, TransactionBuilder transactionBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:342`

**Complete Signature**
```csharp
public SessionBuilder UpdateTransaction(string name, TransactionBuilder transactionBuilder)
```

**Docstring**

Updates the configured transaction stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:355`

**Complete Signature**
```csharp
public SessionBuilder UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update)
```

**Docstring**

Updates the configured transaction stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeleteTransaction(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:368`

**Complete Signature**
```csharp
public SessionBuilder DeleteTransaction(string name)
```

**Docstring**

Removes the configured transaction from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddProbe(ProbeBuilder probeBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:381`

**Complete Signature**
```csharp
public SessionBuilder AddProbe(ProbeBuilder probeBuilder)
```

**Docstring**

Adds the supplied probe to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreateProbe(ProbeBuilder probeBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:394`

**Complete Signature**
```csharp
public SessionBuilder CreateProbe(ProbeBuilder probeBuilder)
```

**Docstring**

Creates or adds the configured probe entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadProbes()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:406`

**Complete Signature**
```csharp
public IReadOnlyList<ProbeBuilder> ReadProbes()
```

**Docstring**

Returns the configured probes currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadProbe(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:418`

**Complete Signature**
```csharp
public ProbeBuilder? ReadProbe(string name)
```

**Docstring**

Returns the configured probe currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdateProbe(string name, ProbeBuilder probeBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:430`

**Complete Signature**
```csharp
public SessionBuilder UpdateProbe(string name, ProbeBuilder probeBuilder)
```

**Docstring**

Updates the configured probe stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.UpdateProbe(string name, Func<ProbeBuilder, ProbeBuilder> update)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:443`

**Complete Signature**
```csharp
public SessionBuilder UpdateProbe(string name, Func<ProbeBuilder, ProbeBuilder> update)
```

**Docstring**

Updates the configured probe stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeleteProbe(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:456`

**Complete Signature**
```csharp
public SessionBuilder DeleteProbe(string name)
```

**Docstring**

Removes the configured probe from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddCollector(CollectorBuilder collectorBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:469`

**Complete Signature**
```csharp
public SessionBuilder AddCollector(CollectorBuilder collectorBuilder)
```

**Docstring**

Adds the supplied collector to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreateCollector(CollectorBuilder collectorBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:482`

**Complete Signature**
```csharp
public SessionBuilder CreateCollector(CollectorBuilder collectorBuilder)
```

**Docstring**

Creates or adds the configured collector entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadCollectors()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:494`

**Complete Signature**
```csharp
public IReadOnlyList<CollectorBuilder> ReadCollectors()
```

**Docstring**

Returns the configured collectors currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadCollector(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:506`

**Complete Signature**
```csharp
public CollectorBuilder? ReadCollector(string name)
```

**Docstring**

Returns the configured collector currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdateCollector(string name, CollectorBuilder collectorBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:518`

**Complete Signature**
```csharp
public SessionBuilder UpdateCollector(string name, CollectorBuilder collectorBuilder)
```

**Docstring**

Updates the configured collector stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:531`

**Complete Signature**
```csharp
public SessionBuilder UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update)
```

**Docstring**

Updates the configured collector stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeleteCollector(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:544`

**Complete Signature**
```csharp
public SessionBuilder DeleteCollector(string name)
```

**Docstring**

Removes the configured collector from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddMockerCommand(MockerCommandBuilder mockerCommandBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:557`

**Complete Signature**
```csharp
public SessionBuilder AddMockerCommand(MockerCommandBuilder mockerCommandBuilder)
```

**Docstring**

Adds the supplied mocker command to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:572`

**Complete Signature**
```csharp
public SessionBuilder CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder)
```

**Docstring**

Creates or adds the configured mocker command entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadMockerCommands()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:584`

**Complete Signature**
```csharp
public IReadOnlyList<MockerCommandBuilder> ReadMockerCommands()
```

**Docstring**

Returns the configured mocker commands currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadMockerCommand(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:596`

**Complete Signature**
```csharp
public MockerCommandBuilder? ReadMockerCommand(string name)
```

**Docstring**

Returns the configured mocker command currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:608`

**Complete Signature**
```csharp
public SessionBuilder UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder)
```

**Docstring**

Updates the configured mocker command stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:621`

**Complete Signature**
```csharp
public SessionBuilder UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update)
```

**Docstring**

Updates the configured mocker command stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeleteMockerCommand(string name)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:634`

**Complete Signature**
```csharp
public SessionBuilder DeleteMockerCommand(string name)
```

**Docstring**

Removes the configured mocker command from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.AddStage(StageConfig stage)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:647`

**Complete Signature**
```csharp
public SessionBuilder AddStage(StageConfig stage)
```

**Docstring**

Adds the supplied stage to the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.CreateStage(StageConfig stage)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:660`

**Complete Signature**
```csharp
public SessionBuilder CreateStage(StageConfig stage)
```

**Docstring**

Creates or adds the configured stage entry on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.ReadStages()`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:672`

**Complete Signature**
```csharp
public IReadOnlyList<StageConfig> ReadStages()
```

**Docstring**

Returns the configured stages currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.ReadStage(int stageNumber)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:684`

**Complete Signature**
```csharp
public StageConfig? ReadStage(int stageNumber)
```

**Docstring**

Returns the configured stage currently stored on the Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `SessionBuilder.UpdateStage(int stageNumber, StageConfig stage)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:696`

**Complete Signature**
```csharp
public SessionBuilder UpdateStage(int stageNumber, StageConfig stage)
```

**Docstring**

Updates the configured stage stored on the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `SessionBuilder.DeleteStage(int stageNumber)`

**Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:715`

**Complete Signature**
```csharp
public SessionBuilder DeleteStage(int stageNumber)
```

**Docstring**

Removes the configured stage from the current Runner session builder instance.

Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Storages

<hr class="function-separator" />

#### `StorageBuilder.WithJsonStorageFormat(Formatting format)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:45`

**Complete Signature**
```csharp
public StorageBuilder WithJsonStorageFormat(Formatting format)
```

**Docstring**

Sets the JSON formatting used by runtime storages.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.Create(IStorageConfig storageConfig)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:58`

**Complete Signature**
```csharp
public StorageBuilder Create(IStorageConfig storageConfig)
```

**Docstring**

Sets the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.CreateConfiguration(IStorageConfig storageConfig)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:70`

**Complete Signature**
```csharp
public StorageBuilder CreateConfiguration(IStorageConfig storageConfig)
```

**Docstring**

Sets the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:82`

**Complete Signature**
```csharp
public IStorageConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `StorageBuilder.UpdateConfiguration(Func<IStorageConfig, IStorageConfig> update)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:94`

**Complete Signature**
```csharp
public StorageBuilder UpdateConfiguration(Func<IStorageConfig, IStorageConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.UpdateConfiguration(IStorageConfig storageConfig)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:108`

**Complete Signature**
```csharp
public StorageBuilder UpdateConfiguration(IStorageConfig storageConfig)
```

**Docstring**

Updates the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:122`

**Complete Signature**
```csharp
public StorageBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:136`

**Complete Signature**
```csharp
public StorageBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `StorageBuilder.Configure(IStorageConfig storageConfig)`

**Location** `QaaS.Runner.Storage/StorageBuilder.cs:148`

**Complete Signature**
```csharp
public StorageBuilder Configure(IStorageConfig storageConfig)
```

**Docstring**

Sets the configuration currently stored on the Runner storage builder instance.

Use this method when working with the documented Runner storage builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### Transactions

<hr class="function-separator" />

#### `TransactionBuilder.Named(string name)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:87`

**Complete Signature**
```csharp
public TransactionBuilder Named(string name)
```

**Docstring**

Sets the name used for the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.AtStage(int stage)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:100`

**Complete Signature**
```csharp
public TransactionBuilder AtStage(int stage)
```

**Docstring**

Sets the stage used by the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.WithTimeout(int timeoutMs)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:113`

**Complete Signature**
```csharp
public TransactionBuilder WithTimeout(int timeoutMs)
```

**Docstring**

Configures timeout on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.FilterInputData(DataFilter dataFilter)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:126`

**Complete Signature**
```csharp
public TransactionBuilder FilterInputData(DataFilter dataFilter)
```

**Docstring**

Sets the input data filter used by the transaction.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.FilterOutputData(DataFilter dataFilter)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:139`

**Complete Signature**
```csharp
public TransactionBuilder FilterOutputData(DataFilter dataFilter)
```

**Docstring**

Sets the output data filter used by the transaction.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:152`

**Complete Signature**
```csharp
public TransactionBuilder WithDeserializer(DeserializeConfig deserializeConfig)
```

**Docstring**

Sets the deserializer configuration used by the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.WithSerializer(SerializeConfig serializeConfig)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:165`

**Complete Signature**
```csharp
public TransactionBuilder WithSerializer(SerializeConfig serializeConfig)
```

**Docstring**

Sets the serializer configuration used by the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.WithIterations(int iterations)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:178`

**Complete Signature**
```csharp
public TransactionBuilder WithIterations(int iterations)
```

**Docstring**

Sets how many iterations the transaction should execute.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.AddDataSource(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:191`

**Complete Signature**
```csharp
public TransactionBuilder AddDataSource(string dataSourceName)
```

**Docstring**

Adds the supplied data source to the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.CreateDataSource(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:206`

**Complete Signature**
```csharp
public TransactionBuilder CreateDataSource(string dataSourceName)
```

**Docstring**

Creates or adds the configured data source entry on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.AddDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:218`

**Complete Signature**
```csharp
public TransactionBuilder AddDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Adds the supplied data source pattern to the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.CreateDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:233`

**Complete Signature**
```csharp
public TransactionBuilder CreateDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Creates or adds the configured data source pattern entry on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.InLoops()`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:245`

**Complete Signature**
```csharp
public TransactionBuilder InLoops()
```

**Docstring**

Marks the transaction to execute continuously in loop mode.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.WithSleep(ulong sleepTimeMs)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:258`

**Complete Signature**
```csharp
public TransactionBuilder WithSleep(ulong sleepTimeMs)
```

**Docstring**

Sets the delay applied between transaction iterations.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.AddPolicy(PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:271`

**Complete Signature**
```csharp
public TransactionBuilder AddPolicy(PolicyBuilder policy)
```

**Docstring**

Adds the supplied policy to the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.CreatePolicy(PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:286`

**Complete Signature**
```csharp
public TransactionBuilder CreatePolicy(PolicyBuilder policy)
```

**Docstring**

Creates or adds the configured policy entry on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.ReadPolicies()`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:298`

**Complete Signature**
```csharp
public IReadOnlyList<PolicyBuilder> ReadPolicies()
```

**Docstring**

Returns the configured policies currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `TransactionBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:310`

**Complete Signature**
```csharp
public TransactionBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
```

**Docstring**

Updates the configured policy at the specified index on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.DeletePolicyAt(int index)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:328`

**Complete Signature**
```csharp
public TransactionBuilder DeletePolicyAt(int index)
```

**Docstring**

Removes the configured policy at the specified index from the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.ReadDataSources()`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:346`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSources()
```

**Docstring**

Returns the configured data sources currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `TransactionBuilder.UpdateDataSource(string existingValue, string newValue)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:358`

**Complete Signature**
```csharp
public TransactionBuilder UpdateDataSource(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source stored on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.DeleteDataSource(string dataSourceName)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:381`

**Complete Signature**
```csharp
public TransactionBuilder DeleteDataSource(string dataSourceName)
```

**Docstring**

Removes the configured data source from the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.ReadDataSourcePatterns()`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:394`

**Complete Signature**
```csharp
public IReadOnlyList<string> ReadDataSourcePatterns()
```

**Docstring**

Returns the configured data source patterns currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `TransactionBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:406`

**Complete Signature**
```csharp
public TransactionBuilder UpdateDataSourcePattern(string existingValue, string newValue)
```

**Docstring**

Updates the configured data source pattern stored on the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.DeleteDataSourcePattern(string dataSourcePattern)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:429`

**Complete Signature**
```csharp
public TransactionBuilder DeleteDataSourcePattern(string dataSourcePattern)
```

**Docstring**

Removes the configured data source pattern from the current Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.CreateConfiguration(ITransactorConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:442`

**Complete Signature**
```csharp
public TransactionBuilder CreateConfiguration(ITransactorConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.Create(ITransactorConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:454`

**Complete Signature**
```csharp
public TransactionBuilder Create(ITransactorConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.ReadConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:466`

**Complete Signature**
```csharp
public ITransactorConfig? ReadConfiguration()
```

**Docstring**

Returns the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

<hr class="function-separator" />

#### `TransactionBuilder.UpdateConfiguration(Func<ITransactorConfig, ITransactorConfig> update)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:478`

**Complete Signature**
```csharp
public TransactionBuilder UpdateConfiguration(Func<ITransactorConfig, ITransactorConfig> update)
```

**Docstring**

Updates the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.UpdateConfiguration(ITransactorConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:492`

**Complete Signature**
```csharp
public TransactionBuilder UpdateConfiguration(ITransactorConfig config)
```

**Docstring**

Updates the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.UpdateConfiguration(object configuration)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:506`

**Complete Signature**
```csharp
public TransactionBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Updates the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.DeleteConfiguration()`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:520`

**Complete Signature**
```csharp
public TransactionBuilder DeleteConfiguration()
```

**Docstring**

Clears the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

<hr class="function-separator" />

#### `TransactionBuilder.Configure(ITransactorConfig config)`

**Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:539`

**Complete Signature**
```csharp
public TransactionBuilder Configure(ITransactorConfig config)
```

**Docstring**

Sets the configuration currently stored on the Runner transaction builder instance.

Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Getting Started

### Bootstrap

<hr class="function-separator" />

#### `Bootstrap.New(IEnumerable<string>? args = null)`

**Location** `QaaS.Runner/Bootstrap.cs:30`

**Complete Signature**
```csharp
public static Runner New(IEnumerable<string>? args = null)
```

**Docstring**

Creates a new Runner instance from the supplied bootstrap inputs.

This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

<hr class="function-separator" />

#### `Bootstrap.New<TRunner>(IEnumerable<string>? args = null)`

**Location** `QaaS.Runner/Bootstrap.cs:42`

**Complete Signature**
```csharp
public static Runner New<TRunner>(IEnumerable<string>? args = null) where TRunner : Runner
```

**Docstring**

Creates a new Runner instance from the supplied bootstrap inputs.

This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## Runtime

### Runner

<hr class="function-separator" />

#### `Runner.Run()`

**Location** `QaaS.Runner/Runner.cs:70`

**Complete Signature**
```csharp
public void Run()
```

**Docstring**

Runs the configured lifecycle and applies the resulting exit code policy.

Call this when the current process should honor Runner exit behavior. If the caller needs to inspect the exit code without terminating the process, prefer RunAndGetExitCode().

<hr class="function-separator" />

#### `Runner.RunAndGetExitCode()`

**Location** `QaaS.Runner/Runner.cs:83`

**Complete Signature**
```csharp
public int RunAndGetExitCode()
```

**Docstring**

Runs the configured lifecycle and returns the resulting exit code to the caller.

Call this when the caller wants to control how the resulting exit code is handled instead of letting Runner apply its default process policy.

<hr class="function-separator" />

#### `Runner.Dispose()`

**Location** `QaaS.Runner/Runner.cs:234`

**Complete Signature**
```csharp
public virtual void Dispose()
```

**Docstring**

Releases the resources owned by the current Runner instance.

Dispose should be called exactly once when the host is no longer needed so scopes, loggers, and other runtime resources are released deterministically.
