# Mocker Commands: General

This page mirrors the `General` section from [Mocker Commands](../mocker-commands.md).

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Configure(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Configure(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
