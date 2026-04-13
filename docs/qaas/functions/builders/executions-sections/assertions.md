# Executions: Assertions

This page mirrors the `Assertions` section from [Executions](../executions.md).

## `AddAssertion`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddAssertion(AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied assertion to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateAssertion`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured assertion stored on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveAssertion`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveAssertion(string assertionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveAssertion(string assertionName)
    ```
    
    **Docstring**
    
    Removes the configured assertion from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveAssertionAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveAssertionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveAssertionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured assertion at the specified index from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
