# Placeholders

Source-driven reference for `Framework` functions in the `Functions / Placeholders` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `AddPlaceholderResolver`

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
