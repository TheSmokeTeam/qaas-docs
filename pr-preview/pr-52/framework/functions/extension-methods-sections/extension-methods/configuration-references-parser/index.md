# Extension Methods: Extension Methods / Configuration references parser

> TL;DR: Reference page for Extension Methods: Extension Methods / Configuration references parser.

This page mirrors the `Extension Methods / Configuration references parser` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md).

## `ResolveReferencesInConfiguration`

Source file, signature, and docstring

**Member** `ConfigurationReferencesParser.ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)`

**Kind** `function`

**Declaring Type** `ConfigurationReferencesParser (extension type)`

**Source File** `QaaS.Framework.Configurations/References/ConfigurationReferencesParser.cs`

**Signature**

```csharp
public static IConfiguration ResolveReferencesInConfiguration(this IConfiguration builtConfiguration, ICollection<ReferenceConfig>? referenceConfigs, IList<string>? referenceResolutionPaths, IList<string>? uniqueIdPathRegexes, bool resolveReferencesWithEnvironmentVariables)
```

**Docstring**

Resolves all references in configuration according to loaded reference configs and given referenceResolutionPaths

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
