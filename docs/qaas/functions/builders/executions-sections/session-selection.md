# Executions: Session selection

This page mirrors the `Session selection` section from [Executions](../executions.md).

## `AddSession`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddSession(SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied session to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateSession`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateSession(string sessionName, SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured session stored on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveSession`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveSession(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveSession(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveSessionAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveSessionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveSessionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session at the specified index from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
