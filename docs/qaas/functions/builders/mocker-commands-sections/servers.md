---
id: qaas.functions.builders.mocker.commands.sections.servers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, mocker, commands, sections, servers]
summary: "Reference page for Mocker Commands: Servers."
---

# Mocker Commands: Servers

This page mirrors the `Servers` section from [Mocker Commands](../mocker-commands.md).

## `WithServerName`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithServerName(string serverName)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithServerName(string serverName)
    ```
    
    **Docstring**
    
    Configures server name on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
