# Consumers: General

This page mirrors the `General` section from [Consumers](../consumers.md).

## `FilterData`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.Configure(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Configure(IReaderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
