---
id: framework.functions.extension.methods.sections.extension.methods.configuration.merge.utilities
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, configuration, merge, utilities]
summary: "Reference page for Extension Methods: Extension Methods / Configuration merge utilities."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\ConfigurationMergeUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBindingUtils\IConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\PlaceholderConfigurationBuilderExtension.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\YamlConfigurationBuilderExtension.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUpdateExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationUtils.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\References\ConfigurationReferencesParser.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\CommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\ContextGlobalDictionaryExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataSourceExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\LoggingExetentions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningCommunicationDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningSessionDataExtensions.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\SessionDataExtensions.cs -->

# Extension Methods: Extension Methods / Configuration merge utilities

> TL;DR — Reference page for Extension Methods: Extension Methods / Configuration merge utilities.

This page mirrors the `Extension Methods / Configuration merge utilities` section from [Extension Methods](../../extension-methods.md).

## `MergeConfigurationObjectIntoIConfiguration` {: #mergeconfigurationobjectintoiconfiguration}

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

## `MergeConfiguration<TConfiguration>` {: #mergeconfiguration-tconfiguration}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
