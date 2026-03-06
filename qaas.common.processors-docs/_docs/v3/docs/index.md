# QaaS.Common.Processors

`QaaS.Common.Processors` contains reusable transaction processors that can be loaded by `QaaS.Mocker` projects.

Use this package when you want a ready-made processor instead of starting from a custom `BaseTransactionProcessor<TConfiguration>` implementation.

## Usage

Add the package to your mocker project:

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
</ItemGroup>
```

The pages in this site describe the built-in processors and the configuration each one expects.
