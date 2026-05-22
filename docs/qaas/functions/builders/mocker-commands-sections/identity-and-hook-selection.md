---
id: qaas.functions.builders.mocker-commands-sections.identity-and-hook-selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, mocker, commands, sections]
summary: "This page mirrors the Identity and hook selection section from Mocker Commands."
---
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
