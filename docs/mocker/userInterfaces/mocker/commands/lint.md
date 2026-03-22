# lint

The `lint` command loads the configuration, resolves overlays, validates it, and exits without starting any server.

## Usage

```bash
dotnet run -- lint mocker.qaas.yaml
```

This is the fastest way to catch issues such as:

- invalid or conflicting routes
- duplicate action names across `Servers`
- missing TLS certificate files when `IsSecuredSchema` is enabled
- missing required stub, controller, or socket settings

Use `dotnet run -- lint --help` to see the full option list.
