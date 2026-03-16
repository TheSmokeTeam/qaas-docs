# IDE

All QaaS projects can be configured using either **YAML** files or **C# code** (Configuration as Code). While YAML
provides a declarative, human-readable format ideal for version control and collaboration, **C# offers full programmatic
control** for dynamic, conditional, and reusable test logic.

For teams choosing to use YAML, it is strongly recommended to use a capable IDE with real-time schema validation and
intelligent code completion to ensure correctness, reduce errors, and improve productivity.

## Available Schemas

To enable real-time validation, auto-completion, and contextual suggestions for QaaS YAML configurations, you must
install the appropriate **JSON schema** in your IDE.

- [**QaaS.Runner Schema**]({{ links.runner_schema }}) schema: Covers all core configuration fields for the QaaS Runner.
- [**QaaS.Mocker Schema**]({{ links.mocker_schema }}) schemas: Cover all hook configuration fields for the QaaS Mocker.

| Schema file         | Covers                                                                                                                                                                                                                             |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `runnerSchema.json` | <ul><li>Core `QaaS.Runner` configuration (DataSources, Sessions, Assertions, Storage, Links, MetaData)</li><li>And all its hooks configuration (`QaaS.Common.Assertions`, `QaaS.Common.Generatos`, `QaaS.Common.Probes`)</li></ul> |
| `mockerSchema.json` | <ul><li>Core `QaaS.Mocker` configuration (DataSources, Stubs, Servers, Controller)</li><li>And all its hooks configuration (`QaaS.Common.Generators`, `QaaS.Common.Processors`)</li></ul>                                          |

## VS Code

**Requirement**: Install the [YAML extension by Red Hat]({{ links.vscode_yaml_extension }}).

1. Download the desired schema JSON file into your project (e.g. `schemas/qaasSchema.json`).
2. Open **File → Preferences → Settings** and search for `yaml.schemas`.
3. Click **Edit in settings.json** and add:

```json
"yaml.schemas": {
  "./schemas/qaasSchema.json": "*.qaas.yaml"
}
```

4. Open any `.qaas.yaml` file and press ++ctrl+space++ to trigger suggestions.

## JetBrains Rider

1. Go to **File → Settings → Languages & Frameworks → Schemas and DTDs → JSON Schema Mappings**.
2. Click **+** to add a new mapping.
3. Set **Schema file or URL** to the path of `qaasSchema.json`.
4. Set **File path pattern** to `*.qaas.yaml`.
5. Apply and close.

## Tips

- Use the `.qaas.yaml` suffix for your test YAML files so schema mappings can target them precisely.
- You can add an inline schema hint at the top of a file:

```yaml
# $schema: ./schemas/qaasSchema.json
DataSources: []
Sessions: []
Assertions: []
```

## Next Step

[Write a test with YAML →](writeTestYaml.md)