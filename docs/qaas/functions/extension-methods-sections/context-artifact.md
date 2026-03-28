# Extension Methods: Context artifact

This page mirrors the `Context artifact` section from [Extension Methods](../extension-methods.md).

## `SetRenderedConfigurationTemplate`

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

## `GetRenderedConfigurationTemplate`

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

## `AppendSessionLog`

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

## `GetSessionLog`

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
