# Policies: Collection helpers

This page mirrors the `Collection helpers` section from [Policies](../policies.md).

## `UpdateConfiguration`

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
