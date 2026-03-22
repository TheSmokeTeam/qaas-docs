# QaaS.Framework.Policies

`QaaS.Framework.Policies` contains the Framework solution's policy-chain implementation for repeated communication actions. The package is responsible for turning policy configuration objects into runtime policy instances and then executing those policies in a stable order.

## What this project contains

### Core policy chain

The chain model is implemented in:

- `Policy.cs`
- `PolicyBuilder.cs`
- `Policies.cs`

`Policy` is the runtime base for the chain. It exposes the mechanics for adding the next policy, preparing the chain, and executing it. `PolicyBuilder` is the configuration-to-runtime bridge. It accepts one concrete `IPolicyConfig` implementation at a time and builds the corresponding runtime policy instance.

### Simple policy implementations

The package contains three direct policy types for common control behavior:

- `CountPolicy.cs`
- `TimeoutPolicy.cs`
- `LoadBalancePolicy.cs`

These policies cover limiting execution by count, limiting it by time, and pacing it at a fixed rate.

### Advanced load-balance policies

The `AdvancedLoadBalance` folder contains:

- `AdvancedLoadBalancePolicy.cs`
- `IncreasingLoadBalancePolicy.cs`
- `LoadBalanceStage.cs`

This part of the project handles multi-stage and ramping load behavior. It is where the package models stage-by-stage execution rates and timed or count-based stage transitions.

### Configuration objects

The `ConfigurationObjects` folder contains the public configuration model used by the builder:

- `CountPolicyConfig.cs`
- `TimeoutPolicyConfig.cs`
- `LoadBalancePolicyConfig.cs`
- `IncreasingLoadBalancePolicyConfig.cs`
- `AdvancedLoadBalancePolicyConfig.cs`
- `IPolicyConfig.cs`

`AdvancedLoadBalancePolicyConfig` also defines `StageConfig`, which is the package's stage model. Each stage can define a `Rate`, `Amount`, `TimeoutMs`, and `TimeIntervalMs`.

### Exceptions and timing abstraction

The project also contains:

- `Exceptions/CountStop.cs`
- `Exceptions/TimeoutStop.cs`
- `Exceptions/StopAction.cs`
- `Extentions/Stopwatch/ITimer.cs`
- `Extentions/Stopwatch/Timer.cs`

These types support stop conditions and time-based execution without hard-coding the timing implementation everywhere.

## Current behavior

The current implementation behaves as follows:

- `PolicyBuilder.Configure(IPolicyConfig)` accepts a single concrete policy-config type and stores the matching configuration.
- `PolicyBuilder.Build()` fails if no supported config was supplied or if more than one config type was supplied at once.
- `PolicyBuilder.BuildPolicies()` chains multiple built policies together by repeatedly calling `Policy.Add(...)`.
- `Policy.Add(...)` preserves index-based ordering inside the chain.
- `Policy.RunChain()` executes the chain and converts `StopActionException`-based stop conditions into a `false` result instead of letting the exception escape as normal flow.
- `CountPolicy` stops after the configured number of actions.
- `TimeoutPolicy` stops after the configured timeout window.
- `LoadBalancePolicy` maintains a steady rate over the configured interval.
- `IncreasingLoadBalancePolicy` increases the rate only after the configured interval has elapsed.
- `AdvancedLoadBalancePolicy` executes staged load behavior and advances stages according to `Amount` or `TimeoutMs`, while protecting the final stage from overflowing into an invalid next stage.

## Main source areas

The most important files and folders in this package are:

- `Policy.cs`
- `PolicyBuilder.cs`
- `CountPolicy.cs`
- `TimeoutPolicy.cs`
- `LoadBalancePolicy.cs`
- `AdvancedLoadBalance/`
- `ConfigurationObjects/`
- `Exceptions/`
- `Extentions/Stopwatch/`

## Companion tests

`QaaS.Framework.Policies.Tests` is the sibling test project for this package.

The current tests cover:

- policy-chain ordering
- chain setup and execution flow
- count-based stopping
- timeout-based stopping
- stop-exception behavior
- builder mapping from config objects to runtime policy classes
- advanced stage progression and final-stage protection
- increasing-load timing behavior

Representative test files include:

- `PolicyBehaviorTests.cs`
- `LoadBalancePolicyTests.cs`
- `PolicyValidationCoverageTests.cs`
