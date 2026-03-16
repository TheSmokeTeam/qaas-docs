# IDE

All QaaS projects can be configured using either **YAML** files or **C# code** (Configuration as Code). While YAML
provides a declarative, human-readable format ideal for version control and collaboration, **C# offers full programmatic
control** for dynamic, conditional, and reusable test logic.

For teams choosing to use YAML, it is strongly recommended to use a capable IDE with real-time schema validation and
intelligent code completion to ensure correctness, reduce errors, and improve productivity.

---

## Available Schemas

To enable real-time validation, auto-completion, and contextual suggestions for QaaS YAML configurations, you must
install the appropriate **JSON schema** in your IDE.

- [**QaaS.Runner Schema**]({{ links.runner_schema }}) - Covers all core configuration fields for the QaaS Runner.
- [**QaaS.Mocker Schema**]({{ links.mocker_schema }}) - Cover all hook configuration fields for the QaaS Mocker.

| Schema file         | Covers                                                                                                                                                                                                                         |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `runnerSchema.json` | <ul><li>Core `QaaS.Runner` configuration (DataSources, Sessions, Assertions, Storage, Links, MetaData)</li><li>All its hooks configuration (`QaaS.Common.Assertions`, `QaaS.Common.Generatos`, `QaaS.Common.Probes`)</li></ul> |
| `mockerSchema.json` | <ul><li>Core `QaaS.Mocker` configuration (DataSources, Stubs, Servers, Controller)</li><li>All its hooks configuration (`QaaS.Common.Generators`, `QaaS.Common.Processors`)</li></ul>                                          |

> **Note**: Each schema corresponds to a specific component of the QaaS ecosystem. Use the correct schema based on your
> configuration file’s content.
> Moreover, each schema covers all its relevant hooks even if their nuggets are not installed in the project.

### Using the Schema

After installing the schema in your IDE:

Open any `.qaas.yaml` file and you will receive real-time:

- Syntax highlighting
- Auto-completion
- Validation errors (e.g., missing required fields, invalid values)
- Contextual suggestions based on the current configuration structure

> To trigger suggestions, use `Ctrl + Space`.

---

## IDE Recommendations & Setup

### VS Code

1. Download the desired schema JSON file into your project (e.g. `schemas/runnerSchema.json`).
2. Open **File → Preferences → Settings** and search for `yaml.schemas`.
3. Click **Edit in settings.json** and add the schema mapping under the `yaml.schemas` object:

```json
"yaml.schemas": { "/path/to/runnerSchema.json": "*.qaas.yaml"}
```

> Replace `/path/to/qaasSchema.json` with the actual local path to your downloaded schema file.

4. Save the file and **restart VS Code**.


### JetBrains Rider

1. Download the schema file (e.g., `qaasSchema.json`).
2. Go to: `File` → `Settings` → `Languages & Frameworks` → `Schemas and DTDs` → `JSON Schema Mappings`.
3. Click the **+** button to add a new mapping:
    - **Schema file**: Select your downloaded `runnerSchema.json`.
    - **Pattern**: Enter `*.qaas.yaml` (or a more specific pattern if needed).
4. Click **Save**.

> **Important**: This configuration is project-specific. You must repeat this setup for each new QaaS project.

---

## Tips

- Use the `.qaas.yaml` suffix for your test YAML files so schema mappings can target them precisely.
- You can add an inline schema hint at the top of a file:

```yaml
# $schema: ./schemas/runnerSchema.json
DataSources: []
Sessions: []
Assertions: []
```
