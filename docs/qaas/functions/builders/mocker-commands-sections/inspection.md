# Mocker Commands: Inspection

This page mirrors the `Inspection` section from [Mocker Commands](../mocker-commands.md).

## `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
