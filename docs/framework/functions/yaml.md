# YAML

Source-driven reference for `Framework` functions in the `Functions / YAML` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `AddYamlFromHttpGet`

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

## `AddYaml`

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
