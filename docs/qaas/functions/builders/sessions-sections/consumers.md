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

> TL;DR: Reference page for Sessions: Consumers.

This page mirrors the `Consumers` section from [Sessions](../sessions.md).

## `AddConsumer` {: #addconsumer}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConsumer` {: #updateconsumer}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveConsumer` {: #removeconsumer}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveConsumerAt` {: #removeconsumerat}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
