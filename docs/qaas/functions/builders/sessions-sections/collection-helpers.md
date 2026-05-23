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

> TL;DR — This page mirrors the `Collection helpers` section from [Sessions](../sessions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `AddMockerCommand` {: #addmockercommand}

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

### `UpdateMockerCommand` {: #updatemockercommand}

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

### `RemoveMockerCommand` {: #removemockercommand}

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

### `RemoveMockerCommandAt` {: #removemockercommandat}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Sessions](../sessions.md)
