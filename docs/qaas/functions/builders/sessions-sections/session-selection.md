---
id: qaas.functions.builders.sessions.sections.session.selection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, sessions, sections, session, selection]
summary: "Reference page for Sessions: Session selection."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Session\Builders\SessionBuilderLogic.cs -->

# Sessions: Session selection

> TL;DR: Reference page for Sessions: Session selection.

This page mirrors the `Session selection` section from [Sessions](../sessions.md).

## `RunSessionUntilStage` {: #runsessionuntilstage}

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
