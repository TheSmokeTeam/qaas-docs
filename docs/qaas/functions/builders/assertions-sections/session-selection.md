# Assertions: Session selection

This page mirrors the `Session selection` section from [Assertions](../assertions.md).

## `CreateSessionName`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Creates or adds the configured session name entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadSessionNames`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadSessionNames()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadSessionNames()
    ```
    
    **Docstring**
    
    Returns the configured session names currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateSessionName`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateSessionName(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateSessionName(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured session name stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteSessionName`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session name from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateSessionPattern`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured session pattern entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadSessionPatterns`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadSessionPatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadSessionPatterns()
    ```
    
    **Docstring**
    
    Returns the configured session patterns currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateSessionPattern`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateSessionPattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateSessionPattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured session pattern stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteSessionPattern`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Removes the configured session pattern from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
