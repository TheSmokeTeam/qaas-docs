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

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\MockerCommands\MockerCommandBuilder.cs -->

# Mocker Commands: Servers

> TL;DR — This page mirrors the `Servers` section from [Mocker Commands](../mocker-commands.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithServerName` {: #withservername}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Mocker Commands](../mocker-commands.md)
