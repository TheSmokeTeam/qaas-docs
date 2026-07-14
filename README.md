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
python tools/write_runtime_link_defaults.py docs/assets/javascripts/qaas-docs-build-defaults.js
mkdocs build
```

Run a local preview:

```bash
mkdocs serve
```

Install the tracked pre-commit hook:

```bash
git config core.hooksPath .githooks
```

The hook runs `markdownlint-cli2`, strict MkDocs build, `llms.txt` validation,
and offline `lychee` against the rendered site check root.

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
- ZIM creation, `qaas-docs:latest` image archiving, smoke-testing, artifact upload, and GitHub release attachment on tag pushes
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
| `QAAS_DOCS_LINK_AWS_S3_USER_METADATA`               | `aws_s3_user_metadata`               | Amazon S3 user-defined metadata guide          |
| `QAAS_DOCS_LINK_AWS_S3_HEAD_OBJECT`                 | `aws_s3_head_object`                 | Amazon S3 `HeadObject` API reference           |
| `QAAS_DOCS_LINK_AWS_S3_LIST_OBJECTS_V2`             | `aws_s3_list_objects_v2`             | Amazon S3 `ListObjectsV2` API reference        |
| `QAAS_DOCS_LINK_AWS_S3_PREFIXES`                    | `aws_s3_prefixes`                    | Amazon S3 prefix and delimiter guide           |
| `QAAS_DOCS_LINK_REGEX101_PLACEHOLDER`               | `regex101_placeholder`               | Generated placeholder-regex test link          |
| `QAAS_DOCS_LINK_JSON_SCHEMA_FOR_HUMANS`             | `json_schema_for_humans`             | Schema renderer project link                   |
| `QAAS_DOCS_LINK_RUNNER_SCHEMA`                      | `runner_schema`                      | QaaS.Runner schema URL                         |
| `QAAS_DOCS_LINK_MOCKER_SCHEMA`                      | `mocker_schema`                      | QaaS.Mocker schema URL                         |

If `DOCKERHUB_REPOSITORY` is not set, CI uses `${DOCKER_USERNAME}/${repo-name}`.

Docker build image inputs:

| Variable | Dockerfile Argument | Description |
|----------|---------------------|-------------|
| `QAAS_DOCS_MKDOCS_MATERIAL_IMAGE` | `MKDOCS_MATERIAL_IMAGE` | Build-stage MkDocs Material image |
| `QAAS_DOCS_NGINX_IMAGE` | `NGINX_IMAGE` | Runtime Nginx image |

Image references rendered into docs examples:

| Environment Variable | `extra.images` Key | Description |
|----------------------|--------------------|-------------|
| `QAAS_DOCS_IMAGE_DOTNET_SDK` | `dotnet_sdk` | .NET SDK image used in Dockerfile examples |
| `QAAS_DOCS_IMAGE_DOTNET_RUNTIME` | `dotnet_runtime` | .NET runtime image used in Dockerfile examples |
| `QAAS_DOCS_IMAGE_REDIS_REPOSITORY` | `redis_repository` | Redis image repository used in Helm examples |
| `QAAS_DOCS_IMAGE_REDIS_TAG` | `redis_tag` | Redis image tag used in Helm examples |

CI and local tool inputs:

| Variable | Default | Description |
|----------|---------|-------------|
| `QAAS_DOCS_LYCHEE_DOWNLOAD_URL` | `https://github.com/lycheeverse/lychee/releases/latest/download/lychee-x86_64-unknown-linux-gnu.tar.gz` | Lychee archive downloaded by docs validation |
| `QAAS_DOCS_VALE_DOWNLOAD_URL` | `https://github.com/errata-ai/vale/releases/download/v3.14.2/vale_3.14.2_Linux_64-bit.tar.gz` | Vale archive downloaded by docs validation |
| `QAAS_DOCS_HTMLTEST_DOWNLOAD_URL` | `https://github.com/wjdp/htmltest/releases/latest/download/htmltest_0.17.0_linux_amd64.tar.gz` | htmltest archive downloaded by docs validation |
| `QAAS_DOCS_GENERATOR_SUBMODULE_URL` | `https://github.com/TheSmokeTeam/QaaS.Docs.Generator.git` | `QaaS.Docs.Generator` submodule source used by CI |
| `QAAS_DOCS_ZIM_TOOLS_IMAGE` | `ghcr.io/openzim/zim-tools:3.7.0` | Docker image used to build ZIM files when `zimwriterfs` is not installed |
| `QAAS_DOCS_ZIM_TOOLS_DOWNLOAD_URL` | `https://download.openzim.org/release/zim-tools/` | Help link shown when no local or Docker ZIM builder exists |
| `QAAS_DOCS_KIWIX_SERVE_IMAGE` | `ghcr.io/kiwix/kiwix-serve:3.8.2` | Docker image used to smoke-test ZIM files |
| `QAAS_WORKSPACE_ROOT` | `D:/QaaS` | Base path used by the legacy plugin-page generator |
| `QAAS_DOCS_SCHEMA_SOURCE_DIR` | `$QAAS_WORKSPACE_ROOT/QaaS.JsonSchemaExtensions/generated-schemas` | Schema source path used by the legacy plugin-page generator |
| `QAAS_DOCS_ASSERTIONS_SOURCE_ROOT` | `$QAAS_WORKSPACE_ROOT/QaaS.Common.Assertions/QaaS.Common.Assertions` | Assertion source path used by the legacy plugin-page generator |
| `QAAS_DOCS_GENERATORS_SOURCE_ROOT` | `$QAAS_WORKSPACE_ROOT/QaaS.Common.Generators/QaaS.Common.Generators` | Generator source path used by the legacy plugin-page generator |
| `QAAS_DOCS_PROBES_SOURCE_ROOT` | `$QAAS_WORKSPACE_ROOT/QaaS.Common.Probes/QaaS.Common.Probes` | Probe source path used by the legacy plugin-page generator |
| `QAAS_DOCS_PROCESSORS_SOURCE_ROOT` | `$QAAS_WORKSPACE_ROOT/QaaS.Common.Processors/QaaS.Common.Processors` | Processor source path used by the legacy plugin-page generator |

## Docker

Build locally:

```bash
QAAS_DOCS_MKDOCS_MATERIAL_IMAGE=squidfunk/mkdocs-material:9.5
QAAS_DOCS_NGINX_IMAGE=nginx:1.27-alpine

docker build -t qaas-docs \
  --build-arg MKDOCS_MATERIAL_IMAGE="${QAAS_DOCS_MKDOCS_MATERIAL_IMAGE}" \
  --build-arg NGINX_IMAGE="${QAAS_DOCS_NGINX_IMAGE}" \
  .
docker run -p 8000:8000 qaas-docs
```

The image prebuilds the static site during `docker build` and the runtime image only serves the generated files through Nginx on port `8000`.

## ZIM

Every docs build produces a three-file offline bundle: the version-independent OpenZIM asset `qaas-docs.zim`, its machine-readable `qaas-docs-zim-provenance.json`, and `qaas-docs-image.tgz`, a saved Docker image tagged `qaas-docs:latest`. The ZIM metadata is fixed to name `QaaS Documantation`, title `Complete QaaS Documantation`, and a `YYYY-MM-DD` description identifying the UTC date to which the docs were updated. CI validates the contract, smoke-tests the ZIM with `kiwix-serve`, verifies the compressed image archive, and attaches all three files to tag releases.

Build a ZIM locally after installing the MkDocs dependencies:

```bash
tools/zim/build-zim.sh
```

When PackageMirror has not supplied a provenance file, the local builder derives the docs-updated date from the latest docs commit. Set `QAAS_DOCS_UPDATED_DATE_UTC=YYYY-MM-DD` to provide the date explicitly for a standalone build. The output filename remains `qaas-docs.zim`.

If you need different docs URLs or repository links baked into the image, pass the overrides at build time:

```bash
docker build -t qaas-docs \
  --build-arg MKDOCS_MATERIAL_IMAGE="${QAAS_DOCS_MKDOCS_MATERIAL_IMAGE}" \
  --build-arg NGINX_IMAGE="${QAAS_DOCS_NGINX_IMAGE}" \
  --build-arg QAAS_DOCS_SITE_URL=https://docs.example.com/qaas/ \
  --build-arg QAAS_DOCS_LINK_NUGET_FEED=https://nuget.example.com/v3/index.json \
  --build-arg QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/example/QaaS.Runner \
  --build-arg QAAS_DOCS_IMAGE_DOTNET_SDK="${QAAS_DOCS_IMAGE_DOTNET_SDK}" \
  --build-arg QAAS_DOCS_IMAGE_DOTNET_RUNTIME="${QAAS_DOCS_IMAGE_DOTNET_RUNTIME}" \
  --build-arg QAAS_DOCS_IMAGE_REDIS_REPOSITORY="${QAAS_DOCS_IMAGE_REDIS_REPOSITORY}" \
  --build-arg QAAS_DOCS_IMAGE_REDIS_TAG="${QAAS_DOCS_IMAGE_REDIS_TAG}" \
  .
```

`QAAS_DOCS_LINK_NUGET_FEED` controls the NuGet feed URL shown in generated examples and installation snippets. `QAAS_DOCS_IMAGE_*` variables control image references rendered into Dockerfile and Helm examples. These values do not rewrite product repository `NuGet.config` files; templates and sample Dockerfiles should pass their own NuGet source and image names as build inputs before `dotnet restore`.

You can also override the same `QAAS_DOCS_*` URLs and example image references at container startup. The runtime image keeps the stock Nginx entrypoint and writes a small runtime override file from `/docker-entrypoint.d`, so no custom Dockerfile `ENTRYPOINT` is required:

```bash
docker run \
  -p 8000:8000 \
  -e QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/example/QaaS.Runner \
  -e QAAS_DOCS_LINK_QAAS_COMMUNITY=https://discord.gg/example \
  -e QAAS_DOCS_IMAGE_REDIS_REPOSITORY=registry.example.com/library/redis \
  -e QAAS_DOCS_IMAGE_REDIS_TAG=7.2.4 \
  qaas-docs
```

Runtime `QAAS_DOCS_*` variables do not rebuild the static site. They replace the configured outbound URLs and rendered example image references in the served HTML, so the same image can be reused across environments while preserving the default values when no runtime overrides are provided.
