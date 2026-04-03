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

## `ReadServerAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadServerAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ServerConfig? ReadServerAt(int index)
    ```
    
    **Docstring**
    
    Returns the configured server currently stored at the specified index on the Mocker execution builder instance.
    
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

## `CreateServers`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateServers(params ServerConfig[] serverConfigs)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateServers(params ServerConfig[] serverConfigs)
    ```
    
    **Docstring**
    
    Creates the configured server list on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Updates the configured single-server definition on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateServerAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateServerAt(int index, ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateServerAt(int index, ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Updates the configured server stored at the specified index on the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

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

## `RemoveServer`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveServer()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveServer()
    ```
    
    **Docstring**
    
    Removes the configured single-server definition from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveServerAt`

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveServerAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveServerAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured server stored at the specified index from the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
