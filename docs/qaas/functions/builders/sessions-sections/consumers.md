# Sessions: Consumers

This page mirrors the `Consumers` section from [Sessions](../sessions.md).

## `CreateConsumer`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.CreateConsumer(ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateConsumer(ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured consumer entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConsumers`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadConsumers()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<ConsumerBuilder> ReadConsumers()
    ```
    
    **Docstring**
    
    Returns the configured consumers currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadConsumer`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadConsumer(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder? ReadConsumer(string name)
    ```
    
    **Docstring**
    
    Returns the configured consumer currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConsumer`

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

## `UpdateConsumer`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured consumer stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConsumer`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteConsumer(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteConsumer(string name)
    ```
    
    **Docstring**
    
    Removes the configured consumer from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
