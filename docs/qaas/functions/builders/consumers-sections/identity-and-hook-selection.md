# Consumers: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Consumers](../consumers.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
