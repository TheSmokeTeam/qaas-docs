# Extension Methods: Configuration / Placeholders

This page mirrors the `Configuration / Placeholders` section from [Extension Methods](../../extension-methods.md).

## `AddPlaceholderResolver`

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
