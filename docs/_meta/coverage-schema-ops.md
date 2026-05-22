# QaaS Docs Revamp: Coverage & Schema Operations

**Survey Date:** 2026-05-22  
**Scope:** Read-only enumeration of QaaS repos to map auto-gen coverage and identify docs generator extensibility gaps.

---

## 1. QaaS.JsonSchemaExtensions

**Location:** D:\\QaaS\\QaaS.JsonSchemaExtensions

### CLI Entrypoints
- **Tool:** QaaS.SchemaGenerator.Tools/Program.cs
- **Command:** dotnet <generator> (orchestrates multi-repo schema generation)
- **Verb:** Implicit single verb: rebuild all target repos, generate all schemas, validate, write manifest

### Configuration Schema
**Generated Output:** Six JSON schemas in generated-schemas/:
1. assertions.schema.json — Runner assertion plugins (11 types)
2. generators.schema.json — Runner data generators (11 types)
3. probes.schema.json — Mocker probes for chaos (41 types)
4. processors.schema.json — Event processors (9 types)
5. runner.schema.json — Full Runner config with top-level: Assertions, DataSources, Links, MetaData, Sessions, Storages
6. manifest.json — Index of all schemas

**Key Schema Pattern:** Each schema uses anyOf branching within item arrays to define enum of available plugins + per-plugin configuration objects.

### Extension Points
- **Class:** SchemaCreator — builds JSON schemas from .NET reflection
- **Source:** Scans target assemblies by prefix + attribute name for discoverable types
- **Input:** Compiled .NET DLLs from target repos (Runner, Mocker, Framework)
- **Method:** Assembly scanning + attribute markers (e.g., [AssertionPlugin])

### Docker/Container Surface
- **Env vars (set by orchestrator):**
  - SCHEMA_OUTPUT_PATH — output file path
  - SCHEMA_NAME — schema identifier
  - SCHEMA_VERSION — version string
  - TARGET_ASSEMBLY_PATH — DLL to scan
  - ASSEMBLY_PREFIX_TO_SCAN — namespace filter
  - DISCOVERY_MODE — auto/manual
  - ATTRIBUTE_NAME_TO_SEARCH — marker attribute (conditional)
  - GENERIC_HOOK_BASE_TYPE_NAME — hook base class (conditional)
  - ANY_OF_* — branching config (conditional)

### Sample Configs
- None (schema generator only; no user config consumed)

---

## 2. qaas-orchestrator

**Location:** D:\\QaaS\\qaas-orchestrator

### CLI Entrypoints
**Status:** No Program.cs at repo root; structure unclear from file listing.

### Configuration Schema
**Status:** No appsettings.json or config files found.

### Extension Points
**Status:** Not enumerated in survey scope.

### Docker/Container Surface
**Status:** Not enumerated in survey scope.

### Sample Configs
**Status:** None found.

---

## 3. QaaS.ElasticBootstrap

**Location:** D:\\QaaS\\QaaS.ElasticBootstrap

### CLI Entrypoints
- **Tool:** QaaS.Configuration.Tools/Program.cs
- **Verb:** Implicit single verb: render Elastic/ReportPortal configuration defaults

### Configuration Schema
**Top-level keys (from defaults):**
- ElasticDefaults: Elastic stack endpoint, username, password
- ReportPortalDefaults: ReportPortal integration endpoint/credentials
- Environment variables override defaults at runtime

### Extension Points
- **Class:** ConfigurationBootstrap.Register() — reflection-based registration
- **Mechanism:** Loads ExecutionLogging.RegisterDefaults() from QaaS.Framework.Executions assembly
- **Extensibility:** Low; hard-coded method name lookup; not easily pluggable

### Docker/Container Surface
- **Env vars:**
  - QAAS_ARTIFACTORY_SOURCE_URL — NuGet mirror source
  - QAAS_ARTIFACTORY_API_KEY — mirror auth

### Sample Configs
- ElasticDefaults.cs — static defaults for Elastic URI, username, password
- ReportPortalDefaults.cs — static defaults for ReportPortal endpoint

---

## 4. QaaS.PackageMirror

**Location:** D:\\QaaS\\QaaS.PackageMirror

### CLI Entrypoints
- **Tool:** QaaS.PackageMirror.Tools/Program.cs
- **Entry:** async Task<int> Main(string[] args)
- **Verb:** Implicit single verb: mirror NuGet packages to cache/feed

### Configuration Schema
- Takes command-line arguments (parsed by CommandArguments)
- No YAML/JSON config file enumerated

### Extension Points
- None enumerated in survey scope

### Docker/Container Surface
- Likely recognizes QAAS_ARTIFACTORY_* env vars for auth

### Sample Configs
- None found

---

## 5. QaaS.Docs.Generator — CURRENT STATE

**Location:** D:\\QaaS\\QaaS.Docs.Generator

### CLI Entrypoints
- **Entry:** QaaS.Docs.Generator/Program.cs
- **Verb:** Single implicit: generate all reference documentation
- **Arguments:**
  - --docs-root <path> — output docs repo root
  - --mirror-root <path> — schema mirror (pre-generated JSONSchema files)
  - --runner-root <path> — Runner repo (for CLI catalog snapshots)
  - --mocker-root <path> — Mocker repo (for CLI catalog snapshots)
  - --framework-root <path> — Framework repo (for function definitions)
  - --check — validation mode (dry-run, no write)

### Current Output (What It Generates Today)
1. **CLI Reference** (Cli/CliReferenceRenderer):
   - Runner CLI overview & per-command docs
   - Mocker CLI overview & per-command docs
   - Input: Pre-captured JSON snapshots (runner-cli.json, mocker-cli.json)

2. **Configuration Reference** (Schema/ConfigurationReferenceRenderer):
   - Per-section table view (tableView.md)
   - Per-section YAML view (yamlView.md)
   - Generated paths: qaas/userInterfaces/runner/configurationSections/{section}/configurations/{tableView,yamlView}.md
   - Input: Pre-built FamilySchemaDocs objects loaded from mirror-root/schemas/{runner,mocker}-family/latest/

3. **Function Reference** (Functions/FunctionReferenceRenderer):
   - XMLDoc + reflection-based API docs for Builders, Commands, Functions
   - Organized by namespace/class groups
   - Input: Live assemblies from runner-root, mocker-root, framework-root

4. **Hook Reference** (Hooks/HookReferenceRenderer):
   - Parsed from hand-written hook overview files
   - Injects auto-generated hook catalog into existing markdown
   - Input: Markdown files + reflection introspection

5. **Navigation** (Navigation/MkDocsNavigationRenderer):
   - Updates mkdocs.yml structure
   - Maintains hard-coded nav hierarchy

### Coverage Today (Empirical)
| Family | Schema Items | Docs Folders | Status |
|--------|------|------|----------|
| Assertions | 11 | 11 | 100% hand-written |
| Generators | 11 | 11 | 100% hand-written |
| Probes | 41 | 41 | 100% hand-written |
| Processors | 9 | 9 | 100% hand-written |
| **Total** | **72** | **72** | **100% manual** |

### What It DOES Generate
- ✓ CLI command reference (structured, table + YAML views)
- ✓ Configuration schema reference (per-section breakdown)
- ✓ Function/method reference (XMLDoc + signatures)
- ✓ Hook reference (semi-auto with HTML injections)
- ✓ Navigation updates (mkdocs.yml sync)

### What It Does NOT Generate (Gaps)
- ✗ Per-plugin overviews (e.g., assertions/availableAssertions/HttpStatus/overview.md)
- ✗ Per-plugin configuration tables (e.g., assertions/availableAssertions/HttpStatus/configuration/tableView.md)
- ✗ Assertion/Generator/Probe/Processor family inventory (master lists)
- ✗ Schema-driven type/property grids with descriptions
- ✗ Family index pages (no "All Assertions" master reference page)

---

## 6. No jsonschema2mdtable Tool Found

**Status:** Searched D:\\QaaS for matching tools — no matches found.
If such a tool exists, it is not yet in the workspace.

---

## Docs Generator Extensibility Assessment

### Architecture Summary
QaaS.Docs.Generator is a **multi-renderer pipeline** that:
- Loads pre-built schemas from a mirror directory
- Loads CLI catalogs from JSON snapshots
- Loads function catalogs from live assemblies
- Renders each to markdown documents
- Writes or validates (--check mode)

### Extensibility Rating: **MODERATE** (7/10)

**Strengths:**
- Clean separation of concerns (one renderer per doc family)
- Unified IReadOnlyList<GeneratedDocument> output pattern
- Already handles schema loading + traversal
- Schema data is available (anyOf branches, descriptions, types)

**Weaknesses:**
- No plugin/interface-based renderer discovery (all hard-coded)
- No DI container (renderers instantiated inline)
- Per-plugin generation not yet implemented (code paths don't exist)
- Schema descriptions → markdown conversion not generalized

### Effort to Close Gaps

#### Gap 1: Per-Plugin Overview Generation
**What's needed:** New method in ConfigurationReferenceRenderer
- Parse schema.oneOf[N].title (plugin name)
- Extract schema.oneOf[N].description
- Template -> assertions/available{Family}/{PluginName}/overview.md
- **Effort:** 4–6 hours (straightforward schema traversal)

#### Gap 2: Per-Plugin Configuration Tables
**What's needed:** Extend RenderTableView() to per-plugin level
- For each plugin's configuration schema (oneOf branch)
- Extract properties → markdown table (name, type, required, description)
- Template -> assertions/available{Family}/{PluginName}/configuration/{tableView,yamlView}.md
- **Effort:** 6–8 hours (schema → table rendering already exists for sections; adapt for items)

#### Gap 3: Family Index Pages
**What's needed:** New method RenderFamilyIndex()
- List all plugins in family
- Include description summary + links
- **Effort:** 2–4 hours (simple iteration + templating)

#### Gap 4: Schema Validation
**What's needed:** Optional --validate-schemas or --regenerate-schemas flag
- Call into QaaS.SchemaGenerator to rebuild in-process
- Compare against mirror; warn if stale
- **Effort:** 4–6 hours (integration with schema generator tool)

#### Gap 5: Extensible Renderer Interface
**What's needed:** IDocumentRenderer interface + DI setup
- Refactor existing renderers to implement interface
- Load from DI container
- Allow external plugins
- **Effort:** 8–12 hours (architectural change; adds complexity)

### Total Effort to Full Auto-Gen

| Phase | Effort | Gaps Addressed |
|-------|--------|----------------|
| Phase 1 (Short-term) | 10–14 hours | Gaps 1, 2 (per-plugin generation) |
| Phase 2 (Medium-term) | 4–6 hours | Gap 4 (validation) |
| Phase 3 (Long-term) | 2–4 hours | Gap 3 (family index) |
| Phase 4 (Nice-to-have) | 8–12 hours | Gap 5 (extensibility) |
| **Total** | **24–36 hours** | **All gaps** |

---

## Conclusion

**QaaS.Docs.Generator CAN absorb the full auto-gen workload.** 

✓ Architectural foundation is sound (multi-renderer, schema-aware)  
✓ Schema data is available (JSON schemas with descriptions)  
✓ Renderer pattern is repeatable (can add plugin-level renderers)  
✓ Integration would be incremental (no breaking refactors needed)  

**Minimum viable effort: 10–14 engineering hours.** This covers per-plugin overview and configuration table generation — the 72 items currently hand-maintained.

**Recommended approach:**
1. Implement Gap 1 & 2 in ConfigurationReferenceRenderer (1–2 days)
2. Add schema validation (4 hours)
3. Revisit extensibility once schema-driven generation is stable

**No architectural blockers identified.** Generator is production-ready for extension.

