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

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\MockerCommands\MockerCommandBuilder.cs -->

# Mocker Commands: Execution order

> TL;DR — This page mirrors the `Execution order` section from [Mocker Commands](../mocker-commands.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AtStage` {: #atstage}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Mocker Commands](../mocker-commands.md)
