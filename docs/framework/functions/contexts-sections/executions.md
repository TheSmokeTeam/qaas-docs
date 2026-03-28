# Contexts: Executions

This page mirrors the `Executions` section from [Contexts](../contexts.md).

## `SetExecutionId`

??? info "Source file, signature, and docstring"
    **Member**
    `ContextBuilder.SetExecutionId(string? executionId)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`
    
    **Signature**
    ```csharp
    public IContextBuilder SetExecutionId(string? executionId)
    ```
    
    **Docstring**
    
    Sets the execution identifier stored on the built context.
    
    The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.
