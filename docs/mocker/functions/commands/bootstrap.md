---
id: mocker.functions.commands.bootstrap
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, commands, bootstrap]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\Bootstrap.cs -->

# Bootstrap

> TL;DR — This page lists the public Mocker functions in the `Bootstrap` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `New` {: #new}

??? info "Source file, signature, and docstring"
    **Member**
    `Bootstrap.New(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Source File** `QaaS.Mocker/Bootstrap.cs`
    
    **Signature**
    ```csharp
    public static MockerRunner New(IEnumerable<string>? args = null)
    ```
    
    **Docstring**
    
    Creates a new MockerRunner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## `New<TRunner>` {: #newtrunner}

??? info "Source file, signature, and docstring"
    **Member**
    `Bootstrap.New<TRunner>(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Source File** `QaaS.Mocker/Bootstrap.cs`
    
    **Signature**
    ```csharp
    public static MockerRunner New<TRunner>(IEnumerable<string>? args = null) where TRunner : MockerRunner
    ```
    
    **Docstring**
    
    Creates a new runner instance from the supplied bootstrap inputs.
    
    Use this overload when the mocker run should be represented by a custom implementation while keeping the same command-line bootstrap flow.

## See also {: #see-also}

- [Mocker Functions](../index.md)
