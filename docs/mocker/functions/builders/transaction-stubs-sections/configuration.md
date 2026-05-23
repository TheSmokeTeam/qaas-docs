---
id: mocker.functions.builders.transaction.stubs.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, transaction, stubs, sections, configuration]
summary: "Reference page for Transaction Stubs: Configuration."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Stubs\ConfigurationObjects\TransactionStubBuilder.cs -->

# Transaction Stubs: Configuration

> TL;DR — This page mirrors the `Configuration` section from [Transaction Stubs](../transaction-stubs.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithRequestBodyDeserialization` {: #withrequestbodydeserialization}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.WithRequestBodyDeserialization(DeserializeConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder WithRequestBodyDeserialization(DeserializeConfig config)
    ```
    
    **Docstring**
    
    Sets how request bodies are deserialized before the stub processor runs.

### `WithResponseBodySerialization` {: #withresponsebodyserialization}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.WithResponseBodySerialization(SerializeConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder WithResponseBodySerialization(SerializeConfig config)
    ```
    
    **Docstring**
    
    Sets how response bodies are serialized after the stub processor runs.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Transaction Stubs](../transaction-stubs.md)
