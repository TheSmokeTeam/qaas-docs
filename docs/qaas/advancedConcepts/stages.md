---
id: qaas.advancedconcepts.stages
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, advancedconcepts, stages]
summary: "Stages coordinate session ordering and action launch ordering, which are related but do not behave the same way."
---
# Stages in QaaS: Orchestrating Session and Action Execution

> TL;DR — Stages coordinate session ordering and action launch ordering, which are related but do not behave the same way.

**Stages** in QaaS provide **fine-grained control over execution order**, but the word **stage** is used in two different places:

- **session stages**, which coordinate whole [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md) against each other
- **action stages**, which coordinate [Publishers](../userInterfaces/runner/configurationSections/sessions/types/publishers.md), [Consumers](../userInterfaces/runner/configurationSections/sessions/types/consumers.md), [Probes](../userInterfaces/runner/configurationSections/sessions/types/probes.md), [Transactions](../userInterfaces/runner/configurationSections/sessions/types/transactions.md), and [Mocker Commands](../userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) inside one session

Those two systems are related, but they do **not** behave the same way.

---

## Key Concepts {: #key-concepts}

| Term | Meaning |
|------|---------|
| **Session Stage** | The stage that decides when a session starts relative to other sessions. |
| **Action Stage** | The stage assigned to an action inside one session. |
| **Parallel Start** | Sessions or actions in the same stage start together. |
| **Sequential Stage Order** | Stage numbers are processed in numeric order. |
| `RunUntilStage` | A session-level setting that decides which future session stage must wait for that session to finish. |

> **Default Behavior**:
> If no session stage is explicitly set, a session is assigned the **index of its position** in the [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md) list.
>
> In YAML, `Stage` and `RunUntilStage` are separate fields.
> In fluent code, `SessionBuilder.AtStage(n)` sets `Stage = n` and `RunUntilStage = n + 1`.

---

## Two Different Stage Systems {: #two-different-stage-systems}

The most important distinction is this:

- **session stages** are hard scheduling points in `SessionLogic`
- **action stages** are ordered launch groups inside one session, but they are **not** hard completion barriers

If you keep that distinction in mind, the rest of the behavior becomes predictable.

---

## Action Stages: Inside a Single Session {: #action-stages-inside-a-single-session}

Actions such as [Publishers](../userInterfaces/runner/configurationSections/sessions/types/publishers.md), [Consumers](../userInterfaces/runner/configurationSections/sessions/types/consumers.md), [MockerCommands](../userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md), [Probes](../userInterfaces/runner/configurationSections/sessions/types/probes.md), and [Transactions](../userInterfaces/runner/configurationSections/sessions/types/transactions.md) can be assigned to an action stage with `.AtStage(n)`.

What happens at runtime is:

- all actions in the **same action stage** start together
- action stages are **launched in numeric order**
- a later action stage can start **before** an earlier action stage has finished
- the session waits for **all action tasks** only after every configured action stage has been launched

!!! warning "Important"
    Actions do **not** support `RunUntilStage`.
    `StageConfig.TimeoutBefore` and `StageConfig.TimeoutAfter` add timing around a stage launch, but they do not turn action stages into hard completion barriers.

### Example: Assign Action Stages on Existing Builders {: #example-assign-action-stages-on-existing-builders}

```csharp
using QaaS.Framework.SDK.Extensions;
using QaaS.Runner;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Actions.Probes;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;

var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();
var sessionBuilder = (executionBuilder.Sessions ?? []).AsSingle();

var startService = (sessionBuilder.Probes ?? [])
    .Single(probe => probe.Name == "StartService")
    .Clone()
    .AtStage(0);
var sendInitialData = (sessionBuilder.Publishers ?? [])
    .Single(publisher => publisher.Name == "SendInitialData")
    .Clone()
    .AtStage(0);
var validateProcessing = (sessionBuilder.Consumers ?? [])
    .Single(consumer => consumer.Name == "ValidateProcessing")
    .Clone()
    .AtStage(1);
var cleanup = (sessionBuilder.Probes ?? [])
    .Single(probe => probe.Name == "Cleanup")
    .Clone()
    .AtStage(2);

sessionBuilder
    .UpdateProbe("StartService", startService)
    .UpdatePublisher("SendInitialData", sendInitialData)
    .UpdateConsumer("ValidateProcessing", validateProcessing)
    .UpdateProbe("Cleanup", cleanup);
```

### What Actually Happens with Action Stages {: #what-actually-happens-with-action-stages}

| Scenario | Actual behavior |
|----------|-----------------|
| Actions in the same action stage | They start in parallel. |
| Actions in different action stages | The later stage is launched later, but it can overlap still-running actions from earlier stages. |
| `StageConfig.TimeoutBefore` / `TimeoutAfter` | They delay launch timing around that stage number only. |
| Need a hard barrier between phases | Use separate [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md) and coordinate them with **session stages**, not action stages. |

So for the example above, the safe reading is:

1. `StartService` and `SendInitialData` start together in action stage `0`.
2. Action stage `1` is then launched in numeric order.
3. `ValidateProcessing` can start even if a stage `0` action is still running.
4. Action stage `2` is launched after that.
5. The session waits for every action task before the session itself completes.

That is why action stages are useful for ordering launches inside one session, but not for expressing "do not start the next phase until the previous phase is fully complete".

---

## Session Stages: Across Sessions {: #session-stages-across-sessions}

Session stages are the outer scheduling mechanism. This is where QaaS enforces the strict stage-to-stage orchestration.

At runtime:

- sessions are grouped by their `SessionStage`
- stages are processed in numeric order, even if the input list was unsorted
- before stage `N` starts, QaaS waits for any previously started sessions whose `RunUntilStage == N`
- sessions without `RunUntilStage` are materialized at the end of their own stage
- deferred sessions keep running and are materialized only when their target stage is reached

### What Happens in Each Session-Stage Scenario {: #what-happens-in-each-session-stage-scenario}

| Scenario | Actual behavior |
|----------|-----------------|
| Sessions in the same stage, no deferred blocker | They start together and the next stage sees their data only after both have finished. |
| Sessions in the same stage, one defers with `RunUntilStage` | They still start together, but the deferred session can overlap later stages until its target stage is reached. |
| Sessions in different stages | Lower stage numbers start first, regardless of declaration order. |
| A session blocks a later stage with `RunUntilStage` | Intermediate stages may run while that session is still active, but the target stage waits. |
| `RunUntilStage` points to a stage that never appears | QaaS drains that deferred session at the end of the run instead of dropping its data. |

### Example: Two Sessions with an Intermediate Overlap {: #example-two-sessions-with-an-intermediate-overlap}

```csharp
var sessionA = (executionBuilder.Sessions ?? [])
    .Single(session => session.Name == "SessionA")
    .Clone()
    .AtStage(0)
    .RunSessionUntilStage(2);

var sessionB = (executionBuilder.Sessions ?? [])
    .Single(session => session.Name == "SessionB")
    .Clone()
    .AtStage(1)
    .RunSessionUntilStage(3);

executionBuilder
    .UpdateSession("SessionA", sessionA)
    .UpdateSession("SessionB", sessionB);
```

### Exact Execution Flow {: #exact-execution-flow}

1. `SessionA` starts in session stage `0`.
2. `SessionB` starts in session stage `1`.
3. `SessionA` may still be running while stage `1` runs, because `SessionA` blocks stage `2`, not stage `1`.
4. Before stage `2` begins, QaaS waits for `SessionA`.
5. Before stage `3` begins, QaaS waits for `SessionB`.

The critical point is:

`RunUntilStage` does **not** mean "the session runs inside every stage up to that number".
It means "that future stage cannot begin until this session has finished".

### Sessions in the Same Stage {: #sessions-in-the-same-stage}

When two sessions share the same session stage:

- they are started together
- if neither is deferred, both results are materialized before the next stage begins
- if one of them is deferred to a later stage, only the non-deferred result is materialized at the end of the current stage, while the deferred session keeps running

### Sessions in Different Stages {: #sessions-in-different-stages}

When two sessions are assigned different session stages:

- QaaS always processes the lower stage first
- the later stage sees only the session results that have been materialized so far
- deferred sessions can still be running in the background while the intermediate stage starts

### Blocking a Later Stage with `RunUntilStage` {: #blocking-a-later-stage-with-rununtilstage}

This is the main use of `RunUntilStage`.

If a session starts in stage `0` and has `RunUntilStage = 2`:

- stage `1` can start while that session is still active
- stage `2` cannot start until that session has completed
- when stage `2` begins, the deferred session result is materialized into `ExecutionData.SessionDatas`

### Missing Target Stage {: #missing-target-stage}

If `RunUntilStage` points to a stage that never appears in the execution plan, QaaS still finalizes that session at the end of the run.

That means:

- the result is not lost
- the session still behaves like a deferred session during the run
- the final drain is effectively the fallback synchronization point

---

## Action Stages Versus Session Stages {: #action-stages-versus-session-stages}

| Component | Stage Assignment | `RunUntilStage` Support | What the stage controls |
|-----------|------------------|-------------------------|-------------------------|
| **Actions** | `.AtStage(n)` | &#10006 | Launch order inside one session |
| **Sessions** | YAML `Stage` / fluent `.AtStage(n)` | &#10004 | Start order across sessions, plus which future session stage must wait |

If you need **overlapping work inside one session**, use action stages.
If you need **hard phase boundaries**, use separate [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md) and coordinate them with session stages and `RunUntilStage`.

---

## Canonical Recipes {: #canonical-recipes}

### Recipe A: Single-session launch ordering with action stages {: #recipe-a-single-session-launch-ordering-with-action-stages}

Use this when one session needs to start a service, send data into it, then validate — in that launch order — but actions are allowed to overlap.

```yaml
Sessions:
  - Name: HttpSmoke
    Probes:
      - Name: StartService
        Probe: StartHttpServer
        Stage: 0
      - Name: WarmupPing
        Probe: PingProbe
        Stage: 1
    Publishers:
      - Name: SendInitialData
        Publisher: HttpPublisher
        Stage: 0
    Consumers:
      - Name: ValidateProcessing
        Consumer: HttpConsumer
        TimeoutMs: 5000
        Stage: 1
```

Behavior:

- Stage `0` launches `StartService` and `SendInitialData` together.
- Stage `1` launches `WarmupPing` and `ValidateProcessing` next, **even if** stage `0` actions are still running.
- Session completion waits for every action task; the order above is launch order, not completion order.

### Recipe B: Hard two-phase flow with two sessions and `RunUntilStage` {: #recipe-b-hard-two-phase-flow-with-two-sessions-and-rununtilstage}

Use this when phase 2 must **not** start until phase 1 has fully finished — a real barrier, not a launch ordering.

```yaml
Sessions:
  - Name: Seed
    Stage: 0
    RunUntilStage: 1
    Publishers:
      - Name: SeedDatabase
        Publisher: SqlPublisher

  - Name: Verify
    Stage: 1
    Consumers:
      - Name: ReadBack
        Consumer: SqlConsumer
        TimeoutMs: 5000
    Assertions:
      - Name: SeededRowsExist
        Assertion: HasMinimumRowCount
        SessionNames: [Verify]
        AssertionConfiguration:
          OutputName: SqlConsumer
          MinimumRows: 1
```

Behavior:

- `Seed` runs in stage `0` and blocks stage `1` (`RunUntilStage: 1`).
- `Verify` is scheduled for stage `1` but cannot start until `Seed` has completed.
- `Verify`'s consumer therefore sees a database that was fully seeded by the previous phase, with no overlap.

Pick Recipe A when overlap is acceptable. Pick Recipe B when phase isolation is a correctness requirement.

## See also {: #see-also}

- [QaaS Runner](../index.md)
