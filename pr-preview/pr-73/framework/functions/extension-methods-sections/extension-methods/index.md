# Extension Methods: Extension Methods

> TL;DR — This page mirrors the `Extension Methods` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### Communication data

#### `GetCommunicationDataByName<TData>`

Source file, signature, and docstring

**Member** `CommunicationDataExtensions.GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)`

**Kind** `function`

**Declaring Type** `CommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TData> GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)
```

**Docstring**

Retrieves a CommunicationData from an enumerable of CommunicationData by its name

#### `CastCommunicationData<TCastTo>`

Source file, signature, and docstring

**Member** `CommunicationDataExtensions.CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)`

**Kind** `function`

**Declaring Type** `CommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TCastTo> CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)
```

**Docstring**

Casts a CommunicationData to a different type

#### `GetDataByIoMatchIndex<TData>`

Source file, signature, and docstring

**Member** `CommunicationDataExtensions.GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)`

**Kind** `function`

**Declaring Type** `CommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TData> GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)
```

**Docstring**

Retrieves data by its IoMatchIndex from a CommunicationData object

### Configuration merge utilities

#### `MergeConfigurationObjectIntoIConfiguration`

Source file, signature, and docstring

**Member** `ConfigurationMergeUtils.MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)`

**Kind** `function`

**Declaring Type** `ConfigurationMergeUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs`

**Signature**

```csharp
public static IConfiguration MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)
```

**Docstring**

Merges a partial configuration object into an existing IConfiguration instance. Fields omitted from configurationObject are preserved from configuration. A field is treated as omitted when it still matches the default value produced by a fresh instance of the same configuration type.

#### `MergeConfiguration<TConfiguration>`

Source file, signature, and docstring

**Member** `ConfigurationMergeUtils.MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)`

**Kind** `function`

**Declaring Type** `ConfigurationMergeUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs`

**Signature**

```csharp
public static TConfiguration? MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)
```

**Docstring**

Merges a partial configuration object into an existing configuration instance. When the incoming configuration type differs from the existing one, the incoming configuration replaces it. Fields that still match a fresh default instance of the incoming configuration type are ignored.

### Configuration references parser

#### `ResolveReferencesInConfiguration`

Source file, signature, and docstring

**Member** `ConfigurationReferencesParser.ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)`

**Kind** `function`

**Declaring Type** `ConfigurationReferencesParser (extension type)`

**Source File** `QaaS.Framework.Configurations/References/ConfigurationReferencesParser.cs`

**Signature**

```csharp
public static IConfiguration ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)
```

**Docstring**

Resolves all references in configuration according to loaded reference configs and given referenceResolutionPaths

### Configuration utilities

#### `BindConfigurationObjectToIConfiguration`

Source file, signature, and docstring

**Member** `IConfigurationUtils.BindConfigurationObjectToIConfiguration(this IConfiguration configuration, object? configurationObject)`

**Kind** `function`

**Declaring Type** `IConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/IConfigurationUtils.cs`

**Signature**

```csharp
public static IConfiguration BindConfigurationObjectToIConfiguration(this IConfiguration configuration, object? configurationObject)
```

**Docstring**

Merges a partial configuration object into the existing IConfiguration. Existing values are preserved when the incoming object leaves a field at its type default.

#### `GetDictionaryFromConfiguration`

Source file, signature, and docstring

**Member** `IConfigurationUtils.GetDictionaryFromConfiguration(this IConfiguration? configuration)`

**Kind** `function`

**Declaring Type** `IConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/IConfigurationUtils.cs`

**Signature**

```csharp
public static Dictionary<string, object?> GetDictionaryFromConfiguration(this IConfiguration? configuration)
```

**Docstring**

Returns Dictionary representation of given IConfiguration

#### `BuildConfigurationAsYaml`

Source file, signature, and docstring

**Member** `ConfigurationUtils.BuildConfigurationAsYaml(this IConfiguration configuration, List<string>? configurationSectionNames = null)`

**Kind** `function`

**Declaring Type** `ConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationUtils.cs`

**Signature**

```csharp
public static string BuildConfigurationAsYaml(this IConfiguration configuration, List<string>? configurationSectionNames = null)
```

**Docstring**

Serializes IConfiguration object to Yaml string by a specific given order of its content's sections if given - else return default serialize result.

#### `LoadAndValidateConfiguration<TConfiguration>`

Source file, signature, and docstring

**Member** `ConfigurationUtils.LoadAndValidateConfiguration<TConfiguration>(this IConfiguration configuration, BinderOptions? binderOptions = null, ILogger? logger = null)`

**Kind** `function`

**Declaring Type** `ConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationUtils.cs`

**Signature**

```csharp
public static TConfiguration LoadAndValidateConfiguration<TConfiguration>(this IConfiguration configuration, BinderOptions? binderOptions = null, ILogger? logger = null) where TConfiguration : new()
```

**Docstring**

Load IConfiguration to a c# object and validate it

#### `EnrichedBuild`

Source file, signature, and docstring

**Member** `ConfigurationUtils.EnrichedBuild(this IConfigurationBuilder configurationBuilder, bool addEnvironmentVariables)`

**Kind** `function`

**Declaring Type** `ConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationUtils.cs`

**Signature**

```csharp
public static IConfiguration EnrichedBuild(this IConfigurationBuilder configurationBuilder, bool addEnvironmentVariables)
```

**Docstring**

Builds IConfiguration from configuration builder while adding all parameterless configuration resolution extensions to the build process

#### `BindToObject<T>`

Source file, signature, and docstring

**Member** `ConfigurationUtils.BindToObject<T>(this IConfiguration source, BinderOptions binderOptions, ILogger? logger = null)`

**Kind** `function`

**Declaring Type** `ConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationUtils.cs`

**Signature**

```csharp
public static T BindToObject<T>(this IConfiguration source, BinderOptions binderOptions, ILogger? logger = null) where T : new()
```

**Docstring**

Converts IConfiguration object to a c# object of given type and validates the object according to DataAnnotations

#### `BindToObject`

Source file, signature, and docstring

**Member** `ConfigurationUtils.BindToObject(this IConfiguration source, Type objectType, BinderOptions binderOptions, ILogger? logger = null)`

**Kind** `function`

**Declaring Type** `ConfigurationUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationUtils.cs`

**Signature**

```csharp
public static object BindToObject(this IConfiguration source, Type objectType, BinderOptions binderOptions, ILogger? logger = null)
```

**Docstring**

Converts IConfiguration to an object of the given runtime type.

### Context global dictionary

#### `LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>`

Source file, signature, and docstring

**Member** `ContextGlobalDictionaryExtensions.LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null)`

**Kind** `function`

**Declaring Type** `ContextGlobalDictionaryExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/ContextGlobalDictionaryExtensions.cs`

**Signature**

```csharp
public static void LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null) where TExecutionData : class, IExecutionData, new()
```

**Docstring**

Loads the requested configuration section into the context global dictionary. Use "variables" as the section path to project the root variables section into runtime state without relying on a dedicated Variables API. Numeric child sections are normalized to lists so YAML list sections do not appear as dictionaries with stringified indexes such as "0" and "1".

### Data

#### `CastObjectData<TCasted>`

Source file, signature, and docstring

**Member** `DataExtensions.CastObjectData<TCasted>(this Data<object> data)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static Data<TCasted> CastObjectData<TCasted>(this Data<object> data)
```

**Docstring**

Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException

#### `CastToObjectData<TData>`

Source file, signature, and docstring

**Member** `DataExtensions.CastToObjectData<TData>(this Data<TData> data)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static Data<object> CastToObjectData<TData>(this Data<TData> data)
```

**Docstring**

Casts a `Data` of any type to a Data of type object, if the cast is not valid will throw InvalidCastException

#### `CastObjectDetailedData<TCasted>`

Source file, signature, and docstring

**Member** `DataExtensions.CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TCasted> CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)
```

**Docstring**

Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException

#### `CastToObjectDetailedData<TData>`

Source file, signature, and docstring

**Member** `DataExtensions.CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<object> CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)
```

**Docstring**

Casts a `DetailedData` of any type to a DetailedData of type object, if the cast is not valid will throw InvalidCastException

#### `FilterData<TData>`

Source file, signature, and docstring

**Member** `DataExtensions.FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TData> FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter) where TData : class
```

**Docstring**

Filters the data of a detailed data item according to the given DataFilter

### Data source

#### `GetDataSourceByName`

Source file, signature, and docstring

**Member** `DataSourceExtensions.GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)`

**Kind** `function`

**Declaring Type** `DataSourceExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`

**Signature**

```csharp
public static DataSource GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)
```

**Docstring**

Retrieves a DataSource from an enumerable of DataSources by its name

#### `RetrieveAndCast<TCastTo>`

Source file, signature, and docstring

**Member** `DataSourceExtensions.RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)`

**Kind** `function`

**Declaring Type** `DataSourceExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`

**Signature**

```csharp
public static IEnumerable<Data<TCastTo>> RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)
```

**Docstring**

Casts a DataSource to a different type

### Date time

#### `ConvertDateTimeToUtcByTimeZoneOffset`

Source file, signature, and docstring

**Member** `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`

**Kind** `function`

**Declaring Type** `DateTimeExtensions (extension type)`

**Source File** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs`

**Signature**

```csharp
public static DateTime ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
```

**Docstring**

converts the given time to utc based on the timezone offset in summer time given

#### `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset`

Source file, signature, and docstring

**Member** `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`

**Kind** `function`

**Declaring Type** `DateTimeExtensions (extension type)`

**Source File** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs`

**Signature**

```csharp
public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
```

**Docstring**

adds a timezone offset to the given utc time based on the timezone offset in summer time given

### Deserializer

#### `Deserialize<TResult>`

Source file, signature, and docstring

**Member** `DeserializerExtensions.Deserialize<TResult>(this IDeserializer deserializer, byte[]? data)`

**Kind** `function`

**Declaring Type** `DeserializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static TResult? Deserialize<TResult>(this IDeserializer deserializer, byte[]? data)
```

**Docstring**

Deserializes the given byte[] directly to TResult instead of object, removing the need to pass a Type instance and cast the result manually

Example: `Order? order = deserializer.Deserialize<Order>(payload);`

#### `DeserializeFromString<TResult>`

Source file, signature, and docstring

**Member** `DeserializerExtensions.DeserializeFromString<TResult>(this IDeserializer deserializer, string? data)`

**Kind** `function`

**Declaring Type** `DeserializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static TResult? DeserializeFromString<TResult>(this IDeserializer deserializer, string? data)
```

**Docstring**

Deserializes the given UTF-8 string directly to TResult, most useful for the text based formats (Json, Yaml, Xml, XmlElement)

Example: `Order? order = SerializationType.Json.BuildDeserializer().DeserializeFromString<Order>(json);`

#### `DeserializeFromString`

Source file, signature, and docstring

**Member** `DeserializerExtensions.DeserializeFromString(this IDeserializer deserializer, string? data, Type? deserializeType = null)`

**Kind** `function`

**Declaring Type** `DeserializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static object? DeserializeFromString(this IDeserializer deserializer, string? data, Type? deserializeType = null)
```

**Docstring**

Deserializes the given UTF-8 string to an object, most useful for the text based formats (Json, Yaml, Xml, XmlElement)

Example: `object? parsed = deserializer.DeserializeFromString(json, typeof(Order));`

#### `TryDeserialize<TResult>`

Source file, signature, and docstring

**Member** `DeserializerExtensions.TryDeserialize<TResult>(this IDeserializer deserializer, byte[]? data, out TResult? deserialized)`

**Kind** `function`

**Declaring Type** `DeserializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static bool TryDeserialize<TResult>(this IDeserializer deserializer, byte[]? data, out TResult? deserialized)
```

**Docstring**

Attempts to deserialize the given byte[] directly to TResult, never throws

Example: `if (deserializer.TryDeserialize<Order>(payload, out var order)) { ... }`

### Running communication data

#### `GetRunningCommunicationDataByName<TData>`

Source file, signature, and docstring

**Member** `RunningCommunicationDataExtensions.GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)`

**Kind** `function`

**Declaring Type** `RunningCommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/RunningCommunicationDataExtensions.cs`

**Signature**

```csharp
public static RunningCommunicationData<TData> GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)
```

**Docstring**

Retrieves a RunningCommunicationData{TData} from an enumerable of RunningCommunicationData{TData} by its name

### Running session data

#### `GetInputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `RunningSessionDataExtensions.GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)`

**Kind** `function`

**Declaring Type** `RunningSessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`

**Signature**

```csharp
public static RunningCommunicationData<TInput> GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)
```

**Docstring**

Retrieves an input RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

#### `GetOutputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `RunningSessionDataExtensions.GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)`

**Kind** `function`

**Declaring Type** `RunningSessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`

**Signature**

```csharp
public static RunningCommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)
```

**Docstring**

Retrieves an output RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

### Serialization type

#### `BuildSerializer`

Source file, signature, and docstring

**Member** `SerializationTypeExtensions.BuildSerializer(this SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `SerializationTypeExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationTypeExtensions.cs`

**Signature**

```csharp
public static ISerializer BuildSerializer(this SerializationType serializationType)
```

**Docstring**

Builds the serializer that matches this serialization type

Example: `var serializer = SerializationType.Yaml.BuildSerializer();`

#### `BuildDeserializer`

Source file, signature, and docstring

**Member** `SerializationTypeExtensions.BuildDeserializer(this SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `SerializationTypeExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationTypeExtensions.cs`

**Signature**

```csharp
public static IDeserializer BuildDeserializer(this SerializationType serializationType)
```

**Docstring**

Builds the deserializer that matches this serialization type

Example: `var deserializer = SerializationType.Yaml.BuildDeserializer();`

### Serializer

#### `SerializeToString`

Source file, signature, and docstring

**Member** `SerializerExtensions.SerializeToString(this ISerializer serializer, object? data)`

**Kind** `function`

**Declaring Type** `SerializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static string? SerializeToString(this ISerializer serializer, object? data)
```

**Docstring**

Serializes the given data and returns the result as a UTF-8 string, most useful for the text based formats (Json, Yaml, Xml, XmlElement)

Example: `string? json = SerializationType.Json.BuildSerializer().SerializeToString(order);`

#### `TrySerialize`

Source file, signature, and docstring

**Member** `SerializerExtensions.TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)`

**Kind** `function`

**Declaring Type** `SerializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static bool TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)
```

**Docstring**

Attempts to serialize the given data, never throws

Example: `if (serializer.TrySerialize(order, out var payload)) { ... }`

### Serilog

#### `WithHostname`

Source file, signature, and docstring

**Member** `SerilogExtensions.WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)`

**Kind** `function`

**Declaring Type** `SerilogExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs`

**Signature**

```csharp
public static LoggerConfiguration WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)
```

**Docstring**

Enriches log events with the machine hostname as a structured property and adds it as a tag (label) in Elasticsearch.

#### `WithEnvironment`

Source file, signature, and docstring

**Member** `SerilogExtensions.WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)`

**Kind** `function`

**Declaring Type** `SerilogExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs`

**Signature**

```csharp
public static LoggerConfiguration WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)
```

**Docstring**

Enriches log events with the CI/Local environment as a structured property and adds it as a tag (label) in Elasticsearch.

### Session data

#### `GetSessionDataByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static GenericSessionData<TInput, TOutput> GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)
```

**Docstring**

Retrieves a SessionData from an enumerable of SessionData by its name

#### `GetInputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TInput> GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)
```

**Docstring**

Retrieves an input CommunicationData from SessionData by its name

#### `TryGetInputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static bool TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)
```

**Docstring**

Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

#### `GetOutputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)
```

**Docstring**

Retrieves an output CommunicationData from SessionData by its name

#### `TryGetOutputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static bool TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)
```

**Docstring**

Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
