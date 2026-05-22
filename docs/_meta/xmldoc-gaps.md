# XMLDoc gaps in plugin source

Last refreshed: 2026-05-22

Plugin classes that ship without a `<summary>` XMLDoc block. Each plugin page emits a "No summary available yet" placeholder + an admonition banner. Fix-forward: add `<summary>` to the source class, rerun `node tools/docs-generator/gen-plugin-pages.mjs`.

| Family | Plugin | Source file |
| ------ | ------ | ----------- |
| probes | OsEditYamlConfigMap | `D:/QaaS/QaaS.Common.Probes/QaaS.Common.Probes/ConfigurationObjects/Os/OsEditYamlConfigMapConfig.cs` |

**Total gaps:** 1
