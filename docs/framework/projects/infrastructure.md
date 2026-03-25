# QaaS.Framework.Infrastructure

`QaaS.Framework.Infrastructure` is the smallest runtime package in the Framework solution. It does not define a large subsystem on its own. Instead, it provides a few shared primitives that other packages reuse when they need consistent time conversion, filesystem-safe names, or a simple domain-builder contract.

## What this project contains

### `DateTimeExtensions.cs`

This file contains the package's time-conversion helpers:

- `ConvertDateTimeToUtcByTimeZoneOffset` converts a local time to UTC by using the supplied summer-time offset.
- `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset` converts a UTC timestamp back to local time by using the same offset model.

The implementation also contains a private daylight-saving helper that resolves Israel timezone rules by using the platform-specific timezone id. That internal helper is part of how the public conversion methods decide whether daylight saving should affect the calculated offset.

### `FileSystemExtensions.cs`

This file contains `MakeValidDirectoryName`, a small helper that replaces invalid filesystem characters with underscores so the resulting string can be used as a directory name on the current operating system.

### `IDomainBuilder.cs`

This file contains the generic `IDomainBuilder<T>` contract. It is intentionally simple and exposes a single `Register()` method for packages that need a common builder-style registration shape.

## Current role in the solution

The project stays deliberately narrow:

- It is the shared place for the framework's offset-based date and time conversion helpers.
- It contains the filename sanitization helper used when other packages need a safe directory name.
- It exposes `IDomainBuilder<T>` as a reusable contract instead of duplicating that interface in multiple packages.

## Companion tests

There is currently no `QaaS.Framework.Infrastructure.Tests` project in `QaaS.Framework.sln`. Infrastructure behavior is therefore covered only indirectly through the packages that consume these helpers.
