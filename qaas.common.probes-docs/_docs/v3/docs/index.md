# QaaS.Common.Probes

`QaaS.Common.Probes` contains reusable probe hooks that can be loaded by `QaaS.Runner` projects.

Use this package when a test needs setup, cleanup, or environment manipulation that should happen as part of the session flow without producing normal session input or output records.

## Usage

Add the package to your test project:

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
</ItemGroup>
```

Typical use cases:

- clean queues, buckets, indices, or caches before a run
- restart or mutate infrastructure in OpenShift
- prepare or reset environment state between stages

The pages in this site group the available probes by target system so it is easier to find the right hook quickly.
