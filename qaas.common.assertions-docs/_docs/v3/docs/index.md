# QaaS.Common.Assertions

`QaaS.Common.Assertions` contains reusable assertion hooks that can be loaded by `QaaS.Runner` projects.

Use this package when you want ready-made checks instead of writing a custom assertion immediately. The pages in this site document the currently available assertions, what each one is for, and which configuration fields it expects.

## Usage

Add the package to your test project:

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
</ItemGroup>
```

Keep the assertion package version compatible with the runner and framework packages used by the same project.
