---
id: integrations.orchestrator-site
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, mocker, framework]
keywords: [orchestrator, site, vite, react, documentation gateway]
summary: "Understand the current qaas-orchestrator web site, its source-backed route surface, and the commands used to verify it."
---
<!-- Verified-against: qaas-orchestrator\package.json -->
<!-- Verified-against: qaas-orchestrator\vite.config.ts -->
<!-- Verified-against: qaas-orchestrator\src\App.tsx -->
<!-- Verified-against: qaas-orchestrator\src\pages\Index.tsx -->
<!-- Verified-against: qaas-orchestrator\src\pages\NotFound.tsx -->
<!-- Verified-against: qaas-orchestrator\src\components\landing\Hero.tsx -->
<!-- Verified-against: qaas-orchestrator\src\components\landing\Navigation.tsx -->
<!-- Verified-against: qaas-orchestrator\src\components\landing\EcosystemOverview.tsx -->
<!-- Verified-against: qaas-orchestrator\src\components\landing\CapabilityShowcase.tsx -->

# Orchestrator Site

> TL;DR — `qaas-orchestrator` is the React/Vite web entry point for the QaaS product site; the current source does not define a Runner YAML schema, Mocker schema, service API, or package mirror workflow.

## When to use {: #when-to-use}

- You maintain the public QaaS web entry point that links users to the full documentation site.
- You need to verify which product capabilities the current web page names before updating docs or release notes.
- You need the local commands for building, testing, linting, or previewing the site.

The current page is a single-page React application. `src/App.tsx` defines a `/` route for the landing page and a catch-all route for the not-found page. `src/pages/Index.tsx` composes the landing sections for navigation, hero copy, ecosystem overview, capabilities, testing areas, broader confidence, testimonials, and final documentation calls to action.

## YAML configuration {: #yaml-configuration}

No QaaS YAML is read by this repository. The current source does not contribute Runner configuration sections, Mocker configuration sections, hook catalogs, or PackageMirror schema artifacts.

Use the Runner and Mocker reference pages for executable YAML:

- [Runner configuration sections](../qaas/userInterfaces/runner/configurationSections/configurationSections.md)
- [Mocker configuration sections](../mocker/userInterfaces/mocker/configurationSections/configurationSections.md)
- [PackageMirror](package-mirror.md)

## Route surface {: #route-surface}

| Route | Source | Behavior |
|---|---|---|
| `/` | `src/App.tsx`, `src/pages/Index.tsx` | Renders the QaaS landing page. |
| `*` | `src/App.tsx`, `src/pages/NotFound.tsx` | Renders a not-found page for any unmatched route. |

The landing navigation links to in-page anchors for capabilities, platform, why-QaaS content, and testimonials. The hero and final call-to-action sections link to the [docs home page](../index.md).

## Minimal example {: #minimal-example}

From `D:\QaaS\qaas-orchestrator`, run the unit test command declared in `package.json`:

```powershell
npm run test
```

The current Vitest suite contains a smoke test under `src/test/example.test.ts`.

## Realistic example {: #realistic-example}

Run the same checks a local maintainer needs before changing the site copy or landing sections:

```powershell
npm run lint
npm run test
npm run build
npm run preview
```

`npm run build` invokes `vite build`. `npm run preview` invokes `vite preview` against the built output.

## Edge cases {: #edge-cases}

- The Vite dev server is configured for host `::` and port `8080`.
- The project name in `package.json` is still `vite_react_shadcn_ts`; treat `qaas-orchestrator` as the repository name, not the package name.
- The README is a placeholder, so this page cites source files rather than project prose.
- The current source is a web entry point only. Do not document it as an execution engine unless new source adds that behavior.

## See also {: #see-also}

- [CI Pipeline](ci-pipeline.md)
- [PackageMirror](package-mirror.md)
- [Kiwix MCP](kiwix-mcp.md)
