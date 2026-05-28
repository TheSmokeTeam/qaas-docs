---
id: framework.functions.placeholders.sections.when.to.use
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [framework]
keywords: [framework, reference]
summary: "Reference page for Placeholders: When to use."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\PlaceholderConfigurationBuilderExtension.cs -->

# Placeholders: When to use

> TL;DR — Reference page for Placeholders: When to use.

This page mirrors the `When to use` section from [Placeholders](../placeholders.md).

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `AddPlaceholderResolver` {: #addplaceholderresolver}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
