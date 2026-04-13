# Policies

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Configuration

### `WithCount`

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

### `WithTimeout`

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

### `WithLoadBalance`

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

### `WithIncreasingLoadBalance`

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

### `WithAdvancedLoadBalance`

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

## Collection helpers

### `UpdateConfiguration`

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

## General

### `Configure`

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

### `Build`

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

### `BuildPolicies`

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
