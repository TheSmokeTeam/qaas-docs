# Executions: Servers

This page mirrors the `Servers` section from [Executions](../executions.md).

## `ReadServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadServer()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ServerConfig? ReadServer()
    ```
    
    **Docstring**
    
    Returns the configured server currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadServers`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadServers()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<ServerConfig> ReadServers()
    ```
    
    **Docstring**
    
    Returns the configured servers currently stored on the Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `CreateServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Creates or adds the configured server entry on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReplaceServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReplaceServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ReplaceServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Replaces the configured single-server definition on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

## `AddServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Adds the supplied server to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReplaceServers`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReplaceServers(params ServerConfig[] serverConfigs)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ReplaceServers(params ServerConfig[] serverConfigs)
    ```
    
    **Docstring**
    
    Replaces the configured multi-server definitions on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Executions'.

## `UpdateServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateServer(Action<ServerConfig> configureAction)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateServer(Action<ServerConfig> configureAction)
    ```
    
    **Docstring**
    
    Updates the configured server stored on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
