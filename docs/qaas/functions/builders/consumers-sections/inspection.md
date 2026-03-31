# Consumers: Inspection

This page mirrors the `Inspection` section from [Consumers](../consumers.md).

## `ReadPolicies`

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.ReadPolicies()`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<PolicyBuilder> ReadPolicies()
    ```
    
    **Docstring**
    
    Returns the configured policies currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.
