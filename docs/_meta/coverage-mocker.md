# QaaS Mocker — Surface Coverage Map

Read-only enumeration of public interfaces, extension points, YAML schema, and built-in implementations for the QaaS.Mocker runtime.

**Date**: 2026-05-22  
**Scope**: QaaS.Mocker, Qaas.Mocker.CommunicationObjects, QaaS.Mocker.Template, DummyAppMock  
**Method**: Static analysis via grep + code read.

---

## 1. Mocker — Extension Points

| Interface | Namespace | Purpose | Test Author Implements |
|---|---|---|---|
| IServer | QaaS.Mocker.Servers.Servers | Concrete mock server transport (HTTP, gRPC, Socket) | No |
| IServerState | QaaS.Mocker.Servers.ServerStates | Mutable runtime behavior: action queries, stub rebinding, cache access | No |
| ICache | QaaS.Mocker.Servers.Caches | Input/output data collection contract | Rarely |
| BaseCache<TInput> | QaaS.Mocker.Servers.Caches | Abstract base for custom data collection | Yes — for custom telemetry |
| IController | QaaS.Mocker.Controller.Controllers | Long-running control-plane listener | No |
| BaseTransactionProcessor<TConfiguration> | QaaS.Framework.SDK.Hooks.Processor | Response materialisation logic. Core extension point. | **Yes — PRIMARY** |
| BaseActionToStub<TStub> | QaaS.Mocker.Servers.Actions | Maps incoming actions to stubs | Rarely |
| IExecutionBuilderConfigurator | QaaS.Mocker | Fluent builder customization hook | Rarely |

---

## 2. Mocker — Public Attributes

### IServer
- IServerState State { get; init; }
- void Start()

### IServerState
- InputOutputState InputOutputState { get; init; }
- bool HasAction(string actionName)
- void ChangeActionStub(string actionName, string stubName)
- void TriggerAction(string actionName, int? timeoutMs)
- ICache GetCache()

### IController
- void Start()

### BaseTransactionProcessor<TConfiguration>
- abstract Data<object> Process(IImmutableList<DataSource> dataSourceList, Data<object> requestData)

---

## 3. Mocker — Built-in Stubs Catalog (14 total)

| Class | Purpose | YAML Key | Config Type |
|---|---|---|---|
| ExampleProcessor | Health check (200 + plain-text) | ExampleProcessor | NoConfiguration |
| GrpcEchoProcessor | Echo request back (gRPC) | GrpcEchoProcessor | NoConfiguration |
| AlternateHealthProcessor | Alternative health check | AlternateHealthProcessor | NoConfiguration |
| AlternateGrpcEchoProcessor | Alternative gRPC echo | AlternateGrpcEchoProcessor | NoConfiguration |
| SocketPassthroughProcessor | Socket pass-through | SocketPassthroughProcessor | NoConfiguration |
| SocketPrefixProcessor | Socket with prefix | SocketPrefixProcessor | NoConfiguration |
| StatusCodeTransactionProcessor | Inject HTTP status code | StatusCodeTransactionProcessor | StatusCodeConfiguration |
| ConditionalResponseProcessor | Conditional branching | ConditionalResponseProcessor | ConditionalResponseConfiguration |
| DataSourceResponseProcessor | Fetch from data source | DataSourceResponseProcessor | DataSourceResponseConfiguration |
| JsonEnvelopeProcessor | Wrap in JSON envelope | JsonEnvelopeProcessor | JsonEnvelopeConfiguration |
| PassThroughProcessor | Return request unmodified | PassThroughProcessor | PassThroughConfiguration |
| ProblemDetailsProcessor | RFC 7807 Problem Details | ProblemDetailsProcessor | ProblemDetailsConfiguration |
| RequestEchoProcessor | Echo headers + body | RequestEchoProcessor | RequestEchoConfiguration |
| StaticResponseProcessor | Hard-coded response | StaticResponseProcessor | StaticResponseConfiguration |

---

## 4. CommunicationObjects — Schema Model (10 types)

### Core Records
- CommandRequest: Id, Command (enum), ChangeActionStub?, Consume?, TriggerAction?
- CommandResponse: Id, ServerInstanceId, Command, Status, ExceptionMessage?
- PingRequest / PingResponse
- ChangeActionStub: ActionName, StubName
- TriggerAction: ActionName, TimeoutMs?
- Consume: ServerName

### Enums
- CommandType: ChangeActionStub | TriggerAction | Consume
- Status: Succeeded | Failed

### Helper Methods (CommunicationMethods)
- CreateChannelRunnerToMocker(contentType, serverName?, serverInstanceName?) → channel
- CreateChannelMockerToRunner(contentType, serverName?, serverInstanceName?) → channel
- CreateConsumerEndpointInput(serverName) → "serverName:input"
- CreateConsumerEndpointOutput(serverName) → "serverName:output"

---

## 5. Multi-Server Routing — Knobs

### YAML Root Keys
| Key | Type | Required? | Purpose |
|---|---|---|---|
| DataSources | List<DataSourceConfiguration> | No | Data inputs (files, generators) |
| Stubs | List<StubConfiguration> | Yes | Transaction stubs (processor + config) |
| Server | ServerConfiguration | Mutually exclusive with Servers | Single mock server |
| Servers | List<ServerConfiguration> | Mutually exclusive with Server | Multiple mock servers |
| Controller | ControllerConfiguration | No | Redis control plane |

### Channel Naming (lowercase, deterministic)
```
runner-to-mocker:{contentType}[:{serverName}[:{serverInstanceName}]]
mocker-to-runner:{contentType}[:{serverName}[:{serverInstanceName}]]
```

---

## 6. Sample Configs Found (5 files)

| File Path | Type | Purpose |
|---|---|---|
| D:/QaaS/DummyAppMock/DummyAppMock/mocker.qaas.yaml | Single HTTP | Loads files from ServerData/, serves /data |
| D:/QaaS/QaaS.Mocker/QaaS.Mocker.Example/mocker.qaas.yaml | HTTP+gRPC+Socket | Multi-protocol; HTTPS with dev cert |
| D:/QaaS/QaaS.Mocker/QaaS.Mocker.Example/mocker.grpc.qaas.yaml | gRPC only | Focused gRPC schema binding |
| D:/QaaS/QaaS.Mocker/QaaS.Mocker.Example/mocker.runner.qaas.yaml | Runner integration | Redis controller; ChangeActionStub + TriggerAction |
| D:/QaaS/DummyAppTests/DummyAppTests/test.qaas.yaml | Test fixture | Integration test harness |

---

## 7. Documentation Gaps (Top 3 — absolute paths)

1. **D:/QaaS/qaas-docs/docs/mocker/authoring-guide/processor-base-class.md**  
   Missing: BaseTransactionProcessor<TConfiguration> lifecycle, overridable methods, configuration binding, exception handling.

2. **D:/QaaS/qaas-docs/docs/mocker/authoring-guide/creating-data-generators.md**  
   Missing: Custom IDataGenerator hooks, generator configuration binding, data source lifecycle, examples.

3. **D:/QaaS/qaas-docs/docs/mocker/concepts/multi-server-routing.md**  
   Missing: Multi-server execution model, action uniqueness constraints, concurrent execution, channel naming.

Additional gaps:
- docs/mocker/reference/yaml-schema-full.md (complete YAML reference)
- docs/mocker/examples/custom-processor-walkthrough.md (step-by-step walkthrough)
- docs/mocker/reference/server-state-queries.md (IServerState query patterns)
- docs/mocker/concepts/stub-execution-chain.md (4-stage pipeline details)
- docs/mocker/how-to/wiring-runner-integration.md (Redis controller + commands)

---

**End of coverage map.**
