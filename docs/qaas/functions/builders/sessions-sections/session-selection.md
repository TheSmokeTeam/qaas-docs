# Sessions: Session selection

This page mirrors the `Session selection` section from [Sessions](../sessions.md).

## `RunSessionUntilStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RunSessionUntilStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RunSessionUntilStage(int stage)
    ```
    
    **Docstring**
    
    Limits the session to run only until the specified stage.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
