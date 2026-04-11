# Publishers: Collection helpers

This page mirrors the `Collection helpers` section from [Publishers](../publishers.md).

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(ISenderConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(...)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(...)
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
