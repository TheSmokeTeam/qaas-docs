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
    github_org: https://github.com/TheSmokeTeam
    github_runner: https://github.com/TheSmokeTeam/QaaS.Runner
    github_mocker: https://github.com/TheSmokeTeam/QaaS.Mocker
    # ... etc.
```

**Override via environment variables** using the `QAAS_DOCS_LINK_` prefix:

```bash
# Local development
export QAAS_DOCS_LINK_GITHUB_RUNNER=https://github.com/MyOrg/QaaS.Runner
export QAAS_DOCS_LINK_ALLURE_DOCS=https://allure.example.com/docs/
mkdocs serve
```

```bash
# Docker build
docker build \
  --build-arg QAAS_DOCS_LINK_GITHUB_RUNNER=https://github.com/MyOrg/QaaS.Runner \
  --build-arg QAAS_DOCS_LINK_GITHUB_MOCKER=https://github.com/MyOrg/QaaS.Mocker \
  -t qaas-docs .
```

**Available variables:**

| Environment Variable | `extra.links` Key | Description |
|---|---|---|
| `QAAS_DOCS_LINK_GITHUB_ORG` | `github_org` | GitHub organization URL |
| `QAAS_DOCS_LINK_GITHUB_DOCS` | `github_docs` | Documentation repo URL |
| `QAAS_DOCS_LINK_GITHUB_RUNNER` | `github_runner` | QaaS.Runner repo URL |
| `QAAS_DOCS_LINK_GITHUB_MOCKER` | `github_mocker` | QaaS.Mocker repo URL |
| `QAAS_DOCS_LINK_GITHUB_FRAMEWORK` | `github_framework` | QaaS.Framework repo URL |
| `QAAS_DOCS_LINK_GITHUB_ASSERTIONS` | `github_assertions` | QaaS.Common.Assertions repo URL |
| `QAAS_DOCS_LINK_GITHUB_GENERATORS` | `github_generators` | QaaS.Common.Generators repo URL |
| `QAAS_DOCS_LINK_ALLURE_DOCS` | `allure_docs` | Allure documentation URL |
| `QAAS_DOCS_LINK_ALLURE_INSTALL` | `allure_install` | Allure CLI install guide URL |
| `QAAS_DOCS_LINK_DOTNET_SDK` | `dotnet_sdk` | .NET SDK download URL |
| `QAAS_DOCS_LINK_VSCODE_YAML_EXTENSION` | `vscode_yaml_extension` | VS Code YAML extension URL |
| `QAAS_DOCS_LINK_AUTOFAC` | `autofac` | Autofac website URL |

In markdown files, links are referenced using Jinja2 syntax: `{{ links.github_runner }}`.

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
