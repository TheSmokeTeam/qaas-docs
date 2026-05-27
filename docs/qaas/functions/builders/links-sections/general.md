# Links: General

This page mirrors the `General` section from [Links](../links.md).

## `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Configure(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Configure(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
