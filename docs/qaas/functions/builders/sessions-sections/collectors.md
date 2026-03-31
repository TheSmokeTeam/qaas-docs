# Sessions: Collectors

This page mirrors the `Collectors` section from [Sessions](../sessions.md).

## `CreateCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.CreateCollector(CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateCollector(CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured collector entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadCollectors`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadCollectors()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<CollectorBuilder> ReadCollectors()
    ```
    
    **Docstring**
    
    Returns the configured collectors currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.ReadCollector(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder? ReadCollector(string name)
    ```
    
    **Docstring**
    
    Returns the configured collector currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateCollector(string name, CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateCollector(string name, CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Updates the configured collector stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured collector stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteCollector(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteCollector(string name)
    ```
    
    **Docstring**
    
    Removes the configured collector from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
