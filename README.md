# QaaS Documentation

[![Deploy Documentation](https://github.com/TheSmokeTeam/qaas-docs/actions/workflows/deploy-docs.yml/badge.svg)](https://github.com/TheSmokeTeam/qaas-docs/actions/workflows/deploy-docs.yml)

Unified documentation for the Quality as a Service (QaaS) platform and its components.

## 📚 Documentation Sections

| Section | Description |
|---------|-------------|
| **Runner** | Main testing framework - architecture, quick start, and advanced concepts |
| **Mocker** | Mock service creation and deployment |
| **Assertions** | Test assertion types and configurations |
| **Generators** | Data generation from various sources |
| **Framework** | Low-level SDK and infrastructure documentation |

## 🚀 Quick Start

### View Documentation Online

Visit the deployed documentation at: **https://TheSmokeTeam.github.io/qaas-docs/**

### Run Locally

1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Start the development server:**
   ```bash
   mkdocs serve
   ```

3. **Open in browser:** http://127.0.0.1:8000

### Build Static Site

```bash
mkdocs build
```

The static site will be generated in the `site/` directory.

## 📁 Project Structure

```
qaas-docs/
├── docs/                    # Unified documentation
│   ├── index.md            # Main landing page
│   ├── qaas/               # Runner docs
│   ├── mocker/             # Mocker docs
│   ├── assertions/         # Assertions library docs
│   ├── generators/         # Generators library docs
│   └── framework/          # Framework docs
├── mkdocs.yml              # MkDocs configuration
├── requirements.txt        # Python dependencies
└── .github/
    └── workflows/
        └── deploy-docs.yml # GitHub Pages deployment
```

## 🔧 Configuration

Update `mkdocs.yml` to customize:
- Site name and URLs
- Navigation structure
- Theme settings
- Plugins and extensions

### Dynamic Links (Environment Variables)

All external links used across the documentation are defined in `mkdocs.yml` under `extra.links` and can be overridden at build time via environment variables.

**Default values** are set in `mkdocs.yml`:

```yaml
extra:
  links:
    repository_org: https://github.com/TheSmokeTeam
    repository_runner: https://github.com/TheSmokeTeam/QaaS.Runner
    repository_mocker: https://github.com/TheSmokeTeam/QaaS.Mocker
    # ... etc.
```

**Override via environment variables** using the `QAAS_DOCS_LINK_` prefix:

```bash
# Local development
export QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/MyOrg/QaaS.Runner
export QAAS_DOCS_LINK_ALLURE_DOCS=https://allure.example.com/docs/
mkdocs serve
```

```bash
# Docker build
docker build \
  --build-arg QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/MyOrg/QaaS.Runner \
  --build-arg QAAS_DOCS_LINK_REPOSITORY_MOCKER=https://github.com/MyOrg/QaaS.Mocker \
  -t qaas-docs .
```

**Available variables:**

| Environment Variable                    | `extra.links` Key        | Description                                    |
|-----------------------------------------|--------------------------|------------------------------------------------|
| `QAAS_DOCS_LINK_REPOSITORY_ORG`         | `repository_org`         | Organization repository URL                    |
| `QAAS_DOCS_LINK_REPOSITORY_DOCS`        | `repository_docs`        | Documentation repo URL                         |
| `QAAS_DOCS_LINK_REPOSITORY_RUNNER`      | `repository_runner`      | QaaS.Runner repo URL                           |
| `QAAS_DOCS_LINK_REPOSITORY_MOCKER`      | `repository_mocker`      | QaaS.Mocker repo URL                           |
| `QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK`   | `repository_framework`   | QaaS.Framework repo URL                        |
| `QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS`  | `repository_assertions`  | QaaS.Common.Assertions repo URL                |
| `QAAS_DOCS_LINK_REPOSITORY_GENERATORS`  | `repository_generators`  | QaaS.Common.Generators repo URL                |
| `QAAS_DOCS_LINK_REPOSITORY_PROBES`      | `repository_probes`      | QaaS.Common.Probes repo URL                    |
| `QAAS_DOCS_LINK_ALLURE_DOCS`            | `allure_docs`            | Allure documentation URL                       |
| `QAAS_DOCS_LINK_ALLURE_INSTALL`         | `allure_install`         | Allure CLI install guide URL                   |
| `QAAS_DOCS_LINK_DOTNET_SDK`             | `dotnet_sdk`             | .NET SDK download URL                          |
| `QAAS_DOCS_LINK_VSCODE_YAML_EXTENSION`  | `vscode_yaml_extension`  | VS Code YAML extension URL                     |
| `QAAS_DOCS_LINK_QAAS_COMMUNITY`         | `qaas_community`         | QaaS community URL                             |
| `QAAS_DOCS_LINK_NUGET_FEED_A`           | `nuget_feed_a`           | NuGet feed A URL                               |
| `QAAS_DOCS_LINK_NUGET_FEED_B`           | `nuget_feed_b`           | NuGet feed B URL                               |
| `QAAS_DOCS_LINK_NUGET_FEED_C`           | `nuget_feed_c`           | NuGet feed C URL                               |
| `QAAS_DOCS_LINK_QAAS_PROJECT_TEMPLATES` | `qaas_project_templates` | QaaS project templates URL                     |
| `QAAS_DOCS_LINK_DUMMYAPP_TESTS`         | `dummyapp_tests`         | DummyApp test project URL                      |
| `QAAS_DOCS_LINK_DUMMYAPP_HELM_CHART`    | `dummyapp_helm_chart`    | DummyApp Helm chart URL                        |
| `QAAS_DOCS_LINK_ARTIFACTORY`            | `artifactory`            | Artifactory base URL                           |
| `QAAS_DOCS_LINK_REPOSITORY_MODULES`     | `repository_modules`     | QaaS.Common.Modules repository URL             |
| `QAAS_DOCS_LINK_REPOSITORY_VAP`         | `repository_vap`         | Versioned Artifactory Publisher repository URL |
| `QAAS_DOCS_LINK_RUNNER_SCHEMA`          | `runner_schema`          | QaaS.Runner schema URL                         |
| `QAAS_DOCS_LINK_MOCKER_SCHEMA`          | `mocker_schema`          | QaaS.Mocker schema URL                         |

In markdown files, links are referenced using Jinja2 syntax: `{{ links.repository_runner }}`.

## 📦 Deployment

### GitHub Pages (Automatic)

Documentation is automatically deployed to GitHub Pages on every push to `main` or `master` branch.

**Setup required:**
1. Go to repository **Settings** → **Pages**
2. Under "Build and deployment", select **GitHub Actions** as the source
3. Push to main/master to trigger deployment

### Manual Deployment

```bash
mkdocs gh-deploy --force
```

### Docker

```bash
docker build -t qaas-docs .
docker run -p 8000:8000 qaas-docs
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes in the `docs/` directory
4. Test locally with `mkdocs serve`
5. Submit a pull request

## 📝 License

See LICENSE file for details.
