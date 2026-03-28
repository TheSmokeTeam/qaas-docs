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
