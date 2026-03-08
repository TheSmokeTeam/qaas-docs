# QaaS.Framework.Configuration

Shared configuration loading logic and objects. Installed automatically as part of the [SDK](sdk.md) package.

---

## TL;DR

This package enables:

- Loading YAML configurations into C# objects
- Validating those objects using `DataAnnotations`

---

## Quick Start Example

Start by defining a C# `record`:

```csharp
public record Configuration {}
```

To add a field like `Count` of type `int`, simply add it as a property:

```csharp
public record Configuration
{
    public int? Count { get; set; }
}
```

!!! Warning Public Getters and Setters
    Ensure all properties have **public** `get` and `set` accessors.  
    If not, the configuration will fail to load.

The corresponding YAML configuration would be:

```yaml
Count: 1
```

This can now be successfully loaded into the `Configuration` record.

---

### Adding Validation

Use `DataAnnotations` to enforce validation rules. For example, to make `Count` required:

```csharp
public record Configuration
{
    [Required]
    public int? Count { get; set; }
}
```

---

## Usage

Create configuration objects using C# `record` or `class` types with properties that have public getters and setters.

- Use **default values** by initializing properties at declaration.
- Apply **validation rules** via attributes.

### Note on `[Required]` Attribute

The `[Required]` attribute checks for `null`, not for default values.  
Since `int` defaults to `0`, not `null`, a non-null `int` will always pass validation—even if no value was explicitly provided.

> **Solution**: Use `int?` (nullable) when you want to enforce that a value must be explicitly set.

#### Example Usage

```csharp
public record InnerTestConfig
{
    [Required]
    public string? Required { get; set; }

    public string Optional { get; set; } = "default";

    public string OptionalWithDefaultValue { get; set; } = "default";
}

public record TestConfig
{
    [Required]
    public string? Required { get; set; }

    public string Optional { get; set; } = "default";

    public string OptionalWithDefaultValue { get; set; } = "default";

    public InnerTestConfig[] InnerTestConfigs { get; set; }

    public Dictionary<string, InnerTestConfig> InnerTestConfigsDict { get; set; }
}
```

---

## Custom Validation

Additional validation logic can be found in the namespace:  
`QaaS.Framework.Configuration.CustomValidationAttributes`

---

## Package Contents

### `ValidationUtils`

Contains utility functions for advanced object validation using `DataAnnotations`.

### `ConfigurationUtils`

Provides helper methods for loading and managing configurations (e.g., parsing YAML, validating objects).

### `CustomValidationAttributes`

Contains custom validation attributes for use in configuration models (e.g., `MinLength`, `Range`, etc.).

### `ConfigurationCollapseParser`

Supports the YAML `<<` merge key feature, similar to PyYAML and Helm.

#### Example

```yaml
anchor: &anchor
  team: REDA
  key: value

<<: *anchor
key: new_value
```

**Result**

```yaml
team: REDA
key: new_value
```

> The `<<` key must be followed by a dictionary or list.  
> Providing a scalar (e.g., string, number) will throw an exception.

#### Invalid

```yaml
<<: raw_value
```

#### Valid

```yaml
<<:
  key: value
```

> 💡 **Note**: The `<<` merge operation is applied at the top level of the configuration object.

---

## Summary

| Feature                       | Purpose                                      |
|-------------------------------|----------------------------------------------|
| YAML → C# Object Mapping      | Load configuration from YAML files           |
| `DataAnnotations` Support     | Validate configuration structure and values  |
| `ConfigurationCollapseParser` | Handle YAML `<<` merge syntax                |
| Custom Attributes & Utilities | Extend validation and configuration handling |

> **Best Practice**: Always use `public` `get`/`set` accessors and nullable types (`T?`) for required fields.
