# QaaS.Framework.Providers

`QaaS.Framework.Providers` is the Framework solution's hook-discovery and hook-loading package. It is responsible for finding hook implementations in the current process, resolving the configured hook type, creating the hook instance, injecting `Context`, validating configuration, and registering the final hook collection into Autofac.

## What this project contains

### Hook metadata and object creation

The package starts with two small but important pieces:

- `HookData.cs`, which stores the configured hook name, hook type, and hook configuration
- `ObjectCreation/IByNameObjectCreator.cs` and `ObjectCreation/ByNameObjectCreator.cs`, which create a runtime instance of the resolved type

This separation lets the package keep configuration data and object creation concerns independent.

### Hook discovery and resolution

The core discovery implementation lives in:

- `Providers/IHookProvider.cs`
- `Providers/HookProvider.cs`

`HookProvider<THook>` scans assemblies, finds supported subclasses of the requested hook contract, resolves the requested type name, and creates the instance through `IByNameObjectCreator`.

### Validation-aware loading

`HooksFromProvidersLoader.cs` is the layer that takes configured `HookData<THook>` records and turns them into initialized hook instances. It also runs `LoadAndValidateConfiguration(...)` and adds hook-specific prefixes to validation failures so downstream applications can tell which configured hook produced each error.

### Autofac integration

`Modules/HooksLoaderModule.cs` is the Autofac module for this package. It wires together:

- the hook provider
- the provider-backed loader
- the final resolved `IList<KeyValuePair<string, THook>>`

This is the registration output that downstream applications usually consume after the container is built.

## Current behavior

The current implementation behaves as follows:

- discovery starts from the entry assembly
- discovery also includes assemblies already loaded in the current AppDomain
- discovery also scans every `.dll` in the application base directory
- dynamic or broken assemblies are skipped safely during scanning
- resolution prefers exact full type names or assembly-qualified type names
- simple type-name matching is used as a fallback when no exact full-name match was supplied
- duplicate simple names across different assemblies do not always hard-fail; the provider can resolve the first assembly in discovery order and log a warning
- duplicate simple names within the same assembly are treated as an error
- `Context` is assigned to the hook instance before configuration loading and validation
- validation errors are enriched with hook name and type context before they are returned
- `HooksLoaderModule<THook>` exposes the resolved hook collection as `IList<KeyValuePair<string, THook>>`

## Main source areas

The most important files in this package are:

- `HookData.cs`
- `ObjectCreation/ByNameObjectCreator.cs`
- `Providers/HookProvider.cs`
- `HooksFromProvidersLoader.cs`
- `Modules/HooksLoaderModule.cs`
- `CustomExceptions/UnsupportedSubClassException.cs`

## Companion tests

`QaaS.Framework.Providers.Tests` is the sibling test project for this package.

The current tests cover:

- subtype discovery
- lookup by simple name and full name
- missing-hook error handling
- ambiguity handling
- context injection
- validation-error enrichment
- hook metadata storage
- partial-load assembly recovery
- broken-assembly skipping
- Autofac module registration

Representative test files include:

- `ProvidersBehaviorTests.cs`
- `ProvidersCoverageTests.cs`
- `DuplicateHooks.cs`
