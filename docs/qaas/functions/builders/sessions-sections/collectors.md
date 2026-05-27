# Sessions: Collectors

This page mirrors the `Collectors` section from [Sessions](../sessions.md).

## `AddCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddCollector(CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddCollector(CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied collector to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

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

## `RemoveCollector`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveCollector(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveCollector(string name)
    ```
    
    **Docstring**
    
    Removes the configured collector from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveCollectorAt`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveCollectorAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveCollectorAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured collector at the specified index from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
