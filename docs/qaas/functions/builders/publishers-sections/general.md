# Publishers: General

This page mirrors the `General` section from [Publishers](../publishers.md).

## `FilterData`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `InLoops`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.InLoops()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder InLoops()
    ```
    
    **Docstring**
    
    Marks the transaction to execute continuously in loop mode.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.Configure(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder Configure(ISenderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
