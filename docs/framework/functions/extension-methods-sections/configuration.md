# Extension Methods: Configuration

This page mirrors the `Configuration` section from [Extension Methods](../extension-methods.md).

## Placeholders

### `AddPlaceholderResolver`

??? info "Source file, signature, and docstring"
    **Member**
    `PlaceholderConfigurationBuilderExtension.AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `PlaceholderConfigurationBuilderExtension (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/PlaceholderConfigurationBuilderExtension.cs`
    
    **Signature**
    ```csharp
    public static IConfigurationBuilder AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)
    ```
    
    **Docstring**
    
    Adds the placeholder-resolving configuration source to the configuration builder.
    
    Call this extension before building IConfiguration when placeholder expansion should be applied as part of the configuration pipeline.

## Updates

### `UpdateConfiguration<TConfiguration>`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUpdateExtensions.UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUpdateExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationUpdateExtensions.cs`
    
    **Signature**
    ```csharp
    public static TConfiguration UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration) where TConfiguration : class
    ```
    
    **Docstring**
    
    Merges a typed configuration patch into the current configuration. When both configurations share the same runtime type, omitted fields are preserved from the current value. When the runtime type changes, the incoming configuration replaces the current one.
    
    Use this helper when a partially populated typed configuration object should override only the supplied fields while preserving the rest of the existing configuration state.

### `UpdateConfiguration<TConfiguration>`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUpdateExtensions.UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, object incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUpdateExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationUpdateExtensions.cs`
    
    **Signature**
    ```csharp
    public static TConfiguration UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, object incomingConfiguration) where TConfiguration : class
    ```
    
    **Docstring**
    
    Merges an object-shaped configuration patch into the current typed configuration. Fields omitted from incomingConfiguration are preserved from the current configuration. Fields explicitly set to null in the patch clear the existing value. When the current configuration is missing, the incoming object is bound to when possible.
    
    Use this overload when the patch comes from an anonymous object, JSON-like payload, or any other object whose shape matches part of the target configuration contract.

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationUpdateExtensions.UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationUpdateExtensions (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationUpdateExtensions.cs`
    
    **Signature**
    ```csharp
    public static IConfiguration UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)
    ```
    
    **Docstring**
    
    Merges an object-shaped configuration patch into the current IConfiguration tree. Fields omitted from incomingConfiguration are preserved from the current configuration. Fields explicitly set to null in the patch clear the existing value.
    
    Use this overload when configuration is already represented as an IConfiguration tree and should be updated without first binding it to a typed configuration object.

## YAML

### `AddYamlFromHttpGet`

??? info "Source file, signature, and docstring"
    **Member**
    `YamlConfigurationBuilderExtension.AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)`
    
    **Kind** `function`
    
    **Declaring Type** `YamlConfigurationBuilderExtension (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs`
    
    **Signature**
    ```csharp
    public static IConfigurationBuilder AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)
    ```
    
    **Docstring**
    
    Adds a YAML configuration source that is loaded through HTTP GET.
    
    Call this extension during configuration bootstrap when YAML should be loaded remotely instead of from the local file system.

### `AddYaml`

??? info "Source file, signature, and docstring"
    **Member**
    `YamlConfigurationBuilderExtension.AddYaml(this IConfigurationBuilder builder, string yamlPath)`
    
    **Kind** `function`
    
    **Declaring Type** `YamlConfigurationBuilderExtension (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs`
    
    **Signature**
    ```csharp
    public static IConfigurationBuilder AddYaml(this IConfigurationBuilder builder, string yamlPath)
    ```
    
    **Docstring**
    
    Adds a YAML configuration source from a local file path or URL.
    
    Call this extension during configuration bootstrap so YAML sources go through the same QaaS-aware loading path for files and remote URLs.
