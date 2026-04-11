# Publishers: Policies

This page mirrors the `Policies` section from [Publishers](../publishers.md).

## `CreatePolicy`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.CreatePolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder CreatePolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Creates or adds the configured policy entry on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdatePolicyAt`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemovePolicyAt`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.RemovePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder RemovePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
