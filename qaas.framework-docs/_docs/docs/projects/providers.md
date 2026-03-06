# QaaS.Framework.Providers

## Overview

The providers enable dynamic loading and registration of hooks into an Autofac `ContainerBuilder`. It discovers hooks
from the current project and loaded plugins (via DLLs), validates their configurations, and registers them for use.

Hooks must implement `IHook` and are resolved by name from assemblies.

---

## Key Components

### `HookData<THook>`

- **Purpose**: Metadata container for a hook (name, type, config).
- **Fields**:
  - `Name`: Hook identifier.
  - `Type`: Class name of the hook implementation.
  - `Configuration`: Configuration settings for the hook.

### `IHookProvider<THook>`

- **Interface** defining how to retrieve a hook by name.
- **Method**: `GetSupportedInstanceByName(string instanceName)` → returns initialized hook.

### `HookProvider<THook>`

- **Implementation** of `IHookProvider<THook>`.
- **Functionality**:
  - Scans entry assembly and all referenced `.dll` files.
  - Finds classes that implement `THook` and match the given name.
  - Uses `IByNameObjectCreator` to instantiate the hook.
  - Logs discovery and errors.

### `HooksFromProvidersLoader<THook>`

- **Responsible for**:
  - Loading and validating hooks from `HookData<THook>` list.
  - Invoking `LoadAndValidateConfiguration()` on each hook.
  - Aggregating validation results with context-specific messages.

### `HooksLoaderModule<THook>`

- **Autofac module** to register the entire hook system.
- **Registers**:
  - `HookProvider<THook>` → `IHookProvider<THook>`
  - `HooksFromProvidersLoader<THook>`
  - A factory that resolves all hooks and populates `ValidationResults`.

---

## Usage

Ensure all hooks implement `IHook`.

Register the module in your `ContainerBuilder`:

```csharp
var builder = new ContainerBuilder();
builder.RegisterModule(new HooksLoaderModule<MyHook>(validationResults));
```

Provide:

- `Context` (via Autofac).
- `IByNameObjectCreator`.
- `IEnumerable<HookData<MyHook>>` (e.g., from configuration).

After building, access loaded hooks via:

   ```csharp
   var hooks = container.Resolve<IList<KeyValuePair<string, MyHook>>>();
   ```

---

## Validation

- All hooks are validated via `LoadAndValidateConfiguration()` during load.
- Validation errors are enriched with hook name and type context.
- Results collected in `List<ValidationResult>` passed to `HooksLoaderModule`.

---

## Plugin Support

Hooks can be loaded from:

- The main project (entry assembly).
- Any `.dll` in the application directory.

No additional setup required — all assemblies are scanned automatically.
