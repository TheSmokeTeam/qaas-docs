---
id: framework.functions.extension.methods.sections.configuration.updates
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, configuration, updates]
summary: "Reference page for Extension Methods: Configuration / Updates."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUpdateExtensions.cs -->

# Extension Methods: Configuration / Updates

> TL;DR: Reference page for Extension Methods: Configuration / Updates.

This page mirrors the `Configuration / Updates` section from [Extension Methods](../../extension-methods.md).

## `UpdateConfiguration<TConfiguration>` {: #updateconfiguration-tconfiguration}

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

## `UpdateConfiguration<TConfiguration>` {: #updateconfiguration-tconfiguration-2}

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

## `UpdateConfiguration` {: #updateconfiguration}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
