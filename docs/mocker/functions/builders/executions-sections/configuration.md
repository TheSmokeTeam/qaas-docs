# Executions: Configuration

This page mirrors the `Configuration` section from [Executions](../executions.md).

## `WithRootConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithRootConfiguration(IConfiguration configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithRootConfiguration(IConfiguration configuration)
    ```
    
    **Docstring**
    
    Replaces the root configuration stored on the current execution context.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Sets the controller configuration used by the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
