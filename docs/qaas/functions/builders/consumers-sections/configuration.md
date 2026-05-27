---
id: qaas.functions.builders.consumers.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, consumers, sections, configuration]
summary: "Reference page for Consumers: Configuration."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Consumers\Builders\ConsumerBuilderLogic.cs -->

# Consumers: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Consumers](../consumers.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithTimeout` {: #withtimeout}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.WithTimeout(int timeoutMs)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder WithTimeout(int timeoutMs)
    ```
    
    **Docstring**
    
    Configures timeout on the current Runner consumer builder instance.

### `WithInitialTimeout` {: #withinitialtimeout}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.WithInitialTimeout(int? initialTimeoutMs)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder WithInitialTimeout(int? initialTimeoutMs)
    ```
    
    **Docstring**
    
    Configures timeout on the current Runner consumer builder instance.

### `WithDeserializer` {: #withdeserializer}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder WithDeserializer(DeserializeConfig deserializeConfig)
    ```
    
    **Docstring**
    
    Sets the deserializer configuration used by the current Runner consumer builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Consumers](../consumers.md)
