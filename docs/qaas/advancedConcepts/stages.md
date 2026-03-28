# Stages in QaaS: Orchestrating Sequential & Parallel Test Execution

**Stages** in QaaS provide **fine-grained control over execution order** inside [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md), enabling you to define **sequential dependencies between test phases** while maximizing **parallelism within stages**. This ensures complex workflows execute correctly without blocking unnecessary work.

---

## Key Concepts

| Term | Meaning |
|------|---------|
| **Stage** | A logical phase in a test execution. Actions and sessions are grouped by stage. |
| **Parallel Execution** | All actions or sessions within the same stage run **in parallel**. |
| **Sequential Execution** | Stages run **in order**. A stage does not begin until every blocker for that stage has completed. |
| `RunUntilStage` | The stage that must wait for a session to finish. If a session starts in Stage 0 and `RunUntilStage` is `2`, the session can continue while Stage 1 runs, but it must finish before Stage 2 begins. |

> **Default Behavior**:
> If no `Stage` is explicitly set, a session is assigned the **index of its position** in the [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md) list (0-based).
> Example: first session -> Stage 0, second -> Stage 1, and so on.
>
> When you call `.AtStage(n)` on a session builder, QaaS also sets `RunUntilStage` to `n + 1`.

---

## Core Concept: Stages and Execution Order

In QaaS, **all actions within the same stage execute in parallel**. The execution of later stages is **strictly sequential** - a stage does not begin until everything that must complete before that stage has finished.

This model ensures:

- **No race conditions** between actions in different stages.
- **Guaranteed ordering** of phases such as setup -> test -> cleanup.
- **Maximized throughput** by running independent work in parallel within the same stage.

---

## Action Stages: Controlling Action Execution Order

Actions such as [Publishers](../userInterfaces/runner/configurationSections/sessions/types/publishers.md), [Consumers](../userInterfaces/runner/configurationSections/sessions/types/consumers.md), [MockerCommands](../userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md), [Probes](../userInterfaces/runner/configurationSections/sessions/types/probes.md), and [Transactions](../userInterfaces/runner/configurationSections/sessions/types/transactions.md) can be assigned to a specific `Stage` using the `.AtStage(n)` method.

- **Within a stage**: all actions run **in parallel**.
- **Between stages**: execution is **sequential and synchronized** - a later stage does not start until the earlier stage has finished.

> **Important**: Actions **do not support** `RunUntilStage`. They participate only by their assigned `Stage`.

### Example: Action Stages

```csharp
using System.Linq;

var sessionBuilder = executionBuilder.ReadSessions().Single();

// Assume these actions already exist on the session.
// Only the stage assignments are shown here.
sessionBuilder
    .UpdateProbe("StartService", probe => probe.AtStage(0))
    .UpdatePublisher("SendInitialData", publisher => publisher.AtStage(0))
    .UpdateConsumer("ValidateProcessing", consumer => consumer.AtStage(1))
    .UpdateProbe("Cleanup", probe => probe.AtStage(2));
```

> **Execution Flow**:
>
> 1. `StartService` and `SendInitialData` run **in parallel** in Stage 0.
> 2. Only after both actions complete does Stage 1 begin.
> 3. `ValidateProcessing` runs in Stage 1.
> 4. Only after `ValidateProcessing` completes does Stage 2 begin.
> 5. `Cleanup` runs in Stage 2.
>
> **Outcome**: Predictable, dependency-aware execution with no race conditions.

---

## Session Stages: Orchestrating Session-Level Execution

Sessions can also be assigned to a `Stage` using `.AtStage(n)`. That controls **when the session starts**.

- All sessions in the same stage start **in parallel**.
- A later stage does not begin until its blockers have completed.

Sessions additionally support `RunSessionUntilStage(n)`, which controls **which later stage must wait for that session to finish**.

### How `RunUntilStage` Works

- A session starts in its own `Stage`.
- If `RunUntilStage` is set to a later stage, the session can continue running while intermediate stages start.
- When the target stage is about to begin, QaaS waits for that session to finish and only then continues.

This enables coordinated multi-session workflows where some sessions can overlap other stages, but still block a later stage that depends on their completion.

### Example: Multi-Session Workflow with `RunUntilStage`

```csharp
using System.Linq;

var sessions = executionBuilder.ReadSessions();

// Assume SessionA and SessionB already exist on the execution.
sessions.Single(session => session.Name == "SessionA")
    .AtStage(0)
    .RunSessionUntilStage(2);

sessions.Single(session => session.Name == "SessionB")
    .AtStage(1)
    .RunSessionUntilStage(3);
```

> **Execution Flow**:
>
> 1. **Stage 0**: `SessionA` starts.
> 2. **Stage 1**: `SessionB` starts, while `SessionA` may still be running because `SessionA` blocks Stage 2, not Stage 1.
> 3. **Before Stage 2 begins**: QaaS waits for `SessionA` because `SessionA.RunUntilStage == 2`.
> 4. **Before Stage 3 begins**: QaaS waits for `SessionB` because `SessionB.RunUntilStage == 3`.
>
> **Key Insight**:
> `RunUntilStage` does not mean "the session runs inside that stage".
> It means "that stage cannot begin until the session has finished".
>
> **Outcome**: Coordinated, dependency-aware orchestration across multiple sessions, ensuring that downstream stages only proceed when the relevant earlier work is actually complete.

---

## Summary of Stage Behavior

| Component | Stage Assignment | `RunUntilStage` Support | Execution Model |
|-----------|------------------|-------------------------|-----------------|
| **Actions** | `.AtStage(n)` | &#10006 | Parallel within stage; sequential between stages |
| **Sessions** | `.AtStage(n)` | &#10004 | Parallel within stage; sequential between stages; `RunUntilStage` controls which later stage must wait |

> **Stages provide a unified, deterministic execution model** - ensuring that complex, multiphase tests run reliably, safely, and efficiently.
