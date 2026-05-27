# Probes: Identity and hook selection

This page mirrors the `Identity and hook selection` section from [Probes](../probes.md).

## `Named`

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
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `HookNamed`

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
    
    Use this method when working with the documented Runner probe builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
