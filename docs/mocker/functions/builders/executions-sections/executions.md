# Executions: Executions

This page mirrors the `Executions` section from [Executions](../executions.md).

## `ExecutionBuilder`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder()`
    
    **Kind** `constructor`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder()
    ```
    
    **Docstring**
    
    Creates a new Mocker execution builder with an empty default context.
    
    Use this constructor when bootstrapping a mocker execution entirely in code before any configuration or runtime services have been attached.

## `WithExecutionMode`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithExecutionMode(ExecutionMode executionMode)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithExecutionMode(ExecutionMode executionMode)
    ```
    
    **Docstring**
    
    Sets the execution mode used by the resulting mocker runtime.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
