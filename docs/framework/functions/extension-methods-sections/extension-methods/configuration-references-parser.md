---
id: framework.functions.extension.methods.sections.extension.methods.configuration.references.parser
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, configuration, references, parser]
summary: "Reference page for Extension Methods: Extension Methods / Configuration references parser."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\References\ConfigurationReferencesParser.cs -->

# Extension Methods: Extension Methods / Configuration references parser

> TL;DR: Reference page for Extension Methods: Extension Methods / Configuration references parser.

This page mirrors the `Extension Methods / Configuration references parser` section from [Extension Methods](../../extension-methods.md).

## `ResolveReferencesInConfiguration` {: #resolvereferencesinconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `ConfigurationReferencesParser.ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)`
    
    **Kind** `function`
    
    **Declaring Type** `ConfigurationReferencesParser (extension type)`
    
    **Source File** `QaaS.Framework.Configurations/References/ConfigurationReferencesParser.cs`
    
    **Signature**
    ```csharp
    public static IConfiguration ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)
    ```
    
    **Docstring**
    
    Resolves all references in configuration according to loaded reference configs and given referenceResolutionPaths

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
