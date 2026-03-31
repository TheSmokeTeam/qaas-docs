# Executions: Assertions

This page mirrors the `Assertions` section from [Executions](../executions.md).

## `CreateAssertion`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateAssertion(AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateAssertion(AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured assertion entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadAssertions`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadAssertions()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<AssertionBuilder> ReadAssertions()
    ```
    
    **Docstring**
    
    Returns the configured assertions currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadAssertion`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadAssertion(string assertionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder? ReadAssertion(string assertionName)
    ```
    
    **Docstring**
    
    Returns the configured assertion currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

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

## `DeleteAssertion`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteAssertion(string assertionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteAssertion(string assertionName)
    ```
    
    **Docstring**
    
    Removes the configured assertion from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
