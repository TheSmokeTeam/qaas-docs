# Sessions: Classification

This page mirrors the `Classification` section from [Sessions](../sessions.md).

## `WithinCategory`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.WithinCategory(string category)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder WithinCategory(string category)
    ```
    
    **Docstring**
    
    Sets the category used by the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
