---
id: qaas.functions.builders.sessions.sections.consumers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, sessions, sections, consumers]
summary: "Reference page for Sessions: Consumers."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions: Consumers

> TL;DR — This page mirrors the `Consumers` section from [Sessions](../sessions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddConsumer` {: #addconsumer}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddConsumer(ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddConsumer(ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied consumer to the current Runner session builder instance.

### `UpdateConsumer` {: #updateconsumer}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateConsumer(string name, ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateConsumer(string name, ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Updates the configured consumer stored on the current Runner session builder instance.

### `RemoveConsumer` {: #removeconsumer}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveConsumer(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveConsumer(string name)
    ```
    
    **Docstring**
    
    Removes the configured consumer from the current Runner session builder instance.

### `RemoveConsumerAt` {: #removeconsumerat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveConsumerAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveConsumerAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured consumer at the specified index from the current Runner session builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Sessions](../sessions.md)
