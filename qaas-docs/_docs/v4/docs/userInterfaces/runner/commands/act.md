# Act

The `act` command executes the session side of a test without running assertions. The produced session data is written to the configured storages and can later be reused by `assert`.

## Usage

```bash
dotnet run -- act <configuration-file> [shared-runnable-options] [shared-logging-options]
```

To see the generated help text from the runner itself:

```bash
dotnet run -- act --help
```

## When To Use `act`

Use `act` when:

- generating session data is slow or expensive and you want to reuse it
- one environment performs the interactions and another environment performs the assertions
- you want to inspect or archive the raw session output before deciding how to assert it

For storage requirements and supported backends, see the Storages section of the runner reference.
