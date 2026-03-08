# IDE Setup

QaaS tests are configured via YAML files. Setting up JSON Schema validation in your IDE gives you real-time error highlighting, auto-completion, and field documentation.

## Available Schemas

JSON schemas are published with each NuGet package release. Download them from the package release notes.

| Schema file | Covers |
|---|---|
| `qaasSchema.json` | Core `QaaS.Runner` configuration (DataSources, Sessions, Assertions, Storage, Links, MetaData) |
| `qaasCommonAssertionsSchema.json` | All `QaaS.Common.Assertions` hook configurations |
| `qaasCommonGeneratorsSchema.json` | All `QaaS.Common.Generators` hook configurations |
| `qaasCommonProbesSchema.json` | All `QaaS.Common.Probes` hook configurations |

## VS Code

**Requirement**: Install the [YAML extension by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml).

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