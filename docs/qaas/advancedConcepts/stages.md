# Stages in QaaS: Orchestrating Session and Action Execution

**Stages** in QaaS provide **fine-grained control over execution order**, but the word **stage** is used in two different places:

- **session stages**, which coordinate whole sessions against each other
- **action stages**, which coordinate publishers, consumers, probes, transactions, and mocker commands inside one session

Those two systems are related, but they do **not** behave the same way.

---

## Key Concepts

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

## Two Different Stage Systems

The most important distinction is this:

- **session stages** are hard scheduling points in `SessionLogic`
- **action stages** are ordered launch groups inside one session, but they are **not** hard completion barriers

If you keep that distinction in mind, the rest of the behavior becomes predictable.

---

## Action Stages: Inside a Single Session

Actions such as [Publishers](../userInterfaces/runner/configurationSections/sessions/types/publishers.md), [Consumers](../userInterfaces/runner/configurationSections/sessions/types/consumers.md), [MockerCommands](../userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md), [Probes](../userInterfaces/runner/configurationSections/sessions/types/probes.md), and [Transactions](../userInterfaces/runner/configurationSections/sessions/types/transactions.md) can be assigned to an action stage with `.AtStage(n)`.

What happens at runtime is:

- all actions in the **same action stage** start together
- action stages are **launched in numeric order**
- a later action stage can start **before** an earlier action stage has finished
- the session waits for **all action tasks** only after every configured action stage has been launched

!!! warning "Important"
    Actions do **not** support `RunUntilStage`.
    `StageConfig.TimeoutBefore` and `StageConfig.TimeoutAfter` add timing around a stage launch, but they do not turn action stages into hard completion barriers.

### Example: Assign Action Stages on Existing Builders

```csharp
using QaaS.Framework.SDK.Extensions;

var sessionBuilder = executionBuilder.ReadSessions().AsSingle();

sessionBuilder
    .UpdateProbe("StartService", probe => probe.AtStage(0))
    .UpdatePublisher("SendInitialData", publisher => publisher.AtStage(0))
    .UpdateConsumer("ValidateProcessing", consumer => consumer.AtStage(1))
    .UpdateProbe("Cleanup", probe => probe.AtStage(2));
```

### What Actually Happens with Action Stages

| Scenario | Actual behavior |
|----------|-----------------|
| Actions in the same action stage | They start in parallel. |
| Actions in different action stages | The later stage is launched later, but it can overlap still-running actions from earlier stages. |
| `StageConfig.TimeoutBefore` / `TimeoutAfter` | They delay launch timing around that stage number only. |
| Need a hard barrier between phases | Use separate sessions and coordinate them with **session stages**, not action stages. |

So for the example above, the safe reading is:

1. `StartService` and `SendInitialData` start together in action stage `0`.
2. Action stage `1` is then launched in numeric order.
3. `ValidateProcessing` can start even if a stage `0` action is still running.
4. Action stage `2` is launched after that.
5. The session waits for every action task before the session itself completes.

That is why action stages are useful for ordering launches inside one session, but not for expressing "do not start the next phase until the previous phase is fully complete".

---

## Session Stages: Across Sessions

Session stages are the outer scheduling mechanism. This is where QaaS enforces the strict stage-to-stage orchestration.

At runtime:

- sessions are grouped by their `SessionStage`
- stages are processed in numeric order, even if the input list was unsorted
- before stage `N` starts, QaaS waits for any previously started sessions whose `RunUntilStage == N`
- sessions without `RunUntilStage` are materialized at the end of their own stage
- deferred sessions keep running and are materialized only when their target stage is reached

### What Happens in Each Session-Stage Scenario

| Scenario | Actual behavior |
|----------|-----------------|
| Sessions in the same stage, no deferred blocker | They start together and the next stage sees their data only after both have finished. |
| Sessions in the same stage, one defers with `RunUntilStage` | They still start together, but the deferred session can overlap later stages until its target stage is reached. |
| Sessions in different stages | Lower stage numbers start first, regardless of declaration order. |
| A session blocks a later stage with `RunUntilStage` | Intermediate stages may run while that session is still active, but the target stage waits. |
| `RunUntilStage` points to a stage that never appears | QaaS drains that deferred session at the end of the run instead of dropping its data. |

### Example: Two Sessions with an Intermediate Overlap

```csharp
executionBuilder.UpdateSession(
    "SessionA",
    session => session
        .AtStage(0)
        .RunSessionUntilStage(2));

executionBuilder.UpdateSession(
    "SessionB",
    session => session
        .AtStage(1)
        .RunSessionUntilStage(3));
```

### Exact Execution Flow

1. `SessionA` starts in session stage `0`.
2. `SessionB` starts in session stage `1`.
3. `SessionA` may still be running while stage `1` runs, because `SessionA` blocks stage `2`, not stage `1`.
4. Before stage `2` begins, QaaS waits for `SessionA`.
5. Before stage `3` begins, QaaS waits for `SessionB`.

The critical point is:

`RunUntilStage` does **not** mean "the session runs inside every stage up to that number".
It means "that future stage cannot begin until this session has finished".

### Sessions in the Same Stage

When two sessions share the same session stage:

- they are started together
- if neither is deferred, both results are materialized before the next stage begins
- if one of them is deferred to a later stage, only the non-deferred result is materialized at the end of the current stage, while the deferred session keeps running

### Sessions in Different Stages

When two sessions are assigned different session stages:

- QaaS always processes the lower stage first
- the later stage sees only the session results that have been materialized so far
- deferred sessions can still be running in the background while the intermediate stage starts

### Blocking a Later Stage with `RunUntilStage`

This is the main use of `RunUntilStage`.

If a session starts in stage `0` and has `RunUntilStage = 2`:

- stage `1` can start while that session is still active
- stage `2` cannot start until that session has completed
- when stage `2` begins, the deferred session result is materialized into `ExecutionData.SessionDatas`

### Missing Target Stage

If `RunUntilStage` points to a stage that never appears in the execution plan, QaaS still finalizes that session at the end of the run.

That means:

- the result is not lost
- the session still behaves like a deferred session during the run
- the final drain is effectively the fallback synchronization point

---

## Action Stages Versus Session Stages

| Component | Stage Assignment | `RunUntilStage` Support | What the stage controls |
|-----------|------------------|-------------------------|-------------------------|
| **Actions** | `.AtStage(n)` | &#10006 | Launch order inside one session |
| **Sessions** | YAML `Stage` / fluent `.AtStage(n)` | &#10004 | Start order across sessions, plus which future session stage must wait |

If you need **overlapping work inside one session**, use action stages.
If you need **hard phase boundaries**, use separate sessions and coordinate them with session stages and `RunUntilStage`.
