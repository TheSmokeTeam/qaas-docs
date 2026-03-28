# Mocker Commands: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Mocker Commands](../mocker-commands.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
