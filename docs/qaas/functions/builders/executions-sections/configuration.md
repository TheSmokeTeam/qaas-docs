# Executions: Configuration

This page mirrors the `Configuration` section from [Executions](../executions.md).

## `WithGlobalDict`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithGlobalDict(Dictionary<string, object?> globalDict)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithGlobalDict(Dictionary<string, object?> globalDict)
    ```
    
    **Docstring**
    
    Replaces the global dictionary stored on the runner execution context.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `SetCase`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetCase(string caseName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetCase(string caseName)
    ```
    
    **Docstring**
    
    Sets the case file applied by the context builder.
    
    Case files are used as the final scenario-specific overlay that shapes the runtime configuration for a specific execution.

## `WithMetadata`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithMetadata(MetaDataConfig metaDataConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithMetadata(MetaDataConfig metaDataConfig)
    ```
    
    **Docstring**
    
    Sets the metadata configuration stored on the execution.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
