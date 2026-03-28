# Assertions: Classification

This page mirrors the `Classification` section from [Assertions](../assertions.md).

## `WithCategory`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WithCategory(string category)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WithCategory(string category)
    ```
    
    **Docstring**
    
    Configures category on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSeverity`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WithSeverity(AssertionSeverity severity)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WithSeverity(AssertionSeverity severity)
    ```
    
    **Docstring**
    
    Sets the severity associated with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
