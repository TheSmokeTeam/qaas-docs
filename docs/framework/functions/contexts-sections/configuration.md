---
id: framework.functions.contexts.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, contexts, sections, configuration]
summary: "Reference page for Contexts: Configuration."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\ContextObjects\ContextBuilder.cs -->

# Contexts: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Contexts](../contexts.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `SetConfigurationFile` {: #setconfigurationfile}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.SetConfigurationFile(string? configurationFile)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder SetConfigurationFile(string? configurationFile)
    ```
    
    **Docstring**
    
    Sets the base configuration file used by the context builder.
    
    Use this when the base configuration file should be selected or replaced after the builder has been created.

### `WithOverwriteFile` {: #withoverwritefile}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.WithOverwriteFile(string? overwriteFile)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder WithOverwriteFile(string? overwriteFile)
    ```
    
    **Docstring**
    
    Adds an overwrite file that should be applied during context construction.
    
    Overwrite files are applied after the base configuration and before the final configuration is built.

### `WithOverwriteFolder` {: #withoverwritefolder}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.WithOverwriteFolder(string? overwriteFolder)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder WithOverwriteFolder(string? overwriteFolder)
    ```
    
    **Docstring**
    
    Adds an overwrite folder whose YAML files should be applied during context construction.
    
    Every YAML file discovered in the folder is applied as an overwrite source in the order returned by the file-system enumeration.

### `SetCase` {: #setcase}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.SetCase(string? caseFile)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder SetCase(string? caseFile)
    ```
    
    **Docstring**
    
    Sets the case file used during context construction.
    
    The supplied value is also stored as the case name on the built context.

### `WithOverwriteArgument` {: #withoverwriteargument}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.WithOverwriteArgument(string? argument)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder WithOverwriteArgument(string? argument)
    ```
    
    **Docstring**
    
    Adds a command-line style overwrite argument to the context builder.
    
    Use this when command-line style overrides should participate in the same configuration pipeline as YAML sources.

### `WithReferenceResolution` {: #withreferenceresolution}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.WithReferenceResolution(ReferenceConfig referenceConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder WithReferenceResolution(ReferenceConfig referenceConfig)
    ```
    
    **Docstring**
    
    Adds a reference-resolution rule to the context builder.
    
    Reference-resolution rules are applied while building the final configuration so linked configuration values can be expanded consistently.

### `WithEnvironmentVariableResolution` {: #withenvironmentvariableresolution}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.WithEnvironmentVariableResolution()`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder WithEnvironmentVariableResolution()
    ```
    
    **Docstring**
    
    Enables environment-variable expansion while the context is being built.
    
    Enable this when configuration values should resolve environment variables while the context is being built.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Contexts](../contexts.md)
