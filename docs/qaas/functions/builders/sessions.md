---
id: qaas.functions.builders.sessions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, sessions]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions

> TL;DR — This page lists the public Runner functions in the `Sessions` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection {: #identity-and-hook-selection}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner session builder instance.

## Execution order {: #execution-order}

### `AtStage` {: #atstage}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner session builder instance.

## Classification {: #classification}

### `WithinCategory` {: #withincategory}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.WithinCategory(string category)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder WithinCategory(string category)
    ```
    
    **Docstring**
    
    Sets the category used by the current Runner session builder instance.

## Session selection {: #session-selection}

### `RunSessionUntilStage` {: #runsessionuntilstage}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RunSessionUntilStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RunSessionUntilStage(int stage)
    ```
    
    **Docstring**
    
    Limits the session to run only until the specified stage.

## Probes {: #probes}

### `AddProbe` {: #addprobe}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddProbe(ProbeBuilder probeBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddProbe(ProbeBuilder probeBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied probe to the current Runner session builder instance.

### `UpdateProbe` {: #updateprobe}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateProbe(string name, ProbeBuilder probeBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateProbe(string name, ProbeBuilder probeBuilder)
    ```
    
    **Docstring**
    
    Updates the configured probe stored on the current Runner session builder instance.

### `RemoveProbe` {: #removeprobe}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveProbe(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveProbe(string name)
    ```
    
    **Docstring**
    
    Removes the configured probe from the current Runner session builder instance.

### `RemoveProbeAt` {: #removeprobeat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveProbeAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveProbeAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured probe at the specified index from the current Runner session builder instance.

## Publishers {: #publishers}

### `AddPublisher` {: #addpublisher}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddPublisher(PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddPublisher(PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied publisher to the current Runner session builder instance.

### `UpdatePublisher` {: #updatepublisher}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdatePublisher(string name, PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdatePublisher(string name, PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Updates the configured publisher stored on the current Runner session builder instance.

### `RemovePublisher` {: #removepublisher}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemovePublisher(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemovePublisher(string name)
    ```
    
    **Docstring**
    
    Removes the configured publisher from the current Runner session builder instance.

### `RemovePublisherAt` {: #removepublisherat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemovePublisherAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemovePublisherAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured publisher at the specified index from the current Runner session builder instance.

## Consumers {: #consumers}

### `AddConsumer` {: #addconsumer}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddConsumer(ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddConsumer(ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied consumer to the current Runner session builder instance.

### `UpdateConsumer` {: #updateconsumer}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateConsumer(string name, ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateConsumer(string name, ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Updates the configured consumer stored on the current Runner session builder instance.

### `RemoveConsumer` {: #removeconsumer}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveConsumer(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveConsumer(string name)
    ```
    
    **Docstring**
    
    Removes the configured consumer from the current Runner session builder instance.

### `RemoveConsumerAt` {: #removeconsumerat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveConsumerAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveConsumerAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured consumer at the specified index from the current Runner session builder instance.

## Transactions {: #transactions}

### `AddTransaction` {: #addtransaction}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddTransaction(TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddTransaction(TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied transaction to the current Runner session builder instance.

### `UpdateTransaction` {: #updatetransaction}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateTransaction(string name, TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateTransaction(string name, TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured transaction stored on the current Runner session builder instance.

### `RemoveTransaction` {: #removetransaction}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveTransaction(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveTransaction(string name)
    ```
    
    **Docstring**
    
    Removes the configured transaction from the current Runner session builder instance.

### `RemoveTransactionAt` {: #removetransactionat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveTransactionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveTransactionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured transaction at the specified index from the current Runner session builder instance.

## Collectors {: #collectors}

### `AddCollector` {: #addcollector}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddCollector(CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddCollector(CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied collector to the current Runner session builder instance.

### `UpdateCollector` {: #updatecollector}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateCollector(string name, CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateCollector(string name, CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Updates the configured collector stored on the current Runner session builder instance.

### `RemoveCollector` {: #removecollector}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveCollector(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveCollector(string name)
    ```
    
    **Docstring**
    
    Removes the configured collector from the current Runner session builder instance.

### `RemoveCollectorAt` {: #removecollectorat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveCollectorAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveCollectorAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured collector at the specified index from the current Runner session builder instance.

## Stages {: #stages}

### `AddStage` {: #addstage}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.AddStage(StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder AddStage(StageConfig stage)
    ```
    
    **Docstring**
    
    Adds the supplied stage to the current Runner session builder instance.

### `UpdateStage` {: #updatestage}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateStage(int stageNumber, StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateStage(int stageNumber, StageConfig stage)
    ```
    
    **Docstring**
    
    Updates the configured stage stored on the current Runner session builder instance.

### `RemoveStage` {: #removestage}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveStage(int stageNumber)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveStage(int stageNumber)
    ```
    
    **Docstring**
    
    Removes the configured stage from the current Runner session builder instance.

### `RemoveStageAt` {: #removestageat}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.RemoveStageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder RemoveStageAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured stage at the specified index from the current Runner session builder instance.

## Configuration {: #configuration}

### `WithTimeoutBefore` {: #withtimeoutbefore}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.WithTimeoutBefore(uint timeout)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder WithTimeoutBefore(uint timeout)
    ```
    
    **Docstring**
    
    Sets the timeout applied before the session runs.

### `WithTimeoutAfter` {: #withtimeoutafter}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.WithTimeoutAfter(uint timeout)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder WithTimeoutAfter(uint timeout)
    ```
    
    **Docstring**
    
    Sets the timeout applied after the session runs.

### `WithTimeZone` {: #withtimezone}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.WithTimeZone(string timeZoneId)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder WithTimeZone(string timeZoneId)
    ```
    
    **Docstring**
    
    Sets the time zone id used for daylight-saving-aware offset conversions in this session.
    
    Use this when session actions that rely on offset-based date conversion should resolve daylight-saving rules from a specific time zone.

## Collection helpers {: #collection-helpers}

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

## General {: #general}

### `DiscardData` {: #discarddata}

??? info "Source file, signature, and docstring"
    **Member**
    `SessionBuilder.DiscardData()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public SessionBuilder DiscardData()
    ```
    
    **Docstring**
    
    Disables data persistence for the configured session.

## See also {: #see-also}

- [Runner Functions](../index.md)
