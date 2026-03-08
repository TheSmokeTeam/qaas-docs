# QaaS.Framework.Executions

The core execution engine of QaaS, responsible for orchestrating the lifecycle of test workflows (runners) and simulation workflows (mockers). It provides a modular architecture for defining, configuring, and running execution logic with dependency injection, configuration, logging, and data handling.

---

## **Purpose**

The primary goal of this project is to **abstract and standardize the execution lifecycle** of QaaS workflows. It
enables developers to:

- Define execution logic in a reusable, composable way.
- Configure data sources dynamically.
- Control execution behavior based on context (e.g., test vs. mock mode).
- Integrate with external configuration and logging systems.
- Build and load execution runners based on command-line or configuration inputs.

---

## **Core Components**

### `IRunner` – The Execution Entry Point

```csharp
public interface IRunner
{
    public void Run();
}
```

- **Purpose**: Defines the contract for any executable entity (e.g., a test runner, data generator, or mock server).
- **Role**: Acts as the entry point for starting an execution. The `Run()` method triggers the full execution flow.
- **Extensibility**: Concrete implementations (e.g., `Runner`, `Mocker`) inherit from this interface and define
  their own behavior.

---

### `BaseExecutionBuilder<TContext, TExecutionData>` – Execution Configuration Builder

This abstract class is responsible for **building execution instances** with configurable components.

#### Key Features

- **Generic Design**: `TContext` and `TExecutionData` allow type-safe context and data modeling.
- **Data Sources**:

  ```csharp
  public DataSourceBuilder[] DataSources { get; set; } = [];
  ```

  - Configures data sources (e.g., databases, APIs, files) used during execution.
  - Validated via attributes like `[UniquePropertyInEnumerable]` and
      `[AllItemsInEnumerablePropertyInEnumerableExistAsPropertyInEnumerable]`.
- **Abstract Method**:

  ```csharp
  protected abstract IEnumerable<DataSource> BuildDataSources();
  ```

  - Allows subclasses to define how data sources are instantiated.
- **Build Method**:

  ```csharp
  public abstract BaseExecution Build();
  ```

  - Returns a configured `BaseExecution` instance, encapsulating the full execution context and logic.

> **Usage Pattern**: Subclasses (e.g., `ExecutionBuilder`) override `BuildDataSources()` and `Build()` to create
> specific execution flows.

---

### `BaseExecution` – The Execution Runtime Base

```csharp
public abstract class BaseExecution : IDisposable
{
    protected Context Context { get; set; } = null!;
    protected ExecutionType Type { get; set; }
    
    public abstract int Start();
    public abstract void Dispose();
}
```

- **Purpose**: Represents the runtime state and behavior of an execution.
- **Key Properties**:
  - `Context`: Holds shared state and data during execution.
  - `Type`: Specifies the execution mode (e.g., `Test`, `Mock`, `Validation`), used to control logic flow.
- **Core Methods**:
  - `Start()`: Begins the execution process and returns an exit code (e.g., 0 for success).
  - `Dispose()`: Ensures proper cleanup of resources (e.g., connections, files).

> **Lifecycle**: Built via `BaseExecutionBuilder`, then `Start()` is called to run the logic.

---

### `ILogic` – Composable Execution Logic

```csharp
public interface ILogic
{
    bool ShouldRun(ExecutionType executionType);
    ExecutionData Run(ExecutionData executionData);
}
```

- **Purpose**: Encapsulates individual units of logic.
- **Two Key Methods**:
  - `ShouldRun(ExecutionType)`: Determines if this logic should execute based on the current mode (e.g., assertions
      not running in act mode).
  - `Run(ExecutionData)`: Executes the logic and modifies the `ExecutionData` (e.g., adding results, metadata).

---

### `BaseLoader<TOptions, TRunner>` – Runner Loader & Configuration Resolver

This abstract class is responsible for **loading and initializing a runner** based on provided options.

#### Key Responsibilities

- **Option Validation**: Uses `ValidationUtils.TryValidateObjectRecursive()` to ensure command-line or config inputs are
  valid.
- **Logger Setup**:
  - Supports both **default console logging** and **custom configuration files (YAML)**.
  - Can override log levels via the `--logger-level` flag.
- **Dependency Injection**: Injects `TOptions` and `ILogger` into the loader.
- **Abstract Method**:

  ```csharp
  public abstract TRunner GetLoadedRunner();
  ```

  - Subclasses (e.g., `TestRunnerLoader`) implement this to instantiate and return the correct `IRunner`.

---

## **Execution Flow (High-Level)**

1. **CLI Input** → Parsed via `ParserBuilder`.
2. **Options Loaded** → Validated by `BaseLoader<TOptions, TRunner>`.
3. **Logger Configured** → Based on `--logger-level` and/or `--logger-configuration-file`.
4. **Builder Instantiated** → `BaseExecutionBuilder<TContext, TExecutionData>` creates execution context and data
   sources.
5. **Execution Built** → `Build()` returns a `BaseExecution` instance.
6. **Logic Pipeline Executed** → `ShouldRun()` filters logic; `Run()` executes each logic step.
7. **Start() Called** → Execution begins, returns exit code.
8. **Dispose() Called** → Resources cleaned up.
