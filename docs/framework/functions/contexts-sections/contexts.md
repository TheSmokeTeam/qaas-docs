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

> TL;DR — This page mirrors the `Contexts` section from [Contexts](../contexts.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `ContextBuilder` {: #contextbuilder}

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

### `ContextBuilder` {: #contextbuilder_1}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Contexts](../contexts.md)
