# Mocker Commands

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection

### `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Execution order

### `AtStage`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Servers

### `WithServerName`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithServerName(string serverName)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithServerName(string serverName)
    ```
    
    **Docstring**
    
    Configures server name on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Configuration

### `WithRedis`

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

### `WithRequestDurationMs`

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

### `WithRequestRetries`

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

## Collection helpers

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.UpdateConfiguration(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder UpdateConfiguration(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## General

### `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Configure(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Configure(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
