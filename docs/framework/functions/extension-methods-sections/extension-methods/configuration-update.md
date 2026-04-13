# Extension Methods: Extension Methods / Configuration update

This page mirrors the `Extension Methods / Configuration update` section from [Extension Methods](../../extension-methods.md).

## `UpdateConfiguration<TConfiguration>`

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

Typed sparse patches preserve existing values, but they cannot distinguish "omitted" from "explicitly set to the type's default value". If you need to clear an existing value, use the object-shaped overload and include the property with `null`.

## `UpdateConfiguration<TConfiguration>`

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
    
    Merges an object-shaped configuration patch into the current typed configuration. Fields omitted from incomingConfiguration are preserved from the current configuration. When the current configuration is missing, the incoming object is bound to when possible.

Object-shaped patches support two important behaviors:

- Explicit `null` values clear the existing key instead of being ignored.
- Array/list patches replace the logical section as a whole, so a YAML section such as `DataSources:0:*` and a code patch targeting `DataSources` are treated as the same key space and do not leave duplicate indexed keys behind.

## `UpdateConfiguration`

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
    
    Merges an object-shaped configuration patch into the current IConfiguration tree. Fields omitted from incomingConfiguration are preserved from the current configuration.

Use this overload when merging raw configuration trees. It also clears explicitly-null keys and normalizes list-shaped patches so stale indexed entries such as `Section:1:*` are removed when a new list is written to `Section`.
