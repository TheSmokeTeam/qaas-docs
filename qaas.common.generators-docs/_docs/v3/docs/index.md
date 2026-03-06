# QaaS.Common.Generators

`QaaS.Common.Generators` contains reusable generator hooks that can be loaded by `QaaS.Runner` projects and, when needed, by `QaaS.Mocker` data sources.

Use this package when you want to build data sources from files, schemas, S3 objects, other data sources, or composed generator flows without writing a custom generator first.

## Usage

Add the package to your project:

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
</ItemGroup>
```

Keep the generator package version compatible with the runner, mocker, and framework packages used by the same project.
