---
id: framework.functions.builders.policies
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, policies]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.Policies\PolicyBuilder.cs -->

# Policies

> TL;DR — This page lists the public Framework functions in the `Policies` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Configuration {: #configuration}

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

## Collection helpers {: #collection-helpers}

### `UpdateConfiguration` {: #updateconfiguration}

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

## General {: #general}

### `Configure` {: #configure}

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

### `Build` {: #build}

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

### `BuildPolicies` {: #buildpolicies}

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
