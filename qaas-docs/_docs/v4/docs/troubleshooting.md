# Troubleshooting

## Common Failures

### Configuration binds but validation fails

QaaS validates the fully merged builder graph, not each YAML file independently. Check:

- overwrite files are applied in the order you intended,
- case files do not introduce duplicate names,
- mutually exclusive type sections do not appear together,
- required hook names match shipped implementations exactly.

### Hooks are not discovered

Discovery depends on the resolved assemblies and the configured hook type name.

- confirm the package is referenced by the consuming repository,
- confirm the hook name in YAML matches the implementation name used by the builder,
- inspect the relevant `HooksLoaderModule` path in `QaaS.Framework.Providers` when discovery fails silently.

### `assert` cannot reuse `act` output

The usual causes are:

- storage points to a different filesystem directory or S3 prefix,
- serializer or deserializer settings changed between `act` and `assert`,
- session names changed, so assertions no longer match stored session data.

### Mocker commands do nothing

Check the full chain:

1. `QaaS.Mocker` must be started with a configured controller.
2. Runner sessions must point to the same Redis host, port, and channels.
3. `QaaS.Mocker.CommunicationObjects` package versions must stay compatible between runner and mocker.

## Contributing to Docs

- update the docs package that matches the changed repository,
- prefer source-derived descriptions over copied prose,
- keep examples minimal and executable,
- fix `repo_url` or dependency links whenever a package or repository location changes.

## Source Links

- [QaaS.Framework](https://github.com/TheSmokeTeam/QaaS.Framework)
- [QaaS.Runner](https://github.com/TheSmokeTeam/QaaS.Runner)
- [QaaS.Mocker](https://github.com/TheSmokeTeam/QaaS.Mocker)
- [QaaS.Common.Assertions](https://github.com/TheSmokeTeam/QaaS.Common.Assertions)
- [QaaS.Common.Generators](https://github.com/TheSmokeTeam/QaaS.Common.Generators)
- [QaaS.Common.Probes](https://github.com/TheSmokeTeam/QaaS.Common.Probes)
- [QaaS.Common.Processors](https://github.com/eldarush/QaaS.Common.Processors)
- [QaaS.Mocker.CommunicationObjects](https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects)
