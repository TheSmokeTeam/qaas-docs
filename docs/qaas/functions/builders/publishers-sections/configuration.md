---
id: qaas.functions.builders.publishers.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, publishers, sections, configuration]
summary: "Reference page for Publishers: Configuration."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Publishers\Builders\PublisherBuilderLogic.cs -->

# Publishers: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Publishers](../publishers.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithSerializer` {: #withserializer}

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

### `WithIterations` {: #withiterations}

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
    
    Sets how many iterations the publisher should execute.

### `WithSleep` {: #withsleep}

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

### `WithChunks` {: #withchunks}

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

### `WithParallelism` {: #withparallelism}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Publishers](../publishers.md)
