# Publishers: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Publishers](../publishers.md).

## `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
