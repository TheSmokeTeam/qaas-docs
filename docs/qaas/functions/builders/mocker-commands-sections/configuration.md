# Mocker Commands: Configuration

This page mirrors the `Configuration` section from [Mocker Commands](../mocker-commands.md).

## `WithRedis`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRedis(RedisConfig redis)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRedis(RedisConfig redis)
    ```
    
    **Docstring**
    
    Configures redis on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithRequestDurationMs`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRequestDurationMs(int requestDurationMs)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRequestDurationMs(int requestDurationMs)
    ```
    
    **Docstring**
    
    Configures request duration ms on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithRequestRetries`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRequestRetries(int requestRetries)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRequestRetries(int requestRetries)
    ```
    
    **Docstring**
    
    Configures request retries on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
