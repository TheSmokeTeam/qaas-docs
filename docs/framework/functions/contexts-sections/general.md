# Contexts: General

This page mirrors the `General` section from [Contexts](../contexts.md).

## `ResolveCaseLast`

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.ResolveCaseLast()`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder ResolveCaseLast()
    ```
    
    **Docstring**
    
    Delays case-file application until after reference resolution has completed.
    
    This changes resolution order so the case overlay is applied after references are expanded from the base configuration and overwrites.
