# Extension Methods: Extension Methods / Configuration merge utilities

This page mirrors the `Extension Methods / Configuration merge utilities` section from [Extension Methods](../../extension-methods.md).

## `MergeConfigurationObjectIntoIConfiguration`

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
    
    Merges a partial configuration object into an existing IConfiguration instance. Fields omitted from configurationObject are preserved from configuration . A field is treated as omitted when it still matches the default value produced by a fresh instance of the same configuration type.

## `MergeConfiguration<TConfiguration>`

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
