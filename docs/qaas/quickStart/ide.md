# IDE

All QaaS projects can be configured using either **YAML** files or **C# code** (Configuration as Code). While YAML
provides a declarative, human-readable format ideal for version control and collaboration, **C# offers full programmatic
control** for dynamic, conditional, and reusable test logic.

For teams choosing to use YAML, it is strongly recommended to use a capable IDE with real-time schema validation and
intelligent code completion to ensure correctness, reduce errors, and improve productivity.

## Available Schemas

To enable real-time validation, auto-completion, and contextual suggestions for QaaS YAML configurations, you must
install the appropriate **JSON schema** in your IDE.

- [**QaaS.Runner Schema**]({{ links.runner_schema }}) - Covers all core configuration fields for the QaaS Runner.
- [**QaaS.Mocker Schema**]({{ links.mocker_schema }}) - Cover all hook configuration fields for the QaaS Mocker.

| Schema file         | Covers                                                                                                                                                                                                                         |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `runnerSchema.json` | <ul><li>Core `QaaS.Runner` configuration (DataSources, Sessions, Assertions, Storage, Links, MetaData)</li><li>All its hooks configuration (`QaaS.Common.Assertions`, `QaaS.Common.Generatos`, `QaaS.Common.Probes`)</li></ul> |
| `mockerSchema.json` | <ul><li>Core `QaaS.Mocker` configuration (DataSources, Stubs, Servers, Controller)</li><li>Generator hook configuration from `QaaS.Common.Generators` and the built-in framework status hook</li><li>Processor-specific sections for local custom processors referenced by your project</li></ul> |

!!! note
    Each schema corresponds to a specific component of the QaaS ecosystem. Use the correct schema based on your
    configuration file's content.
    Moreover, each schema covers all its relevant hooks even if their nuggets are not installed in the project.

### Using the Schema

After installing the schema in your IDE:

Open any `.yaml` file and you will receive real-time:

- Syntax highlighting
- Auto-completion
- Validation errors (e.g., missing required fields, invalid values)
- Contextual suggestions based on the current configuration structure

!!! tip
    To trigger suggestions, use `Ctrl + Space`.

## IDE Recommendations & Setup

=== "VS Code"

    #### Setting Up Schema in VS Code

    1. Download the desired schema file (e.g., `qaasSchema.json`).
    2. Open VS Code → `File` → `Preferences` → `Settings`.
    3. Search for `yaml: schemas`.
    4. Click **"Edit in settings.json"**.
    5. Add the schema mapping under the `yaml.schemas` object:

        ```json
        "yaml.schemas": {
        "/path/to/qaasSchema.json": "*.yaml"
        }
        ```

        > Replace `/path/to/qaasSchema.json` with the actual local path to your downloaded schema file.

    6. Save the file and **restart VS Code**.
    7. Open any `.yaml` file — schema validation and auto-completion will now be active.

=== "Rider"

    #### Setting Up Schema in Rider

    1. Download the schema file (e.g., `qaasSchema.json`).
    2. Go to: `File` → `Settings` → `Languages & Frameworks` → `Schemas and DTDs` → `JSON Schema Mappings`.
    3. Click the **+** button to add a new mapping:
        - **Schema file**: Select your downloaded `qaasSchema.json`.
        - **Pattern**: Enter `*.yaml` (or a more specific pattern if needed).
    4. Click **Save**.

    !!! warning "Important"
        This configuration is project-specific. You must repeat this setup for each new QaaS project.
