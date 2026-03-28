# Sessions: Inspection

This page mirrors the `Inspection` section from [Sessions](../sessions.md).

## `ReadMockerCommands`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadMockerCommands()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<MockerCommandBuilder> ReadMockerCommands()
    ```
    
    **Docstring**
    
    Returns the configured mocker commands currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadMockerCommand`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadMockerCommand(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder? ReadMockerCommand(string name)
    ```
    
    **Docstring**
    
    Returns the configured mocker command currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
