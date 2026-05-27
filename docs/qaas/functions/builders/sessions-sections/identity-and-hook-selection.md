# Sessions: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Sessions](../sessions.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
