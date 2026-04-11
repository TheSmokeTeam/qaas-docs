# Assertions: Collection helpers

This page mirrors the `Collection helpers` section from [Assertions](../assertions.md).

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateConfiguration(...)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateConfiguration(...)
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
