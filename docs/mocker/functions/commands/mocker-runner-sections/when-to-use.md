---
id: mocker.functions.commands.mocker.runner.sections.when.to.use
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [mocker]
keywords: [mocker, reference]
summary: "Reference page for Mocker Runner: When to use."
---
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\MockerRunner.cs -->

# Mocker Runner: When to use

> TL;DR — Reference page for Mocker Runner: When to use.

This page mirrors the `When to use` section from [Mocker Runner](../mocker-runner.md).

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
