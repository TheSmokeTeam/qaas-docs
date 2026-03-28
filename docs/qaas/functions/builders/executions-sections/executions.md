# Executions: Executions

This page mirrors the `Executions` section from [Executions](../executions.md).

## `ExecutionType`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ExecutionType(ExecutionType executionType)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ExecutionType(ExecutionType executionType)
    ```
    
    **Docstring**
    
    Sets the execution type used when the runner execution is built.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `SetExecutionId`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetExecutionId(string executionId)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetExecutionId(string executionId)
    ```
    
    **Docstring**
    
    Sets the execution identifier stored on the built context.
    
    The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.
