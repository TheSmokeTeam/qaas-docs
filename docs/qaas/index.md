# QaaS Runner

**QaaS.Runner** is the execution engine of the QaaS ecosystem. It loads YAML- or code-based test configuration, runs setup and cleanup hooks, drives protocol sessions against the system under test, stores the resulting session data, evaluates assertions, and writes [Allure]({{ links.allure_docs }}) results.

|             |                                                   |
| ----------- | ------------------------------------------------- |
| **Runtime** | .NET 10                                           |
| **Package** | `QaaS.Runner` (NuGet)                             |
| **Source**  | [Repository - QaaS.Runner]({{ links.repository_runner }}) |

## Key Capabilities

- **YAML and code configuration** - keep the execution in `test.qaas.yaml`, build it in C#, or combine both.
- **Multi-stage execution** - run probes, publishers, consumers, transactions, collectors, and mocker commands as part of one execution graph.
- **Protocol abstraction** - test HTTP, messaging, storage-backed, and other protocol flows through the same session model.
- **Hook ecosystem** - plug in generators, assertions, probes, and custom hooks from the project or from shared packages.
- **Report output** - persist execution results and render pass/fail status into Allure-compatible output.
- **Composable tests** - split reusable data, sessions, assertions, and overrides instead of encoding everything into one file.
