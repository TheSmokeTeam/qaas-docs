# QaaS docs v2 — Resume Checklist (updated 2026-05-22 mid-session)

## Where we are

- **PR**: `TheSmokeTeam/qaas-docs#43` on `feature/document-actions`
- **Latest mainline commits (local, NOT pushed)**:
  - `8082405` docs(runner): fix -s/--serve-results raw help to match string? source  [THIS SESSION]
  - `d99b613` docs(probes): fix Logger API and add Logging/Registration/Retry sections  [THIS SESSION]
  - `05f4b50` docs(framework,mocker): purge forbidden word "model" from 16 hits
  - `61e7bce` docs(catalogs): merge v2-compliant catalog pages (220 plugins + 4 schemas + generator)
  - `7f44b12` plan: v2 verification reports for framework/runner/mocker+catalogs
- **Branch ahead of origin by 14 commits.** Do NOT push without explicit user OK (per global CLAUDE.md).
- **MCP servers**: all 20 connected, including context7.

## Work done this session

1. **Probes custom-authoring-guide.md fix** (`d99b613`) — applied 3 dogfood findings from `planning/v2-dogfood-custom-probe.md`:
   - L78/L148: `Context.Logger.Information(...)` → `LogInformation(...)`
   - L162: `Context.Logger.Warning(...)` → `LogWarning(...)`
   - Added §Logging (ILogger clarification), §Registration and discovery (simple type name), §Retry and long-running probes (sync/Thread.Sleep guidance)

2. **Runner serve-results P0 fix** (`8082405`) — applied P0-1, P0-2 from `planning/v2-verification-runner.md`:
   - Replaced stale `(Default: false)` bool help with `=folder` string semantics in `commands/{run,assert,execute}.md` Raw CLI Help blocks.
   - Verified-against `QaaS.Runner@3afc40276833db228686bb3d395b2551103d71a8` (matches `AssertableOptions.cs` source).

## Uncommitted work (prior cookbook-fold session — NOT mine)

Working tree has dirty changes from the prior crashed cookbook-fold agent:
- `M docs/assertions/custom-authoring-guide.md`
- `M docs/generators/custom-authoring-guide.md`
- `M docs/processors/custom-authoring-guide.md`
- `M docs/qaas/quickStart/debugTestFailure.md`
- `M mkdocs.yml`
- `?? docs/integrations/ci-pipeline.md`
- `?? docs/mocker/authoring-guide/`
- `?? docs/qaas/userInterfaces/runner/schema-extensions.md`

Plus several planning/*.md research reports (untracked but valuable).

## Pending work, in order

1. **Review + commit the cookbook-fold output** from the crashed prior agent. Cross-check each against `planning/v2-cookbook-fold-plan.md` fold mapping. CI gate each before commit.
2. **Apply other P1 findings** from `planning/v2-verification-runner.md` (§7 body-skeleton drift, builder filler line, "simply" forbidden word in quickStart).
3. **Apply ZIM+Kiwix research** to `docs/integrations/kiwix-mcp.md` per `planning/v2-zim-kiwix-research.md`.
4. **Apply llms.txt research** per `planning/v2-llmstxt-research.md` (mkdocs-llmstxt plugin config + custom generator).
5. **Run `/ultrareview`** loop until 10/10 across 12-dim rubric.
6. **Push PR #43** (only after explicit user OK).
7. **PackageMirror update** (separate PR) per `planning/v2-packagemirror-implementation.md`.

## Hard rules (unchanged)

- No AI/agent/LLM/Claude/ChatGPT/model in any page body or frontmatter (CI auto-fail).
- Document only `public`/`protected`-with-override surface.
- Every named identifier must exist in current source.
- Site IA / top-level nav unchanged at section level.
- Single PR (#43). No new PR. No force-push.
- Conventional commits with `Verified-against:` footer.
- No pushes without explicit user OK.

## Context-saving habits (LEARNED)

1. `ctx_batch_execute` for multi-command read passes.
2. `ctx_execute` (Node.js script) for bulk transforms vs. many Edits.
3. Push deep-read tasks to subagents; have them write to `planning/*.md`.
4. Never `Read` a subagent's `.output` JSONL transcript.
