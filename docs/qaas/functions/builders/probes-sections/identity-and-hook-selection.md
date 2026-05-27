---
id: qaas.functions.builders.probes.sections.identity.and.hook.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, probes, sections, identity, and, hook, selection]
summary: "Reference page for Probes: Identity and hook selection."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Probes\ProbeBuilder.cs -->

# Probes: Identity and hook selection

> TL;DR — This page mirrors the `Identity and hook selection` section from [Probes](../probes.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner probe builder instance.

### `HookNamed` {: #hooknamed}

??? info "Source file, signature, and docstring"
    **Member**
    `ProbeBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `ProbeBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Probes/ProbeBuilder.cs`
    
    **Signature**
    ```csharp
    public ProbeBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Runner probe builder instance.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Probes](../probes.md)
