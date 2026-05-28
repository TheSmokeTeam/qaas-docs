---
id: qaas.functions.commands.bootstrap.sections.when.to.use
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [runner]
keywords: [runner, reference]
summary: "Reference page for Bootstrap: When to use."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner\Bootstrap.cs -->

# Bootstrap: When to use

> TL;DR — Reference page for Bootstrap: When to use.

This page mirrors the `When to use` section from [Bootstrap](../bootstrap.md).

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `New` {: #new}

??? info "Source file, signature, and docstring"
    **Member**
    `Bootstrap.New(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Source File** `QaaS.Runner/Bootstrap.cs`
    
    **Signature**
    ```csharp
    public static Runner New(IEnumerable<string>? args = null)
    ```
    
    **Docstring**
    
    Creates a new Runner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## `New<TRunner>` {: #new-trunner}

??? info "Source file, signature, and docstring"
    **Member**
    `Bootstrap.New<TRunner>(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Source File** `QaaS.Runner/Bootstrap.cs`
    
    **Signature**
    ```csharp
    public static Runner New<TRunner>(IEnumerable<string>? args = null) where TRunner : Runner
    ```
    
    **Docstring**
    
    Creates a new Runner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## See also {: #see-also}

- [Runner Functions](../index.md)
