# Extension Methods: Extension Methods / Configuration utilities

> TL;DR — This page mirrors the `Extension Methods / Configuration utilities` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `BindConfigurationObjectToIConfiguration`

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

### `GetDictionaryFromConfiguration`

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

### `BuildConfigurationAsYaml`

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

### `LoadAndValidateConfiguration<TConfiguration>`

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

### `EnrichedBuild`

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

### `BindToObject<T>`

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

### `BindToObject`

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

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
