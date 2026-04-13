# Extension Methods: Configuration mutation

This page mirrors the `Configuration mutation` section from [Extension Methods](../extension-methods.md).

## `UpdateConfiguration<TConfiguration>`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationMutationExtensions.UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMutationExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ConfigurationMutationExtensions.cs`
    
    **Signature**
    ```csharp
    public static TConfiguration UpdateConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration incomingConfiguration) where TConfiguration : class
    ```
    
    **Docstring**
    
    Forwards typed configuration updates to ConfigurationUpdateExtensions .

For sparse typed patches, existing values are preserved. To explicitly clear a configured value, use the object-shaped overload and include that property with `null`.

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationMutationExtensions.UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationMutationExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ConfigurationMutationExtensions.cs`
    
    **Signature**
    ```csharp
    public static IConfiguration UpdateConfiguration(this IConfiguration? currentConfiguration, object incomingConfiguration)
    ```
    
    **Docstring**
    
    Forwards raw IConfiguration updates to ConfigurationUpdateExtensions .

The forwarded framework behavior clears explicitly-null keys and replaces list-shaped sections without leaving duplicate indexed keys behind.
