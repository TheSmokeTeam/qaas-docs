# Publishers: Execution order

This page mirrors the `Execution order` section from [Publishers](../publishers.md).

## `AtStage`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
