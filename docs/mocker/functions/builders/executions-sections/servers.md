---
id: mocker.functions.builders.executions.sections.servers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, executions, sections, servers]
summary: "Reference page for Executions: Servers."
---
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->

# Executions: Servers

> TL;DR — Reference page for Executions: Servers.

This page mirrors the `Servers` section from [Executions](../executions.md).

## `WithServer` {: #withserver}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithServer(ServerConfig serverConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithServer(ServerConfig serverConfig)
    ```
    
    **Docstring**
    
    Sets the single-server configuration used by the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddServers` {: #addservers}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddServers(params ServerConfig[] serverConfigs)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Mocker/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddServers(params ServerConfig[] serverConfigs)
    ```
    
    **Docstring**
    
    Adds the supplied servers to the current Mocker execution builder instance.
    
    Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateServer` {: #updateserver}

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

## `AddServer` {: #addserver}

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

## `UpdateServerAt` {: #updateserverat}

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

## `RemoveServer` {: #removeserver}

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

## `RemoveServerAt` {: #removeserverat}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
