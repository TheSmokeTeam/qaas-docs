---
id: framework.functions.builders.policies.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, policies, sections, general]
summary: "Reference page for Policies: General."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Policies\PolicyBuilder.cs -->

# Policies: General

> TL;DR — Reference page for Policies: General.

This page mirrors the `General` section from [Policies](../policies.md).

## `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.Configure(IPolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder Configure(IPolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Build` {: #build}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public Policy Build()
    ```
    
    **Docstring**
    
    Builds the configured Framework policy builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## `BuildPolicies` {: #buildpolicies}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.BuildPolicies(PolicyBuilder[]? policyBuilders)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public static Policy? BuildPolicies(PolicyBuilder[]? policyBuilders)
    ```
    
    **Docstring**
    
    Builds a policy chain from the supplied policy builder collection.
    
    This helper lets callers collapse several fluent policy builders into the policy chain consumed by the runtime configuration surface.

## See also {: #see-also}

- [Framework Functions](../index.md)
