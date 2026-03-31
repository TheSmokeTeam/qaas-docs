# Executions: Collection helpers

This page mirrors the `Collection helpers` section from [Executions](../executions.md).

## `CreateController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateController(ControllerConfig controllerConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateController(ControllerConfig controllerConfig)
    ```
    
    **Docstring**
    
    Creates or adds the configured controller entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

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

## `UpdateController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateController(Action<ControllerConfig> configureAction)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateController(Action<ControllerConfig> configureAction)
    ```
    
    **Docstring**
    
    Updates the configured controller stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteController`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteController()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteController()
    ```
    
    **Docstring**
    
    Removes the configured controller from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
