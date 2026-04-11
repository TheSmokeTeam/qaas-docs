# Consumers: Collection helpers

This page mirrors the `Collection helpers` section from [Consumers](../consumers.md).

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update)
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(IReaderConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(...)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(...)
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
