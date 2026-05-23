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

> TL;DR — This page mirrors the `Configuration` section from [Policies](../policies.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithCount` {: #withcount}

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

### `WithTimeout` {: #withtimeout}

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

### `WithLoadBalance` {: #withloadbalance}

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

### `WithIncreasingLoadBalance` {: #withincreasingloadbalance}

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

### `WithAdvancedLoadBalance` {: #withadvancedloadbalance}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Policies](../policies.md)
