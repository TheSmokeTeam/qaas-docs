# Executions: Output selection

This page mirrors the `Output selection` section from [Executions](../executions.md).

## `WithTemplateOutputFolder`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithTemplateOutputFolder(string? templateOutputFolder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithTemplateOutputFolder(string? templateOutputFolder)
    ```
    
    **Docstring**
    
    Sets the template output folder used by template mode.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
