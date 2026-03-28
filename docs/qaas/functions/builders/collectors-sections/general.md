# Collectors: General

This page mirrors the `General` section from [Collectors](../collectors.md).

## `FilterData`

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CollectInRange`

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.CollectInRange(CollectionRange collectionRange)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder CollectInRange(CollectionRange collectionRange)
    ```
    
    **Docstring**
    
    Configures collect in range on the current Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Collectors'.

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.Configure(IFetcherConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder Configure(IFetcherConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
