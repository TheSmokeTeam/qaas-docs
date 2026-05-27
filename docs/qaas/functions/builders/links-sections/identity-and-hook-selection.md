# Links: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Links](../links.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
