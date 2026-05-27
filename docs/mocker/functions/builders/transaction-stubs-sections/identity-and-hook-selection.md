---
id: mocker.functions.builders.transaction.stubs.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, builders, transaction, stubs, sections, identity, and, hook, selection]
summary: "Reference page for Transaction Stubs: Identity and hook selection."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Stubs\ConfigurationObjects\TransactionStubBuilder.cs -->

# Transaction Stubs: Identity and hook selection

> TL;DR — This page mirrors the `Identity and hook selection` section from [Transaction Stubs](../transaction-stubs.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Mocker transaction stub builder instance.

### `HookNamed` {: #hooknamed}

??? info "Source file, signature, and docstring"
    **Member**
    `TransactionStubBuilder.HookNamed(string processorName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionStubBuilder`
    
    **Source File** `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`
    
    **Signature**
    ```csharp
    public TransactionStubBuilder HookNamed(string processorName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Mocker transaction stub builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Transaction Stubs](../transaction-stubs.md)
