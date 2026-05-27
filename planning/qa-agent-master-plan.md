# QA Agent — Master Plan (synthesized 2026-05-22)

> Source: `C:/Users/eldar/OneDrive/מסמכים/qa agent.txt` — user's grand vision.
> Target: airgapped QA-engineer copilot built on OpenHands + Dify, fed by local
> LLMs (Minimax M2.5, GLM 4.7 — 128K context).

## 1. Vision (verbatim → restated)

**Goal:** ship a `QA Agent` that helps QA teams (a) plan tests, (b) write+run+iterate
QaaS tests against real systems, (c) generate synthetic data — all in an
**airgapped** environment, generic across protocols/architectures, robust to
small-context (128K) weaker-than-frontier local LLMs.

**Three QA-Agent capabilities the docs must enable:**

| # | Capability | Knowledge surface needed |
|---|---|---|
| 1 | Test planning | System-under-test domain, protocols (HTTP/gRPC/queues/DB), the QaaS hook taxonomy (Probes/Generators/Assertions/Processors), the Runner Session→Stage→Action model |
| 2 | Test writing + iteration loop | YAML schema, CLI verbs, Mocker stub authoring, hook authoring (C# extension points), Allure result parsing, error → fix mapping |
| 3 | Synthetic data generation | `QaaS.Common.Generators` API surface (FromCSV, FromJsonPrototype, FromJsonSchemaDraft4, FromS3, FromTrino, Stacking) + how to compose generators into data sources |

## 2. User-stated problems → docs-side mitigations

| Problem | Mitigation in qaas-docs (v2) |
|---|---|
| **128K context, weaker LLMs** | Per-page YAML-first §7 skeleton, slim frontmatter (`summary` ≤200 chars), `llms.txt` TOC + `llms-full.txt` quadrants ≤1MB each, dense examples in code blocks (no prose-only reference) |
| **Generic across all system shapes** | Task-oriented how-to pages ("Author a probe", "Stub a gRPC service"), not system-specific cookbook bloat; protocol abstractions documented at the seam (`QaaS.Framework.Protocols`) |
| **Iterative feedback loop** | Document error formats (per assertion, per CLI verb exit code); document the `act`/`assert` storage split so an automation client can re-assert without re-running the system under test; document Allure JSON output schema so results are machine-parseable |
| **Training a model on QaaS codebase+docs** | Stable identifiers (frontmatter `id`), no AI-wording (training corpus stays clean), every public extension point has a runnable skeleton, source files & docs are SHA-pinned via `Verified-against:` commit footer |
| **Airgapped** | Same source → MkDocs Material site (live) + ZIM (offline) + llms.txt (consumed by automation client). Kiwix MCP wraps ZIM for high-QPS search behind the airgap. |

## 3. Architecture sketch

```
+--------------------------------------------------------------+
|                       QA Agent (Dify flow)                   |
| - planner agent  -> writer agent  -> runner agent -> fixer   |
| - synth-data agent                                            |
+----------------+-------------------+-------------------------+
                 |                   |
                 v                   v
   +---------------------+   +---------------------+
   | OpenHands executor  |   | Local LLM gateway   |
   | (C#/dotnet/shell)   |   | Minimax M2.5,       |
   +---------------------+   | GLM 4.7  (128K)     |
                 |           +----------+----------+
                 v                      |
   +---------------------+              v
   | qaas-runner CLI     |   +---------------------+
   | qaas-mocker         |   | Knowledge layer     |
   +---------------------+   | - Kiwix MCP (ZIM)   |
                             | - llms.txt          |
                             | - QaaS source MCPs  |
                             |   (per-repo graphs) |
                             | - YAML JSON schema  |
                             +---------------------+
```

## 4. Phase plan (this is what we drive 24/7 toward)

### Phase A — docs perfection (in flight, this PR #43)
- ✅ v2 frontmatter on 481 pages
- ✅ Catalogs (220 plugin pages) merged
- ✅ Forbidden words purged (0 hits across docs/)
- ⏳ Cookbook fold (agent `af25a566f1f3d3ec1`)
- ⏳ /ultrareview loop to 10/10 across revised v2 rubric

### Phase B — automation-client surfaces (NEW work after PR #43 merges)
- Generate `llms.txt` + per-quadrant `llms-full.txt` via `mkdocs-llmstxt`
- Build ZIM in CI; attach to release
- Publish JSON schemas at stable URLs (`/schemas/runner.json`, `/schemas/mocker.json`)
- Document Allure JSON output schema as a reference page
- Document every CLI verb's exit codes + error patterns

### Phase C — QA Agent skill pack (NEW repo: `qa-agent-skills`)
- Skills: `plan-test`, `write-yaml`, `run-and-parse`, `author-hook`, `stub-mocker`, `synth-data`
- Each skill cites canonical qaas-docs pages by stable id
- Tested via Dify flows against local LLMs

### Phase D — training corpus prep (NEW repo: `qaas-training-corpus`)
- Snapshot every qaas-docs page + every QaaS source file at a tagged SHA
- Strip frontmatter, normalize code fences, split by §7 sections
- JSONL output: `{id, source_repo, sha, kind: docs|source, content, summary}`
- Used to fine-tune a small local model (Minimax 7B variant?) for QaaS-aware
  retrieval+generation

### Phase E — feedback loop (NEW component in QA Agent)
- After `run`, parse Allure JSON
- Map failure → likely-cause table (built from QaaS error catalog — needs new
  docs page)
- Suggest fix candidates from QaaS docs pages tagged with that error class
- Re-run; max 5 iterations before escalation

### Phase F — synthetic data engine (NEW skill)
- Inspect protocol shape (proto/avro/JSON schema/CSV)
- Select right `QaaS.Common.Generators` plugin
- Stack generators (the `Stacking` pattern) for compound payloads
- Validate generated data against schema before persisting

## 5. Open clarifying questions (to ask user BEFORE phase C+)

These will be batched and surfaced ONCE so we don't ping repeatedly:

1. **Local LLM serving stack** — is it vLLM/SGLang/llama.cpp behind an
   OpenAI-compatible gateway? Or raw Minimax SDK? This determines how OpenHands
   talks to it.
2. **Dify version** — does it run flows that can call MCP servers? If not, we
   need a bridge.
3. **Airgap shape** — fully offline (no DNS, no proxy) or "internet via
   approved mirror"? Determines whether we can ship Kiwix-MCP via `pip` at all,
   or must bake a Docker tarball.
4. **Target QA teams** — internal Sapiens teams, external customers, or
   open-source release? Determines branding, license, telemetry policy.
5. **Training budget** — fine-tune scale (LoRA on 7B vs. full fine-tune on
   34B)? Determines training-corpus size + structure.
6. **Existing CI** — is there an internal Jenkins/Tekton/GHA-self-hosted? QA
   Agent's `run-and-parse` skill needs to know where to drop test artifacts.
7. **Feedback loop scope** — does the QA Agent ALSO read application logs
   (e.g. ELK)? If yes, we need a logs MCP. If no, we limit to Allure +
   QaaS-side observability.

→ I will NOT ping until ≥ Phase C is unblocked by these answers. Phase A+B
work proceeds without them.

## 6. Loop control (24/7 autonomous mode)

Per user directive: **never sit still**. Behavior:

- Always have ≥ 3 parallel agents in flight on non-overlapping work.
- After any agent completes, immediately:
  1. Commit any code/doc changes the agent produced.
  2. Spawn the next agent whose dependencies are now satisfied.
- Only stop and ping when: (a) Open question above blocks ALL parallel
  threads, (b) a destructive action requires sign-off (push, force-push,
  cross-repo merge, model training start).

## 7. Live agent roster (this session)

| Agent | Task | Status |
|---|---|---|
| `af25a566f1f3d3ec1` | Cookbook fold execution | running |
| `ad0b4cea9bd610f78` | Agentic workflow architecture research | running |
| `a31db676839e2917f` | Dogfood #1: write QaaS test from docs | running |
| `af8a247b6da92153b` | Dogfood #2: author custom Probe from docs | running |
| `aca47581ea9d6dc8c` | ZIM + Kiwix MCP pipeline research | running |
| `ad3cc4234bce11a3c` | llms.txt + agent-readable surface research | running |

Plus 3 more about to spawn for airgapped/training/feedback-loop deep dives.

## 8. North-star check

The docs are "done" for QA Agent purposes when an automation client with ONLY:
- Kiwix-served ZIM
- `llms.txt`
- Source-repo graphs
- A 128K-context local LLM

…can author a complete QaaS test (YAML + custom hook in C# + Mocker stub),
run it, parse the Allure output, and iterate to green — without a human
unblocking it. The dogfood agents (`a31db676839e2917f`, `af8a247b6da92153b`)
are the canary; their rankings drive every /ultrareview iteration.
