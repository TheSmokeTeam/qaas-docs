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

# Extension Methods: Session

> TL;DR — This page mirrors the `Session` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `DisposeOfEnumerable<TEnumerable>` {: #disposeofenumerabletenumerable}

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

### `AppendActionFailure` {: #appendactionfailure}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
