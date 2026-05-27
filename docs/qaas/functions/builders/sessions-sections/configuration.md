# Sessions: Configuration

This page mirrors the `Configuration` section from [Sessions](../sessions.md).

## `WithTimeoutBefore`

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

## `WithTimeoutAfter`

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

## `WithTimeZone`

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
