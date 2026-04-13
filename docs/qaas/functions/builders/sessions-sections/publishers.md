# Sessions: Publishers

This page mirrors the `Publishers` section from [Sessions](../sessions.md).

## `AddPublisher`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddPublisher(PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddPublisher(PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied publisher to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreatePublisher`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.CreatePublisher(PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder CreatePublisher(PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured publisher entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadPublishers`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadPublishers()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<PublisherBuilder> ReadPublishers()
    ```
    
    **Docstring**
    
    Returns the configured publishers currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadPublisher`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadPublisher(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder? ReadPublisher(string name)
    ```
    
    **Docstring**
    
    Returns the configured publisher currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdatePublisher`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdatePublisher(string name, PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdatePublisher(string name, PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Updates the configured publisher stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdatePublisher`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured publisher stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeletePublisher`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DeletePublisher(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DeletePublisher(string name)
    ```
    
    **Docstring**
    
    Removes the configured publisher from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
