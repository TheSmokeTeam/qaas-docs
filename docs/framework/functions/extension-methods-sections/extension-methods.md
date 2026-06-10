---
id: framework.functions.extension.methods.sections.extension.methods
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections]
summary: "Reference page for Extension Methods: Extension Methods."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\ConfigurationMergeUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\IConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\References\ConfigurationReferencesParser.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\CommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\ContextGlobalDictionaryExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataSourceExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\LoggingExetentions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningCommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningSessionDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\SessionDataExtensions.cs -->

# Extension Methods: Extension Methods

> TL;DR — This page mirrors the `Extension Methods` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### Communication data {: #communication-data}

#### `GetCommunicationDataByName<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TCastTo> CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Casts a CommunicationData to a different type. When a body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the cast automatically converts that body using the CommunicationData's own SerializationType when it has one, or the serialization type inferred from the body's runtime type otherwise (see TryInferSerializationType)

#### `GetDataByIoMatchIndex<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)
    ```
    
    **Docstring**
    
    Retrieves data by its IoMatchIndex from a CommunicationData object

#### `TryGetCommunicationDataByName<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.TryGetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, [NotNullWhen(true)] out CommunicationData<TData>? communicationDataValue)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, [NotNullWhen(true)] out CommunicationData<TData>? communicationDataValue)
    ```
    
    **Docstring**
    
    Attempts to retrieve a CommunicationData from an enumerable of CommunicationData by its name, never throws
    
    Example: `if (sessionData.Outputs.TryGetCommunicationDataByName("orders_output", out var output)) { ... }`

#### `TryCastCommunicationData<TCastTo>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.TryCastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, [NotNullWhen(true)] out CommunicationData<TCastTo>? casted)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryCastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, [NotNullWhen(true)] out CommunicationData<TCastTo>? casted)
    ```
    
    **Docstring**
    
    Attempts to cast a CommunicationData to a different type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way CastCommunicationData{TCastTo} converts them
    
    Example: `if (communication.TryCastCommunicationData<byte[]>(out var bytesCommunication)) { ... }`

#### `TryGetDataByIoMatchIndex<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.TryGetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex, [NotNullWhen(true)] out DetailedData<TData>? data)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex, [NotNullWhen(true)] out DetailedData<TData>? data)
    ```
    
    **Docstring**
    
    Attempts to retrieve data by its IoMatchIndex from a CommunicationData object, never throws
    
    Example: `if (communication.TryGetDataByIoMatchIndex(0, out var firstMatch)) { ... }`

#### `GetBodies<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetBodies<TData>(this CommunicationData<TData> communicationData)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TData?> GetBodies<TData>(this CommunicationData<TData> communicationData)
    ```
    
    **Docstring**
    
    Retrieves the bodies of all data items of a CommunicationData, removing the need to project the Data list manually when only the contents matter
    
    Example: `IList<object?> bodies = communication.GetBodies();`

#### `GetBodiesAs<TCasted>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetBodiesAs<TCasted>(this CommunicationData<object> communicationData)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TCasted?> GetBodiesAs<TCasted>(this CommunicationData<object> communicationData)
    ```
    
    **Docstring**
    
    Retrieves the bodies of all data items of a CommunicationData of type object directly as the requested type. Bodies that are deserialized representations of the target type (e.g. JsonNode bodies) are automatically converted using the CommunicationData's own SerializationType when it has one, or the serialization type inferred from each body's runtime type otherwise
    
    Example: `IList<string?> bodies = communication.GetBodiesAs<string>();`

#### `ConvertCommunicationData<TConverted>`

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.ConvertCommunicationData<TConverted>(this CommunicationData<object> communicationData, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TConverted> ConvertCommunicationData<TConverted>(this CommunicationData<object> communicationData, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Converts a CommunicationData of type object to a CommunicationData of the requested type regardless of the current representation of its bodies, using the CommunicationData's own SerializationType by default: bodies that already are TConverted are kept as-is, byte[] bodies are deserialized, and any other representation (e.g. JsonNode, yaml dictionaries) is round-tripped through the serialization type into TConverted. When no serialization type is available falls back to a plain cast (same behavior as CastCommunicationData{TCastTo})
    
    Example: `CommunicationData<Order> typed = communication.ConvertCommunicationData<Order>();`

### Configuration merge utilities {: #configuration-merge-utilities}

#### `MergeConfigurationObjectIntoIConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationMergeUtils.MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationMergeUtils.MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMergeUtils (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs`
    
    **Signature**
    ```csharp
    public static TConfiguration? MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)
    ```
    
    **Docstring**
    
    Merges a partial configuration object into an existing configuration instance. When the incoming configuration type differs from the existing one, the incoming configuration replaces it. Fields that still match a fresh default instance of the incoming configuration type are ignored.

### Configuration references parser {: #configuration-references-parser}

#### `ResolveReferencesInConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationReferencesParser.ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationReferencesParser (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/References/ConfigurationReferencesParser.cs`
    
    **Signature**
    ```csharp
    public static IConfiguration ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)
    ```
    
    **Docstring**
    
    Resolves all references in configuration according to loaded reference configs and given referenceResolutionPaths

### Configuration utilities {: #configuration-utilities}

#### `BindConfigurationObjectToIConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `IConfigurationUtils.BindConfigurationObjectToIConfiguration(this IConfiguration configuration, object? configurationObject)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `IConfigurationUtils.GetDictionaryFromConfiguration(this IConfiguration? configuration)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUtils.BuildConfigurationAsYaml(this IConfiguration configuration, List<string>? configurationSectionNames = null)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUtils.LoadAndValidateConfiguration<TConfiguration>(this IConfiguration configuration, BinderOptions? binderOptions = null, ILogger? logger = null)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUtils.EnrichedBuild(this IConfigurationBuilder configurationBuilder, bool addEnvironmentVariables)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUtils.BindToObject<T>(this IConfiguration source, BinderOptions binderOptions, ILogger? logger = null)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUtils.BindToObject(this IConfiguration source, Type objectType, BinderOptions binderOptions, ILogger? logger = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUtils (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationUtils.cs`
    
    **Signature**
    ```csharp
    public static object BindToObject(this IConfiguration source, Type objectType, BinderOptions binderOptions, ILogger? logger = null)
    ```
    
    **Docstring**
    
    Converts IConfiguration to an object of the given runtime type.

### Context global dictionary {: #context-global-dictionary}

#### `LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>`

??? info "Source file, signature, and docstring"
    **Member**
    `ContextGlobalDictionaryExtensions.LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextGlobalDictionaryExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/ContextGlobalDictionaryExtensions.cs`
    
    **Signature**
    ```csharp
    public static void LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null) where TExecutionData : class, IExecutionData, new()
    ```
    
    **Docstring**
    
    Loads the requested configuration section into the context global dictionary. Use "variables" as the section path to project the root variables section into runtime state without relying on a dedicated Variables API. Numeric child sections are normalized to lists so YAML list sections do not appear as dictionaries with stringified indexes such as "0" and "1".

### Data {: #data}

#### `CastObjectData<TCasted>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectData<TCasted>(this Data<object> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static Data<TCasted> CastObjectData<TCasted>(this Data<object> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException. When the body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the cast automatically converts the body through its inferred serialization type (see TryInferSerializationType)

#### `CastToObjectData<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectData<TData>(this Data<TData> data)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TCasted> CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException. When the body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the cast automatically converts the body through its inferred serialization type (see TryInferSerializationType)

#### `CastToObjectDetailedData<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter) where TData : class
    ```
    
    **Docstring**
    
    Filters the data of a detailed data item according to the given DataFilter

#### `TryCastObjectData<TCasted>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.TryCastObjectData<TCasted>(this Data<object> data, [NotNullWhen(true)] out Data<TCasted>? casted)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryCastObjectData<TCasted>(this Data<object> data, [NotNullWhen(true)] out Data<TCasted>? casted)
    ```
    
    **Docstring**
    
    Attempts to cast a `Data` of type object to another type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way CastObjectData{TCasted} converts them
    
    Example: `if (data.TryCastObjectData<byte[]>(out var bytesData)) { ... }`

#### `TryCastObjectDetailedData<TCasted>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.TryCastObjectDetailedData<TCasted>(this DetailedData<object> detailedData, [NotNullWhen(true)] out DetailedData<TCasted>? casted)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryCastObjectDetailedData<TCasted>(this DetailedData<object> detailedData, [NotNullWhen(true)] out DetailedData<TCasted>? casted)
    ```
    
    **Docstring**
    
    Attempts to cast a `DetailedData` of type object to another type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way CastObjectDetailedData{TCasted} converts them
    
    Example: `if (detailedData.TryCastObjectDetailedData<byte[]>(out var bytesItem)) { ... }`

#### `GetBodyAs<TBody>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.GetBodyAs<TBody>(this Data<object> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static TBody? GetBodyAs<TBody>(this Data<object> data)
    ```
    
    **Docstring**
    
    Retrieves the body of a `Data` (or `DetailedData`) of type object directly as the requested type, removing the need to cast the whole Data wrapper in order to reach a typed body. When the body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the body is automatically converted through its inferred serialization type (see TryInferSerializationType)
    
    Example: `byte[]? raw = detailedData.GetBodyAs<byte[]>();`

#### `TryGetBodyAs<TBody>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.TryGetBodyAs<TBody>(this Data<object> data, out TBody? body)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetBodyAs<TBody>(this Data<object> data, out TBody? body)
    ```
    
    **Docstring**
    
    Attempts to retrieve the body of a `Data` (or `DetailedData`) of type object directly as the requested type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way GetBodyAs{TBody} converts them
    
    Example: `if (detailedData.TryGetBodyAs<string>(out var text)) { ... }`

#### `ConvertBodyTo<TBody>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.ConvertBodyTo<TBody>(this Data<object> data, SerializationType serializationType)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static TBody? ConvertBodyTo<TBody>(this Data<object> data, SerializationType serializationType)
    ```
    
    **Docstring**
    
    Converts the body of a `Data` (or `DetailedData`) of type object to the requested type regardless of its current representation: bodies that already are TBody are returned as-is, byte[] bodies are deserialized, and any other representation (e.g. JsonNode, yaml dictionaries) is round-tripped through the given serialization type into TBody
    
    Example: `Order? order = detailedData.ConvertBodyTo<Order>(SerializationType.Json);`

#### `ConvertData<TBody>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.ConvertData<TBody>(this Data<object> data, SerializationType serializationType)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static Data<TBody> ConvertData<TBody>(this Data<object> data, SerializationType serializationType)
    ```
    
    **Docstring**
    
    Converts a `Data` of type object to a `Data` of the requested type regardless of its current body representation, preserving its MetaData (see ConvertBodyTo{TBody} for the conversion rules)
    
    Example: `Data<Order> typed = data.ConvertData<Order>(SerializationType.Json);`

#### `ConvertDetailedData<TBody>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.ConvertDetailedData<TBody>(this DetailedData<object> detailedData, SerializationType serializationType)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TBody> ConvertDetailedData<TBody>(this DetailedData<object> detailedData, SerializationType serializationType)
    ```
    
    **Docstring**
    
    Converts a `DetailedData` of type object to a `DetailedData` of the requested type regardless of its current body representation, preserving its MetaData and Timestamp (see ConvertBodyTo{TBody} for the conversion rules)
    
    Example: `DetailedData<Order> typed = detailedData.ConvertDetailedData<Order>(SerializationType.Json);`

### Data source {: #data-source}

#### `GetDataSourceByName`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceExtensions.GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceExtensions.RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`
    
    **Signature**
    ```csharp
    public static IEnumerable<Data<TCastTo>> RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)
    ```
    
    **Docstring**
    
    Casts a DataSource to a different type

### Date time {: #date-time}

#### `ConvertDateTimeToUtcByTimeZoneOffset`

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null, string? timeZoneId = null)
    ```
    
    **Docstring**
    
    adds a timezone offset to the given utc time based on the timezone offset in summer time given

### Deserializer {: #deserializer}

#### `Deserialize<TResult>`

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.Deserialize<TResult>(this IDeserializer deserializer, byte[]? data)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.DeserializeFromString<TResult>(this IDeserializer deserializer, string? data)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.DeserializeFromString(this IDeserializer deserializer, string? data, Type? deserializeType = null)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DeserializerExtensions.TryDeserialize<TResult>(this IDeserializer deserializer, byte[]? data, out TResult? deserialized)`
    
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

### Running communication data {: #running-communication-data}

#### `GetRunningCommunicationDataByName<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `RunningCommunicationDataExtensions.GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningCommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/RunningCommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TData> GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)
    ```
    
    **Docstring**
    
    Retrieves a RunningCommunicationData{TData} from an enumerable of RunningCommunicationData{TData} by its name

### Running session data {: #running-session-data}

#### `GetInputByName<TInput, TOutput>`

??? info "Source file, signature, and docstring"
    **Member**
    `RunningSessionDataExtensions.GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `RunningSessionDataExtensions.GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningSessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)
    ```
    
    **Docstring**
    
    Retrieves an output RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

### Serialization type {: #serialization-type}

#### `BuildSerializer`

??? info "Source file, signature, and docstring"
    **Member**
    `SerializationTypeExtensions.BuildSerializer(this SerializationType serializationType)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SerializationTypeExtensions.BuildDeserializer(this SerializationType serializationType)`
    
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

### Serializer {: #serializer}

#### `SerializeToString`

??? info "Source file, signature, and docstring"
    **Member**
    `SerializerExtensions.SerializeToString(this ISerializer serializer, object? data)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SerializerExtensions.TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)`
    
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

### Serilog {: #serilog}

#### `WithHostname`

??? info "Source file, signature, and docstring"
    **Member**
    `SerilogExtensions.WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SerilogExtensions.WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `SerilogExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs`
    
    **Signature**
    ```csharp
    public static LoggerConfiguration WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)
    ```
    
    **Docstring**
    
    Enriches log events with the CI/Local environment as a structured property and adds it as a tag (label) in Elasticsearch.

### Session data {: #session-data}

#### `GetSessionDataByName<TInput, TOutput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

#### `GetInputAs<TInput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TInput> GetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData from SessionData by its name with all its data bodies converted to the requested type in a single call, using the input's own SerializationType by default (see ConvertCommunicationData{TConverted} for the conversion rules)
    
    Example: `CommunicationData<OrderRequest> input = sessionData.GetInputAs<OrderRequest>("orders_input");`

#### `GetOutputAs<TOutput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TOutput> GetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Retrieves an output CommunicationData from SessionData by its name with all its data bodies converted to the requested type in a single call, using the output's own SerializationType by default (see ConvertCommunicationData{TConverted} for the conversion rules)
    
    Example: `CommunicationData<Order> output = sessionData.GetOutputAs<Order>("orders_output");`

#### `TryGetInputAs<TInput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, [NotNullWhen(true)] out CommunicationData<TInput>? inputValue, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, [NotNullWhen(true)] out CommunicationData<TInput>? inputValue, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Attempts to retrieve an input CommunicationData from SessionData by its name with all its data bodies converted to the requested type, never throws
    
    Example: `if (sessionData.TryGetInputAs<OrderRequest>("orders_input", out var input)) { ... }`

#### `TryGetOutputAs<TOutput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, [NotNullWhen(true)] out CommunicationData<TOutput>? outputValue, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, [NotNullWhen(true)] out CommunicationData<TOutput>? outputValue, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Attempts to retrieve an output CommunicationData from SessionData by its name with all its data bodies converted to the requested type, never throws
    
    Example: `if (sessionData.TryGetOutputAs<Order>("orders_output", out var output)) { ... }`

#### `GetInputBodies<TInput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetInputBodies<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TInput?> GetInputBodies<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Retrieves the typed bodies of all data items of an input found by its name in a single call, the shortest path from a SessionData to the actual contents of an input (see GetInputAs{TInput} for the conversion rules)
    
    Example: `IList<OrderRequest?> requests = sessionData.GetInputBodies<OrderRequest>("orders_input");`

#### `GetOutputBodies<TOutput>`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetOutputBodies<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TOutput?> GetOutputBodies<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Retrieves the typed bodies of all data items of an output found by its name in a single call, the shortest path from a SessionData to the actual contents of an output (see GetOutputAs{TOutput} for the conversion rules)
    
    Example: `IList<Order?> orders = sessionData.GetOutputBodies<Order>("orders_output");`

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
