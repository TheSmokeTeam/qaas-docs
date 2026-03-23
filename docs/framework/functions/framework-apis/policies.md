<!-- generated hash:9655015db563 sources:Framework, functions, Framework APIs, Policies -->

# Policies

Source-driven reference for `Framework` functions in the `Framework APIs / Policies` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `PolicyBuilder.Configure(IPolicyConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Location** `QaaS.Framework.Policies/PolicyBuilder.cs:38`
    
    **Signature**
    ```csharp
    public PolicyBuilder Configure(IPolicyConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Framework policy builder instance.
    
    Use this method when working with the documented Framework policy builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Build`

??? info "Location, signature, and docstring"
    **Member**
    `PolicyBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Location** `QaaS.Framework.Policies/PolicyBuilder.cs:72`
    
    **Signature**
    ```csharp
    public Policy Build()
    ```
    
    **Docstring**
    
    Builds the configured Framework policy builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## `BuildPolicies`

??? info "Location, signature, and docstring"
    **Member**
    `PolicyBuilder.BuildPolicies(PolicyBuilder[]? policyBuilders)`
    
    **Kind** `function`
    
    **Declaring Type** `PolicyBuilder`
    
    **Location** `QaaS.Framework.Policies/PolicyBuilder.cs:109`
    
    **Signature**
    ```csharp
    public static Policy? BuildPolicies(PolicyBuilder[]? policyBuilders)
    ```
    
    **Docstring**
    
    Builds a policy chain from the supplied policy builder collection.
    
    This helper lets callers collapse several fluent policy builders into the policy chain consumed by the runtime configuration surface.
