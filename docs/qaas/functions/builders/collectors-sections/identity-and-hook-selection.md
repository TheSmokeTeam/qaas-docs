# Collectors: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Collectors](../collectors.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `CollectorBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs`
    
    **Signature**
    ```csharp
    public CollectorBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
