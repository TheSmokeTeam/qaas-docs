# Extension Methods

This page collects public `Framework` extension methods that have XML documentation or explicit docs annotations.

Annotated extension methods continue to appear in their regular category pages; this page gives the extension surface a dedicated view.

## Configuration

### Placeholders

#### `AddPlaceholderResolver`

??? info "Location, signature, and docstring"
    **Member**
    `PlaceholderConfigurationBuilderExtension.AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `PlaceholderConfigurationBuilderExtension (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/PlaceholderConfigurationBuilderExtension.cs:17`
    
    **Signature**
    ```csharp
    public static IConfigurationBuilder AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)
    ```
    
    **Docstring**
    
    Adds the placeholder-resolving configuration source to the configuration builder.
    
    Call this extension before building IConfiguration when placeholder expansion should be applied as part of the configuration pipeline.

### YAML

#### `AddYamlFromHttpGet`

??? info "Location, signature, and docstring"
    **Member**
    `YamlConfigurationBuilderExtension.AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)`
    
    **Kind** `function`
    
    **Declaring Type** `YamlConfigurationBuilderExtension (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:20`
    
    **Signature**
    ```csharp
    public static IConfigurationBuilder AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)
    ```
    
    **Docstring**
    
    Adds a YAML configuration source that is loaded through HTTP GET.
    
    Call this extension during configuration bootstrap when YAML should be loaded remotely instead of from the local file system.

#### `AddYaml`

??? info "Location, signature, and docstring"
    **Member**
    `YamlConfigurationBuilderExtension.AddYaml(this IConfigurationBuilder builder, string yamlPath)`
    
    **Kind** `function`
    
    **Declaring Type** `YamlConfigurationBuilderExtension (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs:33`
    
    **Signature**
    ```csharp
    public static IConfigurationBuilder AddYaml(this IConfigurationBuilder builder, string yamlPath)
    ```
    
    **Docstring**
    
    Adds a YAML configuration source from a local file path or URL.
    
    Call this extension during configuration bootstrap so YAML sources go through the same QaaS-aware loading path for files and remote URLs.

## Extension Methods

### Communication data

#### `GetCommunicationDataByName<TData>`

??? info "Location, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs:23`
    
    **Signature**
    ```csharp
    public static CommunicationData<TData> GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Retrieves a CommunicationData from an enumerable of CommunicationData by its name

#### `CastCommunicationData<TCastTo>`

??? info "Location, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs:50`
    
    **Signature**
    ```csharp
    public static CommunicationData<TCastTo> CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Casts a CommunicationData to a different type

#### `GetDataByIoMatchIndex<TData>`

??? info "Location, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs:81`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)
    ```
    
    **Docstring**
    
    Retrieves data by its IoMatchIndex from a CommunicationData object

### Configuration merge utilities

#### `MergeConfigurationObjectIntoIConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationMergeUtils.MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMergeUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs:29`
    
    **Signature**
    ```csharp
    public static IConfiguration MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)
    ```
    
    **Docstring**
    
    Merges a partial configuration object into an existing IConfiguration instance. Fields omitted from configurationObject are preserved from configuration . A field is treated as omitted when it still matches the default value produced by a fresh instance of the same configuration type.

#### `MergeConfiguration<TConfiguration>`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationMergeUtils.MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMergeUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs:42`
    
    **Signature**
    ```csharp
    public static TConfiguration? MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)
    ```
    
    **Docstring**
    
    Merges a partial configuration object into an existing configuration instance. When the incoming configuration type differs from the existing one, the incoming configuration replaces it. Fields that still match a fresh default instance of the incoming configuration type are ignored.

### Configuration references parser

#### `ResolveReferencesInConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationReferencesParser.ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationReferencesParser (extension type)`
    
    **Location** `QaaS.Framework.Configurations/References/ConfigurationReferencesParser.cs:29`
    
    **Signature**
    ```csharp
    public static IConfiguration ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)
    ```
    
    **Docstring**
    
    Resolves all references in configuration according to loaded reference configs and given referenceResolutionPaths

### Configuration update

#### `UpdateConfiguration<TConfiguration>`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUpdateExtensions.UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUpdateExtensions (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUpdateExtensions.cs:24`
    
    **Signature**
    ```csharp
    public static TConfiguration UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration) where TConfiguration : class
    ```
    
    **Docstring**
    
    Merges a typed configuration patch into the current configuration. When both configurations share the same runtime type, omitted fields are preserved from the current value. When the runtime type changes, the incoming configuration replaces the current one.

#### `UpdateConfiguration<TConfiguration>`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUpdateExtensions.UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, object incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUpdateExtensions (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUpdateExtensions.cs:59`
    
    **Signature**
    ```csharp
    public static TConfiguration UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, object incomingConfiguration) where TConfiguration : class
    ```
    
    **Docstring**
    
    Merges an object-shaped configuration patch into the current typed configuration. Fields omitted from incomingConfiguration are preserved from the current configuration. When the current configuration is missing, the incoming object is bound to when possible.

#### `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUpdateExtensions.UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUpdateExtensions (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUpdateExtensions.cs:106`
    
    **Signature**
    ```csharp
    public static IConfiguration UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)
    ```
    
    **Docstring**
    
    Merges an object-shaped configuration patch into the current IConfiguration tree. Fields omitted from incomingConfiguration are preserved from the current configuration.

### Configuration utilities

#### `BindConfigurationObjectToIConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `IConfigurationUtils.BindConfigurationObjectToIConfiguration(this IConfiguration configuration, object? configurationObject)`
    
    **Kind** `function`
    
    **Declaring Type** `IConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBindingUtils/IConfigurationUtils.cs:16`
    
    **Signature**
    ```csharp
    public static IConfiguration BindConfigurationObjectToIConfiguration(this IConfiguration configuration, object? configurationObject)
    ```
    
    **Docstring**
    
    Merges a partial configuration object into the existing IConfiguration . Existing values are preserved when the incoming object leaves a field at its type default.

#### `GetDictionaryFromConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `IConfigurationUtils.GetDictionaryFromConfiguration(this IConfiguration? configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `IConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationBindingUtils/IConfigurationUtils.cs:24`
    
    **Signature**
    ```csharp
    public static Dictionary<string, object?> GetDictionaryFromConfiguration(this IConfiguration? configuration)
    ```
    
    **Docstring**
    
    Returns Dictionary representation of given IConfiguration

#### `BuildConfigurationAsYaml`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUtils.BuildConfigurationAsYaml(this IConfiguration configuration, List<string>? configurationSectionNames = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUtils.cs:30`
    
    **Signature**
    ```csharp
    public static string BuildConfigurationAsYaml(this IConfiguration configuration, List<string>? configurationSectionNames = null)
    ```
    
    **Docstring**
    
    Serializes IConfiguration object to Yaml string by a specific given order of its content's sections if given - else return default serialize result.

#### `LoadAndValidateConfiguration<TConfiguration>`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUtils.LoadAndValidateConfiguration<TConfiguration>(this IConfiguration configuration, BinderOptions? binderOptions = null, ILogger? logger = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUtils.cs:202`
    
    **Signature**
    ```csharp
    public static TConfiguration LoadAndValidateConfiguration<TConfiguration>(this IConfiguration configuration, BinderOptions? binderOptions = null, ILogger? logger = null) where TConfiguration : new()
    ```
    
    **Docstring**
    
    Load IConfiguration to a c# object and validate it

#### `EnrichedBuild`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUtils.EnrichedBuild(this IConfigurationBuilder configurationBuilder, bool addEnvironmentVariables)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUtils.cs:234`
    
    **Signature**
    ```csharp
    public static IConfiguration EnrichedBuild(this IConfigurationBuilder configurationBuilder, bool addEnvironmentVariables)
    ```
    
    **Docstring**
    
    Builds IConfiguration from configuration builder while adding all parameterless configuration resolution extensions to the build process

#### `BindToObject<T>`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUtils.BindToObject<T>(this IConfiguration source, BinderOptions binderOptions, ILogger? logger = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUtils.cs:262`
    
    **Signature**
    ```csharp
    public static T BindToObject<T>(this IConfiguration source, BinderOptions binderOptions, ILogger? logger = null) where T : new()
    ```
    
    **Docstring**
    
    Converts IConfiguration object to a c# object of given type and validates the object according to DataAnnotations

#### `BindToObject`

??? info "Location, signature, and docstring"
    **Member**
    `ConfigurationUtils.BindToObject(this IConfiguration source, Type objectType, BinderOptions binderOptions, ILogger? logger = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUtils (extension type)`
    
    **Location** `QaaS.Framework.Configurations/ConfigurationUtils.cs:271`
    
    **Signature**
    ```csharp
    public static object BindToObject(this IConfiguration source, Type objectType, BinderOptions binderOptions, ILogger? logger = null)
    ```
    
    **Docstring**
    
    Converts IConfiguration to an object of the given runtime type.

### Data

#### `CastObjectData<TCasted>`

??? info "Location, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectData<TCasted>(this Data<object> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataExtensions.cs:17`
    
    **Signature**
    ```csharp
    public static Data<TCasted> CastObjectData<TCasted>(this Data<object> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException

#### `CastToObjectData<TData>`

??? info "Location, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectData<TData>(this Data<TData> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataExtensions.cs:40`
    
    **Signature**
    ```csharp
    public static Data<object> CastToObjectData<TData>(this Data<TData> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of any type to a Data of type object, if the cast is not valid will throw InvalidCastException

#### `CastObjectDetailedData<TCasted>`

??? info "Location, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataExtensions.cs:55`
    
    **Signature**
    ```csharp
    public static DetailedData<TCasted> CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException

#### `CastToObjectDetailedData<TData>`

??? info "Location, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataExtensions.cs:80`
    
    **Signature**
    ```csharp
    public static DetailedData<object> CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of any type to a DetailedData of type object, if the cast is not valid will throw InvalidCastException

#### `FilterData<TData>`

??? info "Location, signature, and docstring"
    **Member**
    `DataExtensions.FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataExtensions.cs:93`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter) where TData : class
    ```
    
    **Docstring**
    
    Filters the data of a detailed data item according to the given DataFilter

### Data source

#### `GetDataSourceByName`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceExtensions.GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs:20`
    
    **Signature**
    ```csharp
    public static DataSource GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)
    ```
    
    **Docstring**
    
    Retrieves a DataSource from an enumerable of DataSources by its name

#### `RetrieveAndCast<TCastTo>`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceExtensions.RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs:43`
    
    **Signature**
    ```csharp
    public static IEnumerable<Data<TCastTo>> RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)
    ```
    
    **Docstring**
    
    Casts a DataSource to a different type

### Date time

#### `ConvertDateTimeToUtcByTimeZoneOffset`

??? info "Location, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Location** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs:20`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeToUtcByTimeZoneOffset(this DateTime timeToConvertToUtc, int insertionTimeTimeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)
    ```
    
    **Docstring**
    
    converts the given time to utc based on the timezone offset in summer time given

#### `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset`

??? info "Location, signature, and docstring"
    **Member**
    `DateTimeExtensions.ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DateTimeExtensions (extension type)`
    
    **Location** `QaaS.Framework.Infrastructure/DateTimeExtensions.cs:42`
    
    **Signature**
    ```csharp
    public static DateTime ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset(this DateTime utcTimeToConvert, int timeZoneOffsetSummerTime, bool? isDayLightSavingTime = null)
    ```
    
    **Docstring**
    
    adds a timezone offset to the given utc time based on the timezone offset in summer time given

### Running communication data

#### `GetRunningCommunicationDataByName<TData>`

??? info "Location, signature, and docstring"
    **Member**
    `RunningCommunicationDataExtensions.GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningCommunicationDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/RunningCommunicationDataExtensions.cs:22`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TData> GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)
    ```
    
    **Docstring**
    
    Retrieves a RunningCommunicationData{TData} from an enumerable of RunningCommunicationData{TData} by its name

### Running session data

#### `GetInputByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `RunningSessionDataExtensions.GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningSessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs:17`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TInput> GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)
    ```
    
    **Docstring**
    
    Retrieves an input RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

#### `GetOutputByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `RunningSessionDataExtensions.GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningSessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs:31`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)
    ```
    
    **Docstring**
    
    Retrieves an output RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

### Serilog

#### `WithHostname`

??? info "Location, signature, and docstring"
    **Member**
    `SerilogExtensions.WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `SerilogExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs:16`
    
    **Signature**
    ```csharp
    public static LoggerConfiguration WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)
    ```
    
    **Docstring**
    
    Enriches log events with the machine hostname as a structured property and adds it as a tag (label) in Elasticsearch.

#### `WithEnvironment`

??? info "Location, signature, and docstring"
    **Member**
    `SerilogExtensions.WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `SerilogExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs:27`
    
    **Signature**
    ```csharp
    public static LoggerConfiguration WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)
    ```
    
    **Docstring**
    
    Enriches log events with the CI/Local environment as a structured property and adds it as a tag (label) in Elasticsearch.

### Session data

#### `GetSessionDataByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs:20`
    
    **Signature**
    ```csharp
    public static GenericSessionData<TInput, TOutput> GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)
    ```
    
    **Docstring**
    
    Retrieves a SessionData from an enumerable of SessionData by its name

#### `GetInputByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs:43`
    
    **Signature**
    ```csharp
    public static CommunicationData<TInput> GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData from SessionData by its name

#### `TryGetInputByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs:58`
    
    **Signature**
    ```csharp
    public static bool TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

#### `GetOutputByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `SessionDataExtensions.GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs:82`
    
    **Signature**
    ```csharp
    public static CommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)
    ```
    
    **Docstring**
    
    Retrieves an output CommunicationData from SessionData by its name

#### `TryGetOutputByName<TInput, TOutput>`

??? info "Location, signature, and docstring"
    **Member**
    `SessionDataExtensions.TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionDataExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs:97`
    
    **Signature**
    ```csharp
    public static bool TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)
    ```
    
    **Docstring**
    
    Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

## Utilities

### Enumerables

#### `AsSingle<TItem>`

??? info "Location, signature, and docstring"
    **Member**
    `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable)`
    
    **Kind** `function`
    
    **Declaring Type** `EnumerableExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:17`
    
    **Signature**
    ```csharp
    public static TItem AsSingle<TItem>(this IEnumerable<TItem> enumerable)
    ```
    
    **Docstring**
    
    Returns the single item contained in the provided sequence.
    
    The helper enforces the invariant that exactly one item must be present and throws when the sequence is empty or contains more than one value.
