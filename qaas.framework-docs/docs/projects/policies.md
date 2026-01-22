# QaaS.Framework.Policies

This package defines a flexible policy system that governs the execution behavior of communication actions within the
QaaS ecosystem.

Policies are rules applied to communication actions to modify their execution pattern, enabling advanced control over
repetition, timing, and load distribution.

---

## Usage Context

This functionality is used across the entire QaaS ecosystem. Policies are configured under:

```plaintext
Sessions[].<CommunicationActionArray>.Policies[]
```

---

## Policy Types

### `Timeout`

Sets a maximum duration for the repeated execution of an action.

- **Property Path**: `Sessions[].<CommunicationActionArray>.Policies[].Timeout`
- **YAML Example**:

  ```yaml
  Type: Timeout
  Timeout: {}
  ```

---

### `LoadBalance`

Controls the rate at which an action is executed, maintaining a steady load.

- **Property Path**: `Sessions[].<CommunicationActionArray>.Policies[].LoadBalance`
- **YAML Example**:

  ```yaml
  Type: LoadBalance
  LoadBalance: {}
  ```

---

### `AdvancedLoadBalance`

Provides multi-stage, fine-grained control over execution rate over time.

- **Property Path**: `Sessions[].<CommunicationActionArray>.Policies[].AdvancedLoadBalance`
- **YAML Example**:

  ```yaml
  Type: AdvancedLoadBalance
  AdvancedLoadBalance: {}
  ```

---

### `IncreasingLoadBalance`

Gradually increases the execution rate of an action over time (e.g., for ramp-up testing).

- **Property Path**: `Sessions[].<CommunicationActionArray>.Policies[].IncreasingLoadBalance`
- **YAML Example**:

  ```yaml
  Type: IncreasingLoadBalance
  IncreasingLoadBalance: {}
  ```
