---
id: mocker.functions.commands.mocker-runner
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, commands, runner]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\MockerRunner.cs -->

# Mocker Runner

> TL;DR — This page lists the public Mocker functions in the `Mocker Runner` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `Run` {: #run}

??? info "Source file, signature, and docstring"
    **Member**
    `MockerRunner.Run()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerRunner`
    
    **Source File** `QaaS.Mocker/MockerRunner.cs`
    
    **Signature**
    ```csharp
    public virtual void Run()
    ```
    
    **Docstring**
    
    Runs the configured QaaS.Mocker execution.
    
    Call this after the mocker execution has been configured and resolved. The method delegates to the underlying execution host.

## See also {: #see-also}

- [Mocker Functions](../index.md)
