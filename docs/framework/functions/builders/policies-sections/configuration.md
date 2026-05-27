---
id: framework.functions.builders.policies.sections.configuration
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, policies, sections, configuration]
summary: "Reference page for Policies: Configuration."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Policies\PolicyBuilder.cs -->

# Policies: Configuration

> TL;DR: Reference page for Policies: Configuration.

This page mirrors the `Configuration` section from [Policies](../policies.md).

## `WithCount` {: #withcount}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.WithCount(CountPolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder WithCount(CountPolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the count policy configuration on the current Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeout` {: #withtimeout}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.WithTimeout(TimeoutPolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder WithTimeout(TimeoutPolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the timeout policy configuration on the current Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithLoadBalance` {: #withloadbalance}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.WithLoadBalance(LoadBalancePolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder WithLoadBalance(LoadBalancePolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the load-balance policy configuration on the current Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithIncreasingLoadBalance` {: #withincreasingloadbalance}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.WithIncreasingLoadBalance(IncreasingLoadBalancePolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder WithIncreasingLoadBalance(IncreasingLoadBalancePolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the increasing load-balance policy configuration on the current Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithAdvancedLoadBalance` {: #withadvancedloadbalance}

??? info "Source file, signature, and docstring"
    **Member**
    `PolicyBuilder.WithAdvancedLoadBalance(AdvancedLoadBalancePolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`
    
    **Signature**
    ```csharp
    public PolicyBuilder WithAdvancedLoadBalance(AdvancedLoadBalancePolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the advanced load-balance policy configuration on the current Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
