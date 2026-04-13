# QaaS Documentation

[![CI](https://github.com/TheSmokeTeam/qaas-docs/actions/workflows/ci.yml/badge.svg)](https://github.com/TheSmokeTeam/qaas-docs/actions/workflows/ci.yml)

Unified documentation for the Quality as a Service (QaaS) platform and its components.

## Sections

| Section | Description |
| ------- | ----------- |
| Runner | Main test orchestration, quick starts, configuration reference, commands, and builders |
| Mocker | Mock server setup, runtime control, configuration reference, commands, and builders |
| Hooks | Assertions, generators, probes, and processors with generated configuration reference |
| Framework | Shared SDK, infrastructure, policies, data sources, and configuration helpers |

## Docs Site

The published docs site is available at:

<https://TheSmokeTeam.github.io/qaas-docs/>

## Local Development

Install dependencies:

```bash
pip install -r requirements.txt
```

Build the site:

```bash
mkdocs build
```

Run a local preview:

```bash
mkdocs serve
```

## Deterministic Reference Docs

Runner, Mocker, and Framework reference pages are generated deterministically.

- Family schema contracts come from `QaaS.PackageMirror`.
- The renderer lives in the external `QaaS.Docs.Generator` repository and is included here as the `tools/QaaS.Docs.Generator` git submodule.
- CLI reference pages come from committed snapshots under `tools/QaaS.Docs.Generator/Snapshots/`.
- Function reference pages come from source-level XML doc comments plus `qaas-docs` placement tags in the sibling product repositories.
- Hook configuration reference pages come from the mirrored family schema hook catalogs.
- Stable schema download assets are mirrored into `docs/assets/` so both the site and the Docker image include downloadable schema files without volatile mirror metadata.

Regenerate and validate the reference docs locally:

```powershell
git submodule update --init --recursive
dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --docs-root $PWD
dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --docs-root $PWD --check --build-site
```

## Repository Layout

```text
qaas-docs/
|-- docs/                         Source markdown and generated reference docs
|-- docs/assets/                  Bundled schema download assets used by the site
|-- mkdocs.yml                    MkDocs configuration
|-- tools/QaaS.Docs.Generator/    Generator submodule and docs orchestration CLI
`-- .github/workflows/ci.yml      Unified docs CI, deploy, Docker publish, and overview update workflow
```

## Tools Folder

The top-level `tools/` folder holds the build and runtime helpers that sit around the docs site itself:

- `tools/nginx.conf`: the minimal Nginx site config used by the runtime image. It serves the prebuilt MkDocs site from `/usr/share/nginx/html` on port `8000`.
- `tools/write_runtime_link_defaults.py`: a build-time helper that snapshots the effective `QAAS_DOCS_*` values into `docs/assets/javascripts/qaas-docs-build-defaults.js` before `mkdocs build`, so the browser knows what the image was built with.
- `tools/docker-entrypoint.d/qaas-docs-runtime-overrides.sh`: a runtime helper executed by the stock Nginx entrypoint. It materializes deployment-time `QAAS_DOCS_*` overrides into `qaas-docs-runtime-overrides.js` without rebuilding the static site.
- `tools/QaaS.Docs.Generator/`: the git submodule that owns deterministic reference-doc generation. It contains the generator library, the `QaaS.Docs.Tools` CLI, schema and navigation renderers, committed CLI snapshots, and its own README.

You may also see `tools/QaaS.Docs.Generator.Tests/` locally after .NET test runs. That path is build output, not authored docs source.

## Automation

The docs repository uses a single workflow: [`.github/workflows/ci.yml`](.github/workflows/ci.yml)

It handles:

- site validation on pushes and pull requests
- GitHub Pages deployment on pushes to `master`
- Docker image publish on tag pushes and manual dispatch
- GitHub repository overview updates from this README on tag pushes and manual dispatch

### Required Secrets And Variables

Docker image publish uses these secrets:

- `DOCKER_USERNAME` or `DOCKERHUB_USERNAME`
- `DOCKER_PASSWORD` or `DOCKERHUB_TOKEN`

Repository overview sync uses:

- `REPOSITORY_OVERVIEW_TOKEN`

This token must be able to update repository metadata for `TheSmokeTeam/qaas-docs`.

Docs URLs are defined with defaults in `mkdocs.yml` and can be overridden during build or CI via environment variables. If you want the header repo label to include a version, pass the exact display value through `QAAS_DOCS_REPO_NAME` during the build.

Core site settings:

| Environment Variable | Setting | Description |
|----------------------|---------|-------------|
| `QAAS_DOCS_SITE_URL` | `site_url` | Public docs site URL |
| `QAAS_DOCS_REPO_NAME` | `repo_name` | Repository display name shown by MkDocs |
| `QAAS_DOCS_REPO_URL` | `repo_url` | Repository URL used by MkDocs |
| `QAAS_DOCS_SOCIAL_GITHUB_URL` | `extra.social[].link` | GitHub social link shown in the site chrome |

External page links used by docs content:

| Environment Variable                                | `extra.links` Key                    | Description                                    |
|-----------------------------------------------------|--------------------------------------|------------------------------------------------|
| `QAAS_DOCS_LINK_DOCS_SITE`                          | `docs_site`                          | Published docs site URL                        |
| `QAAS_DOCS_LINK_REPOSITORY_DOCS`                    | `repository_docs`                    | `qaas-docs` repository URL                     |
| `QAAS_DOCS_LINK_REPOSITORY_RUNNER`                  | `repository_runner`                  | QaaS.Runner repo URL                           |
| `QAAS_DOCS_LINK_REPOSITORY_MOCKER`                  | `repository_mocker`                  | QaaS.Mocker repo URL                           |
| `QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS` | `repository_mocker_communication_objects` | QaaS.Mocker communication objects repo URL |
| `QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK`               | `repository_framework`               | QaaS.Framework repo URL                        |
| `QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS`              | `repository_assertions`              | QaaS.Common.Assertions repo URL                |
| `QAAS_DOCS_LINK_REPOSITORY_GENERATORS`              | `repository_generators`              | QaaS.Common.Generators repo URL                |
| `QAAS_DOCS_LINK_REPOSITORY_PROBES`                  | `repository_probes`                  | QaaS.Common.Probes repo URL                    |
| `QAAS_DOCS_LINK_REPOSITORY_PROCESSORS`              | `repository_processors`              | QaaS.Common.Processors repo URL                |
| `QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE`         | `repository_runner_template`         | QaaS.Runner.Template repo URL                  |
| `QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE`         | `repository_mocker_template`         | QaaS.Mocker.Template repo URL                  |
| `QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE`  | `repository_runner_quickstart_code`  | DummyAppTests code quick-start URL             |
| `QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML`  | `repository_runner_quickstart_yaml`  | DummyAppTests YAML quick-start URL             |
| `QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE`  | `repository_mocker_quickstart_code`  | DummyAppMock code quick-start URL              |
| `QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML`  | `repository_mocker_quickstart_yaml`  | DummyAppMock YAML quick-start URL              |
| `QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE`          | `allure_installation_guide`          | Allure CLI installation guide URL              |
| `QAAS_DOCS_LINK_DOTNET_SDK`                         | `dotnet_sdk`                         | .NET SDK download URL                          |
| `QAAS_DOCS_LINK_QAAS_COMMUNITY`                     | `qaas_community`                     | QaaS community URL                             |
| `QAAS_DOCS_LINK_NUGET_FEED`                         | `nuget_feed`                         | NuGet `NuGet.Config` feed link                 |
| `QAAS_DOCS_LINK_ARTIFACTORY`                        | `artifactory`                        | Artifactory base URL                           |
| `QAAS_DOCS_LINK_RUNNER_SCHEMA`                      | `runner_schema`                      | QaaS.Runner schema URL                         |
| `QAAS_DOCS_LINK_MOCKER_SCHEMA`                      | `mocker_schema`                      | QaaS.Mocker schema URL                         |

If `DOCKERHUB_REPOSITORY` is not set, CI uses `${DOCKER_USERNAME}/${repo-name}`.

## Docker

Build locally:

```bash
docker build -t qaas-docs .
docker run -p 8000:8000 qaas-docs
```

The image prebuilds the static site during `docker build` and the runtime image only serves the generated files through Nginx on port `8000`.

If you need different docs URLs or repository links baked into the image, pass the overrides at build time:

```bash
docker build -t qaas-docs \
  --build-arg QAAS_DOCS_SITE_URL=https://docs.example.com/qaas/ \
  --build-arg QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/example/QaaS.Runner \
  .
```

You can also override the same `QAAS_DOCS_*` URLs at container startup. The runtime image keeps the stock Nginx entrypoint and writes a small runtime override file from `/docker-entrypoint.d`, so no custom Dockerfile `ENTRYPOINT` is required:

```bash
docker run \
  -p 8000:8000 \
  -e QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/example/QaaS.Runner \
  -e QAAS_DOCS_LINK_QAAS_COMMUNITY=https://discord.gg/example \
  qaas-docs
```

Runtime `QAAS_DOCS_*` variables do not rebuild the static site. They only replace the configured outbound URLs in the served HTML, so the same image can be reused across environments while preserving the default values when no runtime overrides are provided.
