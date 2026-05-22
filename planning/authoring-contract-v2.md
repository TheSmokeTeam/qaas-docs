# Authoring Contract — REVISED 2026-05-22 (user direction change)

> **Replaces the earlier contract.** All in-flight and future authoring agents MUST read this file before writing or revising a single page. Existing pages that violate these rules MUST be patched.

## Hard rules (replaces prior §1-§9)

### 1. Audience
- **Primary audience: humans + small-context LLMs (Minimax 2.7, GLM 4.7 — ~128K context window).**
- **Do NOT mention "AI", "agent", "LLM", "Claude", "ChatGPT" anywhere in any page.** The docs are written for QaaS users; they happen to be readable by small models, but never address those models or hint that they exist.
- Default user persona: writes YAML for sessions / data sources / assertions / probes / processors / generators; occasionally writes custom C# hooks. Tailor explanations to that persona.
- The CAC (Configuration As Code / C# side) section is more code-leaning but MUST still be human-readable.

### 2. Surface to document
- **Only document what's relevant to a USER.** If a class/method/field is `private`, `internal`, `protected internal`, or `protected` without a public override path — DO NOT document it.
- Document `public` and `protected` members ONLY if a user is expected to override them (extension points). Otherwise omit.
- `[Obsolete]` items get a single deprecation banner — no examples, no detail.

### 3. Source fidelity (zero tolerance)
- Every function, class, attribute, property, YAML key, and CLI flag mentioned ANYWHERE (code blocks AND prose) MUST exist in current source.
- Verify via `mcp__plugin_context-mode_context-mode__ctx_execute_file` reading the actual `.cs` / `.json` / `.yaml` file. NEVER guess.
- If you can't verify, omit the mention. Better empty than wrong.
- Outdated names in existing pages = a P0 bug to fix during this revamp, not preserve.

### 4. Example correctness (zero tolerance)
- Every C# snippet MUST compile against the current source repos. CI runs `tools/ci/compile-csharp-snippets.sh`.
- Every YAML snippet MUST parse against the matching schema in `D:\QaaS\QaaS.JsonSchemaExtensions\generated-schemas\`. CI runs `tools/ci/validate-yaml-snippets.sh`.
- Every example MUST be runnable — not pseudocode, not partial, not "imagine this".
- Use realistic field values, not `"foo"` / `"bar"`.

### 5. Navigation + density
- Every section landing page MUST have: a 1-paragraph summary + a TL;DR bullet list + an index table linking to leaf pages with a one-line description per row.
- Reference pages MUST start with a TL;DR blockquote (1 sentence) BEFORE anything else.
- No wall-of-text. Sections capped at ~50 lines before a subheading.
- Heading depth on a single page: max 3 (`##`, `###`, `####`).
- Every leaf page MUST link UP to its section landing in "See also".

### 6. Frontmatter (slimmed)
```yaml
---
id: <semantic.dot.path>
type: tutorial | how-to | reference | explanation | cookbook
status: stable | beta | experimental | deprecated
since: <version>
last_verified: YYYY-MM-DD
applies_to: [runner, framework, mocker, assertions, generators, probes, processors, jsonschema]
keywords: [...]
summary: "<= 200 chars, the one-line TL;DR shown on landing pages"
---
```
Note: removed `ai_summary`. Now just `summary` — same field, no AI branding. CI's `check-frontmatter.sh` must be updated to accept `summary` and reject `ai_summary` if present.

### 7. Body skeleton (revised)
1. `> TL;DR — <one sentence, no marketing fluff>` (blockquote)
2. `## When to use` — when a user reaches for this
3. `## YAML configuration` (PRIMARY for most pages — the user spends 80% of time here)
4. `## C# (CAC) usage` — present only if there's a code-side surface; concise; runnable
5. `## Minimal example` — smallest valid example, copy-paste-ready
6. `## Realistic example` — production-shape
7. `## Edge cases` — bullets; gotchas users actually hit
8. `## See also` — sibling pages + section landing

If a page has no C# surface (most yaml-only pages), skip §4 entirely — do not include an empty section.

### 8. Site IA / navigation
- Top-level nav UNCHANGED at the section level.
- Add LEAF pages under existing sections.
- No new top-level sections (Cookbooks section is cancelled — fold cookbook content into existing sections as how-to pages).

### 9. ZIM + Kiwix-MCP readiness (unchanged)
- Relative links only.
- No JS-required content. Pre-rendered SVGs only (mermaid renders at build).
- Embedded assets under `docs/assets/`.
- Stable kebab-case anchors via `attr_list` on every `##`.

### 10. Forbidden words / phrases (auto-fail)
- "AI", "agent", "LLM", "Claude", "ChatGPT", "model"
- "seamless", "powerful", "easy-to-use", "robust", "cutting-edge"
- "simply", "just", "obviously"
- Pseudocode tags like `// TODO: implement`

### 11. Commits
- Conventional Commits. One per logical chunk.
- Footer: `Verified-against: D:\QaaS\<repo>@<sha>`
- Push every commit.

### 12. Final QaaS.PackageMirror update (LAST step before /ultrareview)
The implementation orchestrator (not individual area agents) updates `D:\QaaS\QaaS.PackageMirror` to publish the new docs through its existing pipeline. See `planning/packagemirror-update-plan.md` for the dispatch.

## Workspace move
- Coverage maps and earlier planning notes have moved out of `docs/_meta/` (which was published with the site) into `planning/` at the repo root (gitignored from publish; staged for reviewer convenience only). Do NOT reference any `docs/_meta/` path in authored pages — it no longer exists.
