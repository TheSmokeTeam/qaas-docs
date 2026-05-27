---
id: qaas.functions.builders.storages
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, storages]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Storage\StorageBuilder.cs -->

# Storages

> TL;DR — This page lists the public Runner functions in the `Storages` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Storages {: #storages_1}

### `WithJsonStorageFormat` {: #withjsonstorageformat}

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.WithJsonStorageFormat(Formatting format)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder WithJsonStorageFormat(Formatting format)
    ```
    
    **Docstring**
    
    Sets the JSON formatting used by runtime storages.

## Collection helpers {: #collection-helpers}

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner storage builder instance.

## General {: #general}

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `StorageBuilder.Configure(IStorageConfig storageConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `StorageBuilder`
    
    **Source File** `QaaS.Runner.Storage/StorageBuilder.cs`
    
    **Signature**
    ```csharp
    public StorageBuilder Configure(IStorageConfig storageConfig)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner storage builder instance.

## See also {: #see-also}

- [Runner Functions](../index.md)
