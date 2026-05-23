---
id: qaas.functions.builders.sessions.sections.probes
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, sessions, sections, probes]
summary: "Reference page for Sessions: Probes."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions: Probes

> TL;DR — This page mirrors the `Probes` section from [Sessions](../sessions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Sessions](../sessions.md)
