# Executions: Collection helpers

This page mirrors the `Collection helpers` section from [Executions](../executions.md).

## `UpdateController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Updates the configured controller stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveController()
    ```
    
    **Docstring**
    
    Removes the configured controller from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
