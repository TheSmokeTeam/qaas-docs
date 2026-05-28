---
id: qaas.functions.extension.methods.sections.session
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, extension, methods, sections, session]
summary: "Reference page for Extension Methods: Session."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\SessionExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\ContextArtifactExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\DetailedDataExtensions.cs -->

# Extension Methods: Session

> TL;DR — Reference page for Extension Methods: Session.

This page mirrors the `Session` section from [Extension Methods](../extension-methods.md).

## `DisposeOfEnumerable<TEnumerable>` {: #disposeofenumerable-tenumerable}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionExtensions.DisposeOfEnumerable<TEnumerable>(this IEnumerable<TEnumerable>? enumerable, string enumerableName, ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Sessions/Extensions/SessionExtensions.cs`
    
    **Signature**
    ```csharp
    public static void DisposeOfEnumerable<TEnumerable>(this IEnumerable<TEnumerable>? enumerable, string enumerableName, ILogger logger) where TEnumerable : IDisposable
    ```
    
    **Docstring**
    
    Disposes of an enumerable of items that extend the `IDisposable` interface

## `AppendActionFailure` {: #appendactionfailure}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionExtensions.AppendActionFailure(this IList<ActionFailure> actionFailures, Exception exception, string sessionName, ILogger logger, string actionType, string actionRuntimeName, string? actionProtocol = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Sessions/Extensions/SessionExtensions.cs`
    
    **Signature**
    ```csharp
    public static void AppendActionFailure(this IList<ActionFailure> actionFailures, Exception exception, string sessionName, ILogger logger, string actionType, string actionRuntimeName, string? actionProtocol = null)
    ```
    
    **Docstring**
    
    Appends a failed action to the action failure list, and logs accordingly.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
