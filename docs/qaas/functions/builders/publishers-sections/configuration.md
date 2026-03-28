# Publishers: Configuration

This page mirrors the `Configuration` section from [Publishers](../publishers.md).

## `WithSerializer`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.WithSerializer(SerializeConfig serializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithSerializer(SerializeConfig serializeConfig)
    ```
    
    **Docstring**
    
    Sets the serializer configuration used by the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithIterations`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.WithIterations(int iterations)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithIterations(int iterations)
    ```
    
    **Docstring**
    
    Sets how many iterations the transaction should execute.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSleep`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.WithSleep(ulong sleepTimeMs)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithSleep(ulong sleepTimeMs)
    ```
    
    **Docstring**
    
    Sets the delay applied between transaction iterations.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithChunks`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.WithChunks(Chunks chunks)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithChunks(Chunks chunks)
    ```
    
    **Docstring**
    
    Configures chunks on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithParallelism`

??? info "Source file, signature, and docstring"
    **Member**
    `PublisherBuilder.WithParallelism(int parallelism)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithParallelism(int parallelism)
    ```
    
    **Docstring**
    
    Configures parallelism on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
