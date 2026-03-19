# Stages in QaaS: Orchestrating Sequential & Parallel Test Execution

**Stages** in QaaS provide **fine-grained control over execution order**, enabling you to define **sequential
dependencies between test phases** while maximizing **parallelism within stages**. This ensures complex workflows
execute correctly—without blocking unnecessary work.

---

## Key Concepts

| Term                     | Meaning                                                                                                                                         |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Stage**                | A logical phase in a test execution. Actions and sessions are grouped by stage.                                                                 |
| **Parallel Execution**   | All actions or sessions within the same stage run **in parallel**.                                                                              |
| **Sequential Execution** | Stages run **in order**—a stage will not begin until **all actions or sessions in the previous stage have completed**.                          |
| `RunUntilStage`          | A configuration that defines **how far a session should progress**. If set to `2`, the session will execute up to and **not** including Stage 2 |

> **Default Behavior**:  
> If no `Stage` is explicitly set, a session is assigned the **index of its position** in the `Sessions` list (
> 0-based).  
> Example: First session → Stage 0, second → Stage 1, etc.

---

## Core Concept: Stages and Execution Order

In QaaS, **all actions within the same stage execute in parallel**. The execution of subsequent stages is **strictly
sequential**—a stage will not begin until **all actions in the preceding stage have completed**.

This model ensures:

- **No race conditions** between actions in different stages.
- **Guaranteed ordering** of phases (e.g., setup → test → cleanup).
- **Maximized throughput** by running independent actions in parallel within stages.

---

## Action Stages: Controlling Action Execution Order

Actions (such as Publishers, Consumers, MockerCommands, Probes, and Transactions) can be assigned to a specific **Stage
** using the `.AtStage(n)` method.

- **Within a stage**: All actions run **in parallel**.
- **Between stages**: Execution is **sequential and synchronized**—a stage will not start until all actions in the prior
  stage have finished.

> **Important**: Actions **do not support** the `RunUntilStage` configuration. They only participate in execution based
> on their assigned `Stage`.

### Example: Action Stages

```csharp
var sessionBuilder = executionBuilder.Sessions.AsSingle();

// Stage 0: Start service and send initial data
sessionBuilder
    .Named("StartService")
    .AtStage(0);

var kafkaPublisher = new PublisherBuilder()
    .Named("SendInitialData")
    .AtStage(0);

sessionBuilder.AddPublisher(kafkaPublisher);

// Stage 1: Validate data processing
sessionBuilder
    .Named("ValidateProcessing")
    .AtStage(1);

// Stage 2: Clean up
sessionBuilder
    .Named("Cleanup")
    .AtStage(2);
```

> **Execution Flow**:
>
> 1. `StartService` and `SendInitialData` run **in parallel** in Stage 0.
> 2. Only after both actions complete does Stage 1 begin.
> 3. `ValidateProcessing` runs in Stage 1.
> 4. Only after `ValidateProcessing` completes does Stage 2 begin.
> 5. `Cleanup` runs in Stage 2.
     > **Outcome**: Predictable, dependency-aware execution with no race conditions.

---

## Session Stages: Orchestrating Session-Level Execution

Sessions can also be assigned to a **Stage** using `.AtStage(n)`, which behaves identically to Action Stages in terms of
**execution ordering**:

- All sessions in the same stage run **in parallel**.
- A stage will not begin until **all sessions in the previous stage have completed**.

Additionally, sessions support the **`RunSessionUntilStage(n)`** builder method, which defines **how far a session
progresses** through the stage pipeline.

### How `RunUntilStage` Works

- A session will **only proceed to the next stage** if **all sessions in the previous stage that have a `RunUntilStage`
  value ≥ current stage** have completed.
- This enables **coordinated, multi-session workflows** where certain sessions may require additional time to complete
  before downstream stages can begin.

### Example: Multi-Session Workflow with `RunUntilStage`

```csharp
var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

// Session 1: Runs through Stage 2, but not beyond
var session1 = executionBuilder.Sessions.AsSingle();
session1
    .Named("SessionA")
    .AtStage(0)
    .RunSessionUntilStage(2); // Will run through Stage 2

// Session 2: Runs through Stage 3
var session2 = executionBuilder.Sessions.AsSingle();
session2
    .Named("SessionB")
    .AtStage(1)
    .RunSessionUntilStage(3); // Will run through Stage 3
```

> **Execution Flow**:
>
> 1. **Stage 0**: `SessionA` starts (Stage 0).
> 2. **Stage 1**: `SessionB` starts (Stage 1).
> 3. **Stage 2**: `SessionA` and `SessionB` continue to run.
> 4. **Stage 3**: **Only begins after both `SessionA` and `SessionB` have completed their respective `RunUntilStage`
     limits.**
>
> **Key Insight**:  
> Stage 3 cannot begin until **all sessions in Stage 2 with `RunUntilStage ≥ 3` have finished**.  
> In this case, `SessionB` is still running in Stage 2, so Stage 3 waits for it to complete.
>
> **Outcome**: Coordinated, dependency-aware orchestration across multiple sessions, ensuring that downstream stages
> only proceed when all relevant work is complete.

---

## Summary of Stage Behavior

| Component    | Stage Assignment | `RunUntilStage` Support | Execution Model                                                                        |
|--------------|------------------|-------------------------|----------------------------------------------------------------------------------------|
| **Actions**  | `.AtStage(n)`    | &#10006                 | Parallel within stage; sequential between stages                                       |
| **Sessions** | `.AtStage(n)`    | &#10004                 | Parallel within stage; sequential between stages; `RunUntilStage` controls progression |

> **Stages provide a unified, deterministic execution model**—ensuring that complex, multiphase tests run reliably,
> safely, and efficiently.