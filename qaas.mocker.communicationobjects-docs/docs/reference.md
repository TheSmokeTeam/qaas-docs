# Communication Objects Reference

## Command Payloads

- `CommandRequest`
  - `Id`
  - `Command`
  - `ChangeActionStub`
  - `Consume`
  - `TriggerAction`
- `CommandResponse`
  - response payload for controller commands
- `ChangeActionStub`
  - `ActionName`
  - `StubName`
- `Consume`
  - `TimeoutMs`
  - `ActionName`
  - `InputDataFilter`
  - `OutputDataFilter`
- `TriggerAction`
  - trigger payload for action execution

## Ping Payloads

- `PingRequest`
  - `Id`
- `PingResponse`
  - ping response payload

## Enums

- `CommandType`
- `Status`
- `InputOutputState`
