# IDE

All QaaS projects can be configured using either **YAML** files or **C# code** (Configuration as Code). While YAML
provides a declarative, human-readable format ideal for version control and collaboration, **C# offers full programmatic
control** for dynamic, conditional, and reusable test logic.

For teams choosing to use YAML, it is strongly recommended to use a capable IDE with real-time schema validation and
intelligent code completion to ensure correctness, reduce errors, and improve productivity.

## QaaS Real-Time Schema Validation

To enable real-time validation, auto-completion, and contextual suggestions for QaaS YAML configurations, you must
install the appropriate **JSON schema** in your IDE. These schemas are published in the **Release Notes** section of the
relevant NuGet packages.

### Available Schemas

| Schema                            | Purpose                                            | File                                                                                                              |
|-----------------------------------|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| `qaasSchema.json`                 | Core QaaS.Runner configuration schema              | [Download](REDA)                   |
| `qaasCommonAssertionsSchema.json` | Schema for `QaaS.Common.Assertions` configurations | [Download](REDAs) |
| `qaasCommonGeneratorsSchema.json` | Schema for `QaaS.Common.Generators` configurations | [Download](REDAs) |
| `qaasCommonProbesSchema.json`     | Schema for `QaaS.Common.Probes` configurations     | [Download](REDA)     |

> **Note**: Each schema corresponds to a specific component of the QaaS ecosystem. Use the correct schema based on your
> configuration file’s content.

### Using the Schema

After installing the schema in your IDE:

Open any `.yaml` file and you will receive real-time:

- Syntax highlighting
- Auto-completion
- Validation errors (e.g., missing required fields, invalid values)
- Contextual suggestions based on the current configuration structure

> To trigger suggestions, use `Ctrl + Space`.

---

## IDE Recommendations & Setup

### VS Code

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

1. Save the file and **restart VS Code**.
2. Open any `.yaml` file — schema validation and auto-completion will now be active.

![HowToSetSchemaInVsCode](../assets/setSchemaInVsCode.gif)

---

### Rider

#### Setting Up Schema in Rider

1. Download the schema file (e.g., `qaasSchema.json`).
2. Go to: `File` → `Settings` → `Languages & Frameworks` → `Schemas and DTDs` → `JSON Schema Mappings`.
3. Click the **+** button to add a new mapping:
    - **Schema file**: Select your downloaded `qaasSchema.json`.
    - **Pattern**: Enter `*.yaml` (or a more specific pattern if needed).
4. Click **Save**.

> **Important**: This configuration is project-specific. You must repeat this setup for each new QaaS project.

![HowToSetSchemaInRider](../assets/riderQaasJsonSchema.png)
