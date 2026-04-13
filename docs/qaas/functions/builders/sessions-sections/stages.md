# Sessions: Stages

This page mirrors the `Stages` section from [Sessions](../sessions.md).

## `AddStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddStage(StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddStage(StageConfig stage)
    ```
    
    **Docstring**
    
    Adds the supplied stage to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateStage(int stageNumber, StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateStage(int stageNumber, StageConfig stage)
    ```
    
    **Docstring**
    
    Updates the configured stage stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveStage(int stageNumber)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveStage(int stageNumber)
    ```
    
    **Docstring**
    
    Removes the configured stage from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveStageAt`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveStageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveStageAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured stage at the specified index from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
