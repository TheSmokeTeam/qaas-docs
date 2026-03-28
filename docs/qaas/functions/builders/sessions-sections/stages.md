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

## `CreateStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.CreateStage(StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateStage(StageConfig stage)
    ```
    
    **Docstring**
    
    Creates or adds the configured stage entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadStages`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadStages()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<StageConfig> ReadStages()
    ```
    
    **Docstring**
    
    Returns the configured stages currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadStage(int stageNumber)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public StageConfig? ReadStage(int stageNumber)
    ```
    
    **Docstring**
    
    Returns the configured stage currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

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

## `DeleteStage`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteStage(int stageNumber)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteStage(int stageNumber)
    ```
    
    **Docstring**
    
    Removes the configured stage from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
