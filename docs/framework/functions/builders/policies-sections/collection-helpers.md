---
id: framework.functions.builders.policies.sections.collection.helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, policies, sections, collection, helpers]
summary: "Reference page for Policies: Collection helpers."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Policies\PolicyBuilder.cs -->

# Policies: Collection helpers

> TL;DR — Reference page for Policies: Collection helpers.

This page mirrors the `Collection helpers` section from [Policies](../policies.md).

## `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
