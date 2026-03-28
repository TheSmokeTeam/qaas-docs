# Executions: Reporting and artifacts

This page mirrors the `Reporting and artifacts` section from [Executions](../executions.md).

## `WithLogger`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithLogger(ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithLogger(ILogger logger)
    ```
    
    **Docstring**
    
    Replaces the logger stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
