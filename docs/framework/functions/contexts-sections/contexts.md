---
id: framework.functions.contexts.sections.contexts
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, contexts, sections]
summary: "Reference page for Contexts: Contexts."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\ContextObjects\ContextBuilder.cs -->

# Contexts: Contexts

> TL;DR: Reference page for Contexts: Contexts.

This page mirrors the `Contexts` section from [Contexts](../contexts.md).

## `ContextBuilder` {: #contextbuilder}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`
    
    **Kind** `constructor`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
    ```
    
    **Docstring**
    
    Creates a context builder that starts from a base QaaS configuration file.
    
    Use this constructor when the context should load its initial configuration from a file path before overwrite sources and reference resolution are applied.

## `ContextBuilder` {: #contextbuilder-2}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`
    
    **Kind** `constructor`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
    ```
    
    **Docstring**
    
    Creates a context builder that starts from an existing configuration builder pipeline.
    
    Use this constructor when configuration sources are assembled externally and should be handed to the QaaS context pipeline as-is.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
