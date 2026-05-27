---
id: qaas.functions.builders.mocker.commands.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, mocker, commands, sections, configuration]
summary: "Reference page for Mocker Commands: Configuration."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\MockerCommands\MockerCommandBuilder.cs -->

# Mocker Commands: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Mocker Commands](../mocker-commands.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithRedis` {: #withredis}

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRedis(RedisConfig redis)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRedis(RedisConfig redis)
    ```
    
    **Docstring**
    
    Configures redis on the current Runner mocker command builder instance.

### `WithRequestDurationMs` {: #withrequestdurationms}

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRequestDurationMs(int requestDurationMs)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRequestDurationMs(int requestDurationMs)
    ```
    
    **Docstring**
    
    Configures request duration ms on the current Runner mocker command builder instance.

### `WithRequestRetries` {: #withrequestretries}

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRequestRetries(int requestRetries)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRequestRetries(int requestRetries)
    ```
    
    **Docstring**
    
    Configures request retries on the current Runner mocker command builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Mocker Commands](../mocker-commands.md)
