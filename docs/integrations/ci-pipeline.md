---
id: integrations.ci-pipeline
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner, mocker, packagemirror, elasticbootstrap]
keywords: [github actions, ci, packagemirror, elasticbootstrap, allure, runner, mocker]
summary: "Wire a GitHub Actions workflow that restores QaaS NuGets from PackageMirror, boots Elasticsearch via ElasticBootstrap, runs a mocker sidecar, executes the runner, and uploads Allure results."
---

# CI Pipeline — GitHub Actions

> TL;DR — One workflow that combines PackageMirror, ElasticBootstrap, a mocker sidecar, the runner, and Allure artifact upload into a reproducible CI job.

## When to use {: #when-to-use}

- You are moving a runner repo from "works on my laptop" to CI and want a known-good starting point.
- You need to combine PackageMirror (offline NuGets), ElasticBootstrap (provisioned ES indices/templates), a mocker sidecar, and Allure reporting in one job.
- You want an example that fails loudly when the runner exits non-zero and still uploads diagnostics on failure.

## YAML configuration {: #yaml}

```yaml
# .github/workflows/qaas.yml
name: QaaS

on:
  push:
    branches: ["**"]
  pull_request:
  workflow_dispatch:

env:
  DOTNET_NOLOGO: true
  DOTNET_CLI_TELEMETRY_OPTOUT: true
  CONFIGURATION: Release
  PACKAGE_MIRROR_URL: https://example.org/qaas-mirror/2026.05.tgz
  ELASTIC_URL: http://127.0.0.1:9200
  MOCKER_IMAGE: ghcr.io/example/qaas-routing-mocker:latest

jobs:
  qaas:
    name: Runner + Mocker smoke
    runs-on: ubuntu-latest
    timeout-minutes: 25

    services:
      rabbitmq:
        image: rabbitmq:3-management
        ports: ["5672:5672", "15672:15672"]
        env:
          RABBITMQ_DEFAULT_USER: admin
          RABBITMQ_DEFAULT_PASS: admin
        options: >-
          --health-cmd "rabbitmq-diagnostics ping"
          --health-interval 5s
          --health-retries 12

      elasticsearch:
        image: docker.elastic.co/elasticsearch/elasticsearch:8.13.0
        ports: ["9200:9200"]
        env:
          discovery.type: single-node
          xpack.security.enabled: "false"
        options: >-
          --health-cmd "curl -sf http://localhost:9200/_cluster/health || exit 1"
          --health-interval 10s
          --health-retries 20

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-dotnet@v4
        with:
          dotnet-version: 10.0.x

      - name: Fetch PackageMirror snapshot
        run: |
          mkdir -p .nuget/mirror
          curl -sSL "$PACKAGE_MIRROR_URL" -o /tmp/mirror.tgz
          tar -xzf /tmp/mirror.tgz -C .nuget/mirror
          cat > NuGet.config <<EOF
          <?xml version="1.0" encoding="utf-8"?>
          <configuration>
            <packageSources>
              <clear />
              <add key="qaas-mirror" value="$PWD/.nuget/mirror" />
            </packageSources>
          </configuration>
          EOF

      - name: Restore
        run: dotnet restore MyTests.sln --configfile NuGet.config

      - name: Build
        run: dotnet build MyTests.sln -c ${{ env.CONFIGURATION }} --no-restore

      - name: Bootstrap Elasticsearch
        run: |
          dotnet tool install -g QaaS.ElasticBootstrap
          export PATH="$PATH:$HOME/.dotnet/tools"
          qaas-elastic-bootstrap apply \
            --elastic-url "$ELASTIC_URL" \
            --config infra/elastic.qaas.yaml

      - name: Pull and start mocker
        run: |
          docker pull "$MOCKER_IMAGE"
          docker run -d --name mocker --network host \
            -v "$PWD/MyTests/Fixtures:/app/Fixtures:ro" \
            "$MOCKER_IMAGE" run /app/mocker.qaas.yaml
          for i in $(seq 1 30); do
            curl -sf http://127.0.0.1:8081/healthz && break
            sleep 1
          done

      - name: Run QaaS
        run: |
          cd MyTests/bin/${{ env.CONFIGURATION }}/net10.0
          dotnet MyTests.dll run test.qaas.yaml

      - name: Collect mocker logs
        if: always()
        run: docker logs mocker > mocker.log 2>&1 || true

      - name: Upload Allure results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: allure-results-${{ github.run_id }}
          path: MyTests/bin/${{ env.CONFIGURATION }}/net10.0/allure-results/

      - name: Tear down mocker
        if: always()
        run: docker rm -f mocker || true
```

## C# (CAC) usage {: #csharp}

No additional C# is required:

```csharp
QaaS.Runner.Bootstrap.New(args).Run();   // MyTests/Program.cs
QaaS.Mocker.Bootstrap.New(args).Run();   // baked into MOCKER_IMAGE
```

## Minimal example {: #example-minimal}

Stripped to RabbitMQ + runner only:

```yaml
name: CI
on: [push, pull_request, workflow_dispatch]
env:
  CONFIGURATION: Release
jobs:
  build-smoke:
    runs-on: ubuntu-latest
    services:
      rabbitmq:
        image: rabbitmq:3-management
        ports: ["5672:5672"]
        env: { RABBITMQ_DEFAULT_USER: admin, RABBITMQ_DEFAULT_PASS: admin }
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-dotnet@v4
        with: { dotnet-version: 10.0.x }
      - run: dotnet restore MyTests.sln --configfile NuGet.config
      - run: dotnet build MyTests.sln -c $CONFIGURATION --no-restore
      - run: |
          cd MyTests/bin/$CONFIGURATION/net10.0
          dotnet MyTests.dll run test.qaas.yaml
```

## Realistic example {: #example-realistic}

Matrix over runner version so PRs prove compatibility with both the previous and the current release:

```yaml
strategy:
  fail-fast: false
  matrix:
    runner: ["4.2.0", "4.3.2"]
steps:
  - name: Override QaaS.Runner version
    run: |
      sed -i "s/QaaS\\.Runner\" Version=\"[^\"]*\"/QaaS.Runner\" Version=\"${{ matrix.runner }}\"/g" \
        MyTests/MyTests.csproj
```

Local mirror of the workflow via docker compose:

```yaml
services:
  rabbitmq:
    image: rabbitmq:3-management
    ports: ["5672:5672", "15672:15672"]
    environment:
      RABBITMQ_DEFAULT_USER: admin
      RABBITMQ_DEFAULT_PASS: admin
    healthcheck:
      test: ["CMD", "rabbitmq-diagnostics", "ping"]
      interval: 5s
      retries: 12
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.13.0
    ports: ["9200:9200"]
    environment:
      discovery.type: single-node
      xpack.security.enabled: "false"
```

Run locally:

```bash
docker compose -f infra/local.compose.yml up -d
qaas-elastic-bootstrap apply --elastic-url http://127.0.0.1:9200 --config infra/elastic.qaas.yaml
docker run -d --name mocker --network host ghcr.io/example/qaas-routing-mocker:latest run /app/mocker.qaas.yaml
( cd MyTests/bin/Release/net10.0 && dotnet MyTests.dll run test.qaas.yaml )
docker rm -f mocker
docker compose -f infra/local.compose.yml down
```

## Edge cases {: #edge-cases}

- `services:` containers and the job both see `localhost`, but only host-network containers do. If you cannot use `--network host`, expose the mocker via `docker run -p 8081:8081` and point the runner at `127.0.0.1:8081`.
- The runner's exit code is the job's exit code. Do not wrap it in `|| true`. Use `if: always()` on artifact steps to still upload on failure.
- PackageMirror integrity — when bumping the snapshot URL, verify the tarball's checksum in CI. PackageMirror emits a manifest with hashes; check it before extracting.
- `xpack.security.enabled=false` is for CI only. Production ElasticBootstrap configs carry credentials via configuration placeholders.
- The mocker container needs a readiness loop; `docker run -d` returns before the listener binds.
- Allure CLI is not installed in the workflow — only the runner's JSON output is collected. Render the report in a downstream job.

## See also {: #see-also}

- [Integrations — Kiwix MCP](kiwix-mcp.md)
- [Runner — run command](../qaas/userInterfaces/runner/commands/run.md)
- [Debug a failed test](../qaas/quickStart/debugTestFailure.md)
