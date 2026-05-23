---
id: qaas.migration.mocker-yaml
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [migration, mocker, yaml, stubs, triggers, servers]
summary: "Update a 1.x Mocker YAML to the 2.x shape: declare Servers explicitly, attach Triggers per stub, and select servers by name."
---
# Migration: Mocker YAML

> TL;DR — Declare every server in a root `Servers` list, point each stub at a server through `Server: <name>`, and replace inline trigger objects with the typed `Triggers` block.

## When to use {: #when-to-use}

- Your 1.x Mocker YAML used implicit single-server defaults.
- Your stubs use legacy `OnChange` or `OnConsume` keys instead of `Triggers`.

## YAML configuration {: #yaml-configuration}

### 1.x shape (before) {: #before}

```yaml
Stubs:
  - Name: OrdersService
    Url: /orders
    Response:
      Status: 200
      Body: { ok: true }
    OnConsume:
      ChangeAction:
        Mode: Reset
```

### 2.x shape (after) {: #after}

```yaml
Servers:
  - Name: PublicApi
    Host: 0.0.0.0
    Port: 5100

Stubs:
  - Name: OrdersService
    Server: PublicApi
    Url: /orders
    Response:
      Status: 200
      Body: { ok: true }
    Triggers:
      - On: Consume
        ChangeAction:
          Mode: Reset
```

## Edge cases {: #edge-cases}

- A stub without `Server` is rejected; declare at least one entry in `Servers`.
- A trigger `On` value must be `Consume` or `Change`. Other values are rejected by the family schema.
- Multiple triggers may target the same stub. Order is preserved and runs sequentially.

## See also {: #see-also}

- [Mocker family schema](../../assets/schemas/mocker-family-schema.md)
- [Public contract](../public-contract.md)
