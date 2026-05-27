# Contexts: Reporting and artifacts

This page mirrors the `Reporting and artifacts` section from [Contexts](../contexts.md).

## `SetLogger`

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.SetLogger(ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder SetLogger(ILogger logger)
    ```
    
    **Docstring**
    
    Sets the logger stored on the built context.
    
    The configured logger becomes the logger used by the context itself and by runtime components resolved from that context.
