# Sessions: Probes

This page mirrors the `Probes` section from [Sessions](../sessions.md).

## `AddProbe`

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateProbe`

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveProbe`

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RemoveProbeAt`

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
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
