---
id: qaas.functions.extension.methods.sections.context.artifact
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, extension, methods, sections, context, artifact]
summary: "Reference page for Extension Methods: Context artifact."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\ContextArtifactExtensions.cs -->

# Extension Methods: Context artifact

> TL;DR — This page mirrors the `Context artifact` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `SetRenderedConfigurationTemplate` {: #setrenderedconfigurationtemplate}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.SetRenderedConfigurationTemplate(this Context context, string template)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static void SetRenderedConfigurationTemplate(this Context context, string template)
    ```
    
    **Docstring**
    
    Saves the rendered runner configuration template for the current execution scope.

### `GetRenderedConfigurationTemplate` {: #getrenderedconfigurationtemplate}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.GetRenderedConfigurationTemplate(this Context context)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static string? GetRenderedConfigurationTemplate(this Context context)
    ```
    
    **Docstring**
    
    Returns the rendered configuration template captured for the current execution scope, if one exists.

### `AppendSessionLog` {: #appendsessionlog}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.AppendSessionLog(this Context context, string sessionName, string message)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static void AppendSessionLog(this Context context, string sessionName, string message)
    ```
    
    **Docstring**
    
    Appends a session-scoped log line that can later be attached to reports.

### `GetSessionLog` {: #getsessionlog}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextArtifactExtensions.GetSessionLog(this Context context, string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextArtifactExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Infrastructure/ContextArtifactExtensions.cs`
    
    **Signature**
    ```csharp
    public static string? GetSessionLog(this Context context, string sessionName)
    ```
    
    **Docstring**
    
    Returns the concatenated session log text for a session, or null when nothing was captured.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
