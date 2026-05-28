---
id: qaas.functions.builders.sessions.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, sessions, sections, configuration]
summary: "Reference page for Sessions: Configuration."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions: Configuration

> TL;DR — Reference page for Sessions: Configuration.

This page mirrors the `Configuration` section from [Sessions](../sessions.md).

## `WithTimeoutBefore` {: #withtimeoutbefore}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeoutAfter` {: #withtimeoutafter}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeZone` {: #withtimezone}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
