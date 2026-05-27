---
id: qaas.functions.builders.mocker.commands.sections.execution.order
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, mocker, commands, sections, execution, order]
summary: "Reference page for Mocker Commands: Execution order."
---

# Mocker Commands: Execution order

This page mirrors the `Execution order` section from [Mocker Commands](../mocker-commands.md).

## `AtStage`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
