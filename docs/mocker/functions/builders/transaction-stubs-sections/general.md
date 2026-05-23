---
id: mocker.functions.builders.transaction.stubs.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, transaction, stubs, sections, general]
summary: "Reference page for Transaction Stubs: General."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Stubs\ConfigurationObjects\TransactionStubBuilder.cs -->

# Transaction Stubs: General

> TL;DR — This page mirrors the `General` section from [Transaction Stubs](../transaction-stubs.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Configure(IConfiguration configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder Configure(IConfiguration configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Mocker transaction stub builder instance.

### `Configure` {: #configure_1}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Mocker transaction stub builder instance.

### `Build` {: #build}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubConfig Build()
    ```
    
    **Docstring**
    
    Builds the configured Mocker transaction stub builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### `FromConfig` {: #fromconfig}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.FromConfig(TransactionStubConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public static TransactionStubBuilder FromConfig(TransactionStubConfig config)
    ```
    
    **Docstring**
    
    Creates a new Mocker transaction stub builder instance from an existing configuration object.
    
    Use this when an existing immutable configuration needs to be brought back into the fluent builder workflow for incremental changes.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Transaction Stubs](../transaction-stubs.md)
