<!-- generated hash:b1f779b0cb1f sources:Framework, functions, Framework APIs, Data Sources -->

# Data Sources

Source-driven reference for `Framework` functions in the `Framework APIs / Data Sources` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:60`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `HookNamed`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:73`
    
    **Signature**
    ```csharp
    public DataSourceBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourceName`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:86`
    
    **Signature**
    ```csharp
    public DataSourceBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:99`
    
    **Signature**
    ```csharp
    public DataSourceBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSerializer`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.WithSerializer(SerializeConfig serializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:112`
    
    **Signature**
    ```csharp
    public DataSourceBuilder WithSerializer(SerializeConfig serializeConfig)
    ```
    
    **Docstring**
    
    Sets the serializer configuration used by the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithDeserializer`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:125`
    
    **Signature**
    ```csharp
    public DataSourceBuilder WithDeserializer(DeserializeConfig deserializeConfig)
    ```
    
    **Docstring**
    
    Sets the deserializer configuration used by the current Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `IsLazy`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.IsLazy()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:138`
    
    **Signature**
    ```csharp
    public DataSourceBuilder IsLazy()
    ```
    
    **Docstring**
    
    Marks the data source for lazy resolution.
    
    Use this method when working with the documented Framework data source builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:151`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Replaces the generator configuration with the supplied object.
    
    The supplied object is serialized to JSON and loaded into the builder as the new generator configuration.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.CreateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:165`
    
    **Signature**
    ```csharp
    public DataSourceBuilder CreateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Creates the generator configuration from the supplied object.
    
    This is an alias for Configure and replaces any existing generator configuration.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.Create(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:177`
    
    **Signature**
    ```csharp
    public DataSourceBuilder Create(object configuration)
    ```
    
    **Docstring**
    
    Creates the generator configuration from the supplied object.
    
    This is a shorthand alias for CreateConfiguration.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:189`
    
    **Signature**
    ```csharp
    public IConfiguration ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Framework data source builder instance.
    
    Use this method when working with the documented Framework data source builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:201`
    
    **Signature**
    ```csharp
    public DataSourceBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Merges the supplied object into the current generator configuration.
    
    Use this when only part of the generator configuration should change and existing values should be preserved where possible.

## `UpsertConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpsertConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:214`
    
    **Signature**
    ```csharp
    public DataSourceBuilder UpsertConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates or creates the generator configuration from the supplied object.
    
    This is an alias for UpdateConfiguration.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:226`
    
    **Signature**
    ```csharp
    public DataSourceBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the current generator configuration.
    
    After this call, the builder holds an empty configuration until a new one is supplied.

## `Register`

??? info "Location, signature, and docstring"
    **Member**
    `DataSourceBuilder.Register()`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceBuilder`
    
    **Location** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs:276`
    
    **Signature**
    ```csharp
    public DataSource Register()
    ```
    
    **Docstring**
    
    Registers the configured data source definition and returns the resulting data source descriptor.
    
    Registration produces the immutable data-source descriptor that is later resolved against generator hooks during execution build.
