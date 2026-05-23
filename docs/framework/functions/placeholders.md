---
id: framework.functions.placeholders
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, placeholders]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\ConfigurationBuilderExtensions\PlaceholderConfigurationBuilderExtension.cs -->

# Placeholders

> TL;DR — This page lists the public Framework functions in the `Placeholders` category.

## When to use {: #when-to-use}

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

- [Framework Functions](index.md)
