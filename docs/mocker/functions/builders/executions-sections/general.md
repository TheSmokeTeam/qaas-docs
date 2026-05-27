# Executions: General

This page mirrors the `General` section from [Executions](../executions.md).

## `RunLocally`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RunLocally(bool runLocally = true)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RunLocally(bool runLocally = true)
    ```
    
    **Docstring**
    
    Configures whether the mocker waits for an interactive local shutdown signal.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Build`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public override BaseExecution Build()
    ```
    
    **Docstring**
    
    Builds the configured Mocker execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## `Validate`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Validate(ValidationContext validationContext)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    ```
    
    **Docstring**
    
    Validates the current Mocker execution builder configuration.
    
    Validation results are returned instead of thrown so callers can aggregate or report configuration problems before running the product.
