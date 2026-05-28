---
id: qaas.functions.builders.sessions.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, sessions, sections, collection, helpers]
summary: "Reference page for Sessions: Collection helpers."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions: Collection helpers

> TL;DR: Reference page for Sessions: Collection helpers.

This page mirrors the `Collection helpers` section from [Sessions](../sessions.md).

## `AddMockerCommand` {: #addmockercommand}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddMockerCommand(MockerCommandBuilder mockerCommandBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddMockerCommand(MockerCommandBuilder mockerCommandBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied mocker command to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateMockerCommand` {: #updatemockercommand}

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

## `RemoveMockerCommand` {: #removemockercommand}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveMockerCommand(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveMockerCommand(string name)
    ```
    
    **Docstring**
    
    Removes the configured mocker command from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveMockerCommandAt` {: #removemockercommandat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveMockerCommandAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveMockerCommandAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured mocker command at the specified index from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
