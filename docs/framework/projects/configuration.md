# QaaS.Framework.Configurations

`QaaS.Framework.Configurations` is the Framework solution's configuration engine. It is a standalone package that other QaaS packages reference, including [QaaS.Framework.SDK](./sdk.md). Its responsibility is broader than loading YAML into C# objects. It owns the full flow of building configuration, preprocessing it, binding it, validating it, and updating it.

## What this project contains

### Core configuration utilities

`ConfigurationUtils.cs` is the main entry point for package-level operations. It contains helpers for:

- building YAML from typed objects
- flattening object graphs into configuration key paths
- binding `IConfiguration` into typed objects
- loading and validating a configuration object in one step
- running the package's enriched build flow

`ValidationUtils.cs` contains recursive validation helpers. The validation flow walks nested objects, collections, and dictionaries and returns path-aware validation results instead of validating only the top-level object.

### Preprocessing and build pipeline

The preprocessing layer is split into dedicated files:

- `ConfigurationPlaceHolderParser.cs` resolves placeholders such as `${Path}` and `${Path ?? default}`.
- `ConfigurationCollapseParser.cs` processes YAML `<<` collapse sections.
- `ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs` adds YAML files to a configuration builder.
- `ConfigurationProviders/HttpGetYamlConfigurationProvider.cs` and `ConfigurationSources/HttpGetYamlConfigurationSource.cs` let the builder load YAML over HTTP GET.

This means the package can build configuration from local files, configuration folders, and remote YAML sources before the final binding step happens.

### Binding and merge internals

The `ConfigurationBindingUtils` folder contains the lower-level binding helpers that make the public APIs work with nested configuration shapes:

- `ConfigurationDictionaryUtils.cs`
- `ConfigurationListUtils.cs`
- `ConfigurationMergeUtils.cs`
- `ConfigurationTypeUtils.cs`

These files are responsible for mapping configuration sections into objects, lists, dictionaries, and enums, and for merging partial configuration trees without replacing every existing value.

`ConfigurationUpdateExtensions.cs` exposes the public update surface for applying sparse configuration patches to existing typed objects or configuration trees.

### References

The `References` folder contains the project's reference-expansion subsystem:

- `ReferenceConfig.cs`
- `ConfigurationReferencesParser.cs`

This logic resolves referenced YAML files and injects referenced content into the active configuration according to the configured replacement rules.

### Validation attributes and shared configuration objects

The package contains a substantial custom validation library under `CustomValidationAttributes`. These attributes supplement standard `DataAnnotations` with QaaS-specific rules such as conditional required or null behavior, path validation, uniqueness checks, and cross-collection reference checks.

The `CommonConfigurationObjects` folder provides shared configuration types reused by other packages, including:

- filesystem-related storage configuration
- S3 bucket configuration
- Mongo collection configuration
- shared storage abstractions

## Current behavior

The current source implements the following behavior:

- YAML can be loaded from local paths or from HTTP URLs through the same builder flow.
- Placeholder resolution supports nested references, default values via `??`, object-section copying, and circular-reference detection.
- `EnrichedBuild` combines placeholder resolution and collapse parsing and can include environment-variable-aware resolution.
- `<<` collapse is applied recursively across the configuration tree, not only at the top level.
- Binding supports nested objects, arrays, dictionaries, enums, and configuration-as-code merge scenarios.
- Standard public-property binding is supported out of the box, and the lower-level binding utilities also support non-public binding when binder options enable it.
- Recursive validation returns errors that preserve the path of the invalid value, which is important for large configuration graphs.
- Partial updates can merge sparse typed objects or raw `IConfiguration` trees without discarding omitted values.
- Reference resolution can inject and reorder list items based on `ReferenceConfig` instructions.

## Main source areas

If you are reading the package to understand its responsibilities, these are the highest-signal files and folders:

- `ConfigurationUtils.cs`
- `ValidationUtils.cs`
- `ConfigurationPlaceHolderParser.cs`
- `ConfigurationCollapseParser.cs`
- `ConfigurationUpdateExtensions.cs`
- `ConfigurationBuilderExtensions/`
- `ConfigurationProviders/`
- `ConfigurationSources/`
- `ConfigurationBindingUtils/`
- `References/`
- `CustomValidationAttributes/`
- `CommonConfigurationObjects/`

## Companion tests

`QaaS.Framework.Configurations.Tests` is the sibling test project for this package. It is important because it documents behavior that the old docs did not capture well.

The current test suite covers:

- YAML emission and configuration flattening
- nested binding into objects, lists, dictionaries, and enums
- placeholder defaults, object placeholders, and circular-placeholder errors
- recursive `<<` collapse behavior
- environment-variable-aware build paths
- reference replacement and index-shift behavior
- recursive validation with path-aware error messages
- sparse typed updates and raw configuration patching
- HTTP YAML provider success and failure paths
- the custom validation attributes and shared configuration objects

Representative test files include:

- `ConfigurationUtilitiesTests.cs`
- `ConfigurationObjectValidationTests.cs`
- `ConfigurationUpdateExtensionsTests.cs`
- `HttpGetYamlConfigurationProviderTests.cs`
- `AdvancedCustomValidationAttributesTests.cs`
- `CustomValidationAttributesBehaviorTests.cs`
