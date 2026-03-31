# Sessions: Collection helpers

This page mirrors the `Collection helpers` section from [Sessions](../sessions.md).

## `CreateMockerCommand`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured mocker command entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateMockerCommand`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder)
    ```
    
    **Docstring**
    
    Updates the configured mocker command stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateMockerCommand`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured mocker command stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteMockerCommand`

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteMockerCommand(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteMockerCommand(string name)
    ```
    
    **Docstring**
    
    Removes the configured mocker command from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
