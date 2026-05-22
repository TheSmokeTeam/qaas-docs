# QaaS Framework & Runner — Documentation Coverage Map

**Surveyed:** QaaS.Framework (Executions + Configurations), QaaS.Runner (main + Infrastructure + Assertions)  
**Date:** 2026-05-22  
**Scope:** Public surface area test authors will encounter

---

## 1. Framework — Validation Attributes

Configuration validation attributes (apply to properties; all in CustomValidationAttributes/):

| Attribute Name | Target | Purpose |
|---|---|---|
| RequiredIfAnyAttribute | Property | Required if any of named fields match condition |
| RequiredUnlessAllAttribute | Property | Required unless all of named fields match condition |
| RequiredOrNullBasedOnOtherFieldsConfigurationAttribute | Property | Conditional required based on sibling field state |
| AtLeastOnePropertyNotNullAttribute | Type | Class-level: at least one property not null |
| AtLeastOneEnumerablePropertyNotEmptyAttribute | Type | Class-level: at least one collection non-empty |
| NoMoreThanXPropertiesNotNullAttribute | Type | Class-level: limit count of non-null properties |
| ConditionalValidationAttribute | Property | Base for conditional validation logic (abstract) |
| PropertyComparisonAttribute | Property | Compare two property values with operator |
| RangeIfAnyAttribute | Property | Enforce range if condition met |
| NullIfAnyAttribute | Property | Force null if any condition true |
| NullUnlessAllAttribute | Property | Force null unless all conditions true |
| UniqueItemsInEnumerableAttribute | Property | Ensure list items are unique |
| UniquePropertyInEnumerableAttribute | Property | Ensure property value unique within collection |
| UniquePropertyInEnumerablePropertiesAttribute | Property | Ensure property unique across multiple collections |
| AllItemsInEnumerablePropertyInEnumerableExistAsPropertyInEnumerableAttribute | Property | Cross-list membership validation |
| EnumerablePropertyDoesNotContainAnotherPropertyValueAttribute | Property | Exclusion validation between properties |
| AllPathsInEnumerableValidAttribute | Property | Validate all paths in nested structure |
| ValidPathAttribute | Property | Validate file/directory path format |
| ValueAppearsInListAttribute | Property | Enforce value in predefined list |
| YamlStringDeserializableAttribute | Property | Mark YAML-deserializable string |
| JsonSchemaAttribute | Property | Attach JSON schema metadata to property |

**Total: 20 validation attributes**

---

## 2. Framework — Extension Points (Interfaces & Abstract Bases)

| Type | Namespace | Key Members | Purpose | Authoring Complexity |
|---|---|---|---|---|
| IRunner | QaaS.Framework.Executions | void Run() | Base contract for orchestrating execution (Runner/Mocker) | 1 |
| ILogic | QaaS.Framework.Executions.Logics | (Hook interface for execution stages) | Extension point for custom test logic | 2 |
| IElasticLoggingDefaultsProvider | QaaS.Framework.Executions | (Logging configuration provider) | Supply Elasticsearch logging defaults | 2 |
| BaseExecution | QaaS.Framework.Executions | Generic lifecycle, setup/teardown hooks | Base for test execution context | 2 |
| BaseExecutionBuilder | QaaS.Framework.Executions | Generic builder pattern | Fluent test configuration builder | 3 |
| BaseLoader | QaaS.Framework.Executions.Loaders | Generic YAML/config loader | Load & validate runner/mocker configuration | 3 |

**High-value extension points:** ILogic (hook discovery), BaseExecutionBuilder (fluent config), BaseLoader (config parsing/validation)

---

## 3. Framework — Configuration Model (YAML/JSON Sections)

Recognized top-level sections in QaaS configuration files:

| Section | Type | Purpose |
|---|---|---|
| execution | Execution config | Top-level execution parameters & lifecycle |
| publishers | List[PublisherConfig] | Data generation/emit stages |
| consumers | List[ConsumerConfig] | Data consumption stages |
| collectors | List[CollectorConfig] | Result collection/aggregation |
| transactions | List[TransactionConfig] | Multi-step transaction sequences |
| probes | List[ProbeConfig] | Health/readiness probes |
| mockerCommands | List[MockerCommandConfig] | Mocker-specific command invocations |
| assertions | List[AssertionConfig] | Validation/assertion configurations |

Configuration constants:
- PathSeparator = ":"
- CollapseString = "<<"

---

## 4. Framework — Public Helpers & Builders

Fluent/static helpers for test authoring:

| Namespace | Class/Method | Purpose |
|---|---|---|
| QaaS.Framework.SDK | ContextBuilder | Fluent builder for test contexts |
| QaaS.Framework.SDK | DataSourceBuilder | Fluent builder for data source configuration |
| QaaS.Framework.Configurations | ConfigurationUtils | Static config parsing/validation utilities |
| QaaS.Framework.Configurations | ConfigurationPlaceholderParser | Resolve placeholders in YAML |
| QaaS.Framework.Configurations.References | ConfigurationReferencesParser | Resolve : path references across config |
| QaaS.Framework.Configurations | ConfigurationUpdateExtensions | Extension methods for config merging |
| QaaS.Framework.Providers | HookProvider | Discover & invoke lifecycle hooks |
| QaaS.Framework.Providers | ByNameObjectCreator | Dynamic object creation by class name |

---

## 5. Runner — CLI Verbs

System.CommandLine verbs (via [Verb] attribute on Options records):

| Verb | Options Class | Required Args | Key Flags | Purpose |
|---|---|---|---|---|
| run | RunOptions | ConfigurationFile | -s (serve-results), -e (empty-allure), -g (global), -l (logger) | Execute complete test cycle (data → assertions) |
| act | ActOptions | ConfigurationFile | -s, -e, -g, -l | Execute without assertions; save session data |
| assert | AssertOptions | ConfigurationFile | -s, -g, -l | Run assertions only on existing session data |
| execute | ExecuteOptions | ExecutionFile | -s (serve-results), -e (empty-allure), -c (command-ids), --no-process-exit | Batch execute multiple commands from file |
| template | TemplateOptions | ConfigurationFile | -g, -l | Dump resolved YAML config (post-placeholder substitution) |

**All verbs inherit from LoggerOptions (base logger configuration).**

---

## 6. Runner — CLI Options Hierarchy

Options classes (System.CommandLine record types):

LoggerOptions (base)
  - BaseOptions (abstract, inherits LoggerOptions)
    - RunOptions
    - ActOptions
    - AssertOptions
  - AssertableOptions (serves Run/Act/Assert)
  - ExecuteOptions (batch execution)
  - TemplateOptions (config templating)

**Key properties:**
- ConfigurationFile (required, uses [Value(0)] for positional arg)
- ServeResultsFolder (-s flag, optional, auto-computes AutoServeTestResults bool)
- EmptyAllureDirectory (-e flag, default false)
- CommandIdsToRun (-c flag, comma-separated IDs)
- NoProcessExit (--no-process-exit flag, for embedded runners)

---

## 7. Runner — Configuration Layering & Loading

**Config precedence (highest to lowest):**

1. CLI flags (e.g., -s, -e)
2. YAML execution file (ExecuteOptions.ConfigurationFile)
3. Environment variables (if supported, typically QAAS_* prefix)
4. Hardcoded defaults (in Options properties: Default = false, etc.)

**Loading flow:**
Bootstrap.New() 
  → RunLoader.Load(configFile)
  → ExecutionBuilder.Build()
  → Runner.Run()
  → IReporter.WriteTestResults()

---

## 8. Runner — Reporters / Output Formats

Reporter interface and implementations:

| Reporter Type | Namespace | Methods | Purpose |
|---|---|---|---|
| IReporter | QaaS.Runner.Assertions | WriteTestResults(AssertionResult) | Abstract output interface |
| BaseReporter | QaaS.Runner.Assertions | Implements IReporter | Base implementation (properties: SaveSessionData, SaveAttachments, DisplayTrace, EpochTestSuiteStartTime) |
| AllureReporter | QaaS.Runner.Assertions | Extends BaseReporter | Allure TestOps integration (wrapped by AllureWrapper) |
| (ReportPortal) | (Configured) | (Via configuration) | ReportPortal integration (mentioned in graph hyperedges) |

**Output artifacts:**
- Session data (if SaveSessionData = true)
- Attachments (if SaveAttachments = true)
- Trace logs (if DisplayTrace = true)
- Allure results folder (default: allure-results/)

---

## 9. Cross-Cuts (Framework ↔ Runner)

| Pattern | Framework Component | Runner Component | Use Case |
|---|---|---|---|
| Configuration pipeline | ConfigurationUtils, ConfigurationPlaceholderParser, ConfigurationReferencesParser | BaseLoader, ExecuteLoader | Runner loads YAML; Framework resolves placeholders & references |
| Execution lifecycle | BaseExecution, BaseExecutionBuilder | SessionLogic, AssertionLogic, ReportLogic | Runner orchestrates 3-level concurrency; Framework provides context |
| Logging | IElasticLoggingDefaultsProvider | LoggerOptions (all verbs) | Unified Elasticsearch logging across test execution |
| Hook discovery | ILogic, HookProvider | Tests may register [BeforeExecution], [AfterExecution] | Test lifecycle hooks resolved at runtime |
| Data parallelism | (Protocols/Serializers) | SessionLogic (3-level: sessions → transactions → iterables) | Framework protocols feed Runner's parallel execution model |

---

## 10. Framework — Deprecated Items

**Search Result:** No [Obsolete] attributes found in public API.
**Status:** All public attributes and interfaces are active.

---

## Gaps — Missing Documentation Pages

### Framework Gaps

| Item | Should Exist At | Severity |
|---|---|---|
| Lifecycle attributes ([BeforeExecution], [AfterExecution], etc.) | docs/framework/lifecycle-attributes.md | HIGH — Core test authoring pattern |
| Validation attributes comprehensive guide | docs/framework/validation-attributes.md | HIGH — 20+ attributes; not all have examples |
| ILogic interface & hook discovery | docs/framework/extension-points/logic-hooks.md | HIGH — Extension point not documented |
| ConfigurationPlaceholderParser usage | docs/framework/configuration-placeholders.md | MEDIUM — Referenced by Runner; placeholder syntax unclear |
| Configuration collapse (<< operator) | docs/framework/configuration-collapse.md | MEDIUM — Undocumented syntax feature |
| HookProvider & hook registration patterns | docs/framework/extension-points/hook-provider.md | MEDIUM — How to register custom hooks |

### Runner Gaps

| Item | Should Exist At | Severity |
|---|---|---|
| CLI verb reference (complete) | docs/qaas/cli-verbs-reference.md | HIGH — Core user interface |
| execute verb & batch execution workflows | docs/qaas/execute-batch.md | HIGH — Distinct from run; needs examples |
| Config layering & precedence rules | docs/qaas/config-layering.md | MEDIUM — How CLI flags override YAML |
| Reporter architecture & custom reporter guide | docs/qaas/custom-reporters.md | MEDIUM — How to implement IReporter |
| Three-level concurrency model (Sessions → Transactions → Iterables) | docs/runner/concurrency-model.md | MEDIUM — Performance tuning reference |
| Exit codes & error handling | docs/qaas/exit-codes.md | LOW — Not documented; impacts CI/CD |

### High-Priority Cross-Cuts

| Gap | Should Exist At | Severity |
|---|---|---|
| Framework SDK builder fluent API | docs/framework/sdk-builders.md | HIGH — ContextBuilder, DataSourceBuilder not documented |
| Configuration resolution pipeline (placeholder → reference → validation) | docs/framework/config-pipeline.md | HIGH — Framework-Runner handoff unclear |
| Protocol layer & extensibility (adding new system support) | docs/framework/protocol-extension.md | MEDIUM — How to add HTTP, gRPC, SFTP, etc. |

---

## Summary Statistics

| Category | Count | Status |
|---|---|---|
| Framework Validation Attributes | 20 | Mostly undocumented |
| Framework Extension Points | 6 | Interfaces defined, guidance missing |
| Framework Configuration Sections | 8 | Structure known, semantics incomplete |
| Runner CLI Verbs | 5 | Options defined, comprehensive guide missing |
| Runner Reporters | 2 implemented + 1 abstraction | Architecture not documented |
| High-Priority Doc Gaps | 6 (Framework) + 5 (Runner) + 3 (Cross-cuts) | 14 critical pages needed |

---

## Next Steps (for PR #43)

1. Immediate: Create stub pages for all 14 high-priority gaps
2. Phase 1: Author framework validation attributes guide (draw from CustomValidationAttributes/ source)
3. Phase 2: Author CLI reference (draw from all Options/*.cs classes)
4. Phase 3: Author configuration pipeline guide (diagram: placeholder → reference → validation)
5. Phase 4: Cross-link lifecycle attributes ↔ hook discovery ↔ ILogic interface
