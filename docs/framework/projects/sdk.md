# QaaS.Framework.SDK

The `QaaS.Framework.SDK` is a C# package used throughout the projects in the `QaaS` ecosystem. It provides all core QaaS objects and functionalities.
Any **Plugin** written for `QaaS` must use the `QaaS.Framework.SDK` to integrate with the QaaS framework.

---

## Data Structures

The `QaaS.Framework.SDK` contains the following data structures used in its `Hook` interfaces.

### `Context`

Data structure used by `Hooks` and QaaS internals, containing the current QaaS execution context:

| Property                 | Description                                                                              |
|--------------------------|------------------------------------------------------------------------------------------|
| `Logger`                 | A logger for QaaS' internals and `Hooks`                                                 |
| `RootConfiguration`      | The root of the configuration provided during QaaS execution                             |
| `CaseName`               | The name of the test case this context was created for                                   |
| `ExecutionId`            | The unique ID of the execution session                                                   |
| `CurrentRunningSessions` | An object providing access to all currently running sessions and their live data results |

---

### `Data`

Represents a single I/O operation in the application.

| Property   | Description                                                               |
|------------|---------------------------------------------------------------------------|
| `Body`     | The actual I/O data payload                                               |
| `MetaData` | Protocol-specific metadata (e.g., HTTP status code, RabbitMQ routing key) |

---

### `CommunicationData`

Represents the result of a communication action.

| Property | Description                                                  |
|----------|--------------------------------------------------------------|
| `Name`   | The name of the communication action that produced this data |
| `Data`   | The result data from the communication action                |

---

### `SessionData`

Contains the results of a completed session.

| Property          | Description                                                        |
|-------------------|--------------------------------------------------------------------|
| `Name`            | The name of the session                                            |
| `Inputs`          | List of `CommunicationData` representing all input communications  |
| `Outputs`         | List of `CommunicationData` representing all output communications |
| `SessionFailures` | List of action failures encountered during session execution       |
| `UtcStartTime`    | UTC start time of the session                                      |
| `UtcEndTime`      | UTC end time of the session                                        |

---

### `RunningSessionData`

Contains real-time (live) results of a currently running session.

| Property  | Description                                                |
|-----------|------------------------------------------------------------|
| `Inputs`  | List of `RunningCommunicationData` for live input results  |
| `Outputs` | List of `RunningCommunicationData` for live output results |

---

### `RunningCommunicationData`

Represents an action currently in progress.

| Property                      | Description                                                                         |
|-------------------------------|-------------------------------------------------------------------------------------|
| `Data`                        | Internal real-time data (should not be accessed directly by users)                  |
| `DataCancellationTokenSource` | Cancellation token for the live data stream; if canceled, the action will terminate |
| `GetData`                     | Lazy function to retrieve all data produced by the communication action             |
| `GetLiveData`                 | Lazy function to retrieve data produced *after* the call is made                    |

---

### `DataSource`

Contains all required objects to retrieve data from a configured data source.

> Used internally to manage data retrieval logic for plugins and hooks.

---

## Hooks

The `QaaS.Framework.SDK` provides **four core hooks**, each with an interface and a base class.
The **interface** defines the contract, while the **base class** adds automatic configuration loading and validation.

Hooks are located in the namespace: `QaaS.Framework.SDK.Hooks`.

---

### Assertion Hook

- **Interface**: `IAssertion`
- **Base Class**: `BaseAssertion<TConfiguration>`

#### Properties

| Property               | Description                                                                                                                                                                                                                                                                     |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `AssertionMessage`     | Message displayed with the assertion result                                                                                                                                                                                                                                     |
| `AssertionTrace`       | Additional trace information for debugging                                                                                                                                                                                                                                      |
| `AssertionStatus`      | Final status of the assertion (e.g., `Pass`, `Fail`, `Warning`). Takes precedence over return value                                                                                                                                                                             |
| `AssertionAttachments` | List of `AssertionAttachment` objects to store with the result. Each attachment has: <br> - `Path`: Unique relative path in the test results directory <br> - `Data`: The actual data to store <br> - `SerializationType`: How to serialize the data (e.g., JSON, Binary, Text) |

---

### Generator Hook

- **Interface**: `IGenerator`
- **Base Class**: `BaseGenerator<TConfiguration>`

---

### Probe Hook

- **Interface**: `IProbe`
- **Base Class**: `BaseProbe<TConfiguration>`

---

### Processor Hook

- **Interface**: `IProcessor`
- **Base Class**: `BaseProcessor<TConfiguration>`

---

## Extensions

The `QaaS.Framework.SDK` includes extension methods to simplify working with data structures in hooks.

Available in the namespace: `QaaS.Framework.SDK.Extensions`

### Example Usage

```csharp
// Get the correct output from the single passed session by name and cast it to the expected type
var output = sessionDataList.AsSingle().GetOutputByName(Configuration.OutputName!).CastCommunicationData<TExpectedOutputType>();
```
