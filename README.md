# QaaS Documentation

[![Deploy Documentation](https://github.com/your-org/qaas-docs/actions/workflows/deploy-docs.yml/badge.svg)](https://github.com/your-org/qaas-docs/actions/workflows/deploy-docs.yml)

Unified documentation for the Quality as a Service (QaaS) platform and its components.

## 📚 Documentation Sections

| Section | Description |
|---------|-------------|
| **QaaS Core** | Main testing framework - architecture, quick start, and advanced concepts |
| **Mocker** | Mock service creation and deployment |
| **Assertions** | Test assertion types and configurations |
| **Generators** | Data generation from various sources |
| **Framework** | Low-level SDK and infrastructure documentation |

## 🚀 Quick Start

### View Documentation Online

Visit the deployed documentation at: **https://your-org.github.io/qaas-docs/**

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
│   ├── qaas/               # QaaS Core docs
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
