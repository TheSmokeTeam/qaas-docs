# Plugins

QaaS Plugins are C# NuGet packages that contain **QaaS hooks**, extensibility points that integrate with the QaaS framework. To qualify as a QaaS Plugin, a package must use the `QaaS.Framework.SDK` NuGet package.

---

## Built-in Plugins

Examples of built-in QaaS Plugins include:

- [QaaS.Common.Generators]({{ links.repository_generators }})
- [QaaS.Common.Assertions]({{ links.repository_assertions }})
- [QaaS.Common.Probes]({{ links.repository_probes }})

---

## Plugin System Architecture

The plugin system is organized around hook assemblies discovered and loaded through the framework SDK at runtime.
