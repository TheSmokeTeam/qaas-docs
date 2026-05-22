# QaaS docs v2 — Resume Checklist

Use this after `/clear` to pick up exactly where the last session left off.

## Where we are

- **PR**: `TheSmokeTeam/qaas-docs#43` on `feature/document-actions`
- **Latest mainline commits** (push when ready):
  - `4d8d031` chore: ignore planning/.tmp-* scratch files
  - `545ec70` plan: v2 cookbook fold mapping
  - `c83c0ed` docs: inject v2 frontmatter into 480 legacy pages
  - `6a14a61` docs(integrations): rewrite kiwix-mcp page per v2 contract
  - `10e47b4` docs(contract): v2 authoring contract + CI gates
- **CI gates**: `tools/ci/check-frontmatter.sh` exits 0 across all 481 mainline docs files.
- **mkdocs build --strict**: green.
- **Catalogs worktree** (`docs-revamp/catalogs`, commit `881f256`): 220 plugin pages already v2-compliant; not yet merged into mainline.

## Context-saving habits (LEARNED)

1. Use `mcp__plugin_context-mode_context-mode__ctx_batch_execute` for any multi-command read pass.
2. Use `mcp__plugin_context-mode_context-mode__ctx_execute` for any data transform (e.g., the 480-page frontmatter injection — one node script vs. 480 Edits).
3. Push deep-read tasks to **subagents**; have them write findings to `planning/*.md` instead of dumping into the orchestrator's context.
4. Delegate independent work to `codex exec --sandbox danger-full-access --skip-git-repo-check` or `agy -p` at max reasoning when parallelizable.
5. `claude-mem search "<topic>"` before resuming a multi-session task.
6. Never `Read` a subagent's `.output` JSONL transcript — it overflows context. Use the agent's returned `result` field.

## Pending verification reports

The 3 read-only subagents were dispatched and may have completed by now. Check these paths exist:

- `planning/v2-verification-framework.md` (agent `ac0aad4bdcdaca4df`)
- `planning/v2-verification-runner.md` (agent `a14d7ae58ddd349d2`)
- `planning/v2-verification-mocker-catalogs.md` (agent `a1993b0c0acf22327`)

If any are missing, re-dispatch the corresponding agent with the same prompt shape (read-only, write findings to file, output capped at 600 lines).

The PackageMirror survey is complete: `planning/v2-packagemirror-survey.md`.

## Pending work, in order

1. **Apply P0 findings** from the 3 verification reports. Strategy: another fan-out subagent per area (write-mode this time) with the report as input. Cap each agent's scope to ≤30 pages.
2. **Execute cookbook fold** per `planning/v2-cookbook-fold-plan.md`:
   - Cherry-pick `3102001` (cookbooks worktree commit) into a temp branch for patch source.
   - Apply DROP / MERGE / FOLD / KEEP-as-leaf per the table.
   - Delete `docs/cookbooks/` directory.
   - Update `mkdocs.yml` nav for the 3 KEEP-as-leaf pages.
3. **Merge catalogs worktree** (`docs-revamp/catalogs` @ `881f256`) into `feature/document-actions`. Resolve `tools/ci/check-frontmatter.sh` conflict (take mainline's v2 version).
4. **Run `/ultrareview`** loop until 10/10 across the 12-dim rubric. Skill at `~/.claude/skills/ultrareview/SKILL.md`.
5. **Push PR #43**: `git push origin feature/document-actions`.
6. **PackageMirror update** (separate PR on `TheSmokeTeam/QaaS.PackageMirror`): per `planning/v2-packagemirror-survey.md` "Recommended changes" — add optional `_meta`/`ai_summary` guard step in `.github/workflows/sync-packages.yml`, scrub PR-body wording. Open questions §1–§5 may need user input.

## Task state

- `#5`  pending — Phase 4 /ultrareview loop
- `#7`  in_progress — Phase 2 v2 (catalogs+cookbooks largely done; framework/runner/mocker still need content sweeps based on verification reports)
- `#8`  pending — Phase 6 PackageMirror update (survey complete; implementation deferred to its own repo PR)
- `#12` in_progress — verification: framework (agent running)
- `#13` in_progress — verification: runner (agent running)
- `#14` in_progress — verification: mocker+catalogs (agent running)
- `#15` completed — PackageMirror survey

## Hard rules to remember

- No AI / agent / LLM / Claude / ChatGPT in any page body or frontmatter (CI auto-fail).
- Only document `public` or `protected`-with-override-path surface.
- Every named identifier must exist in current source.
- Site IA / top-level nav unchanged at section level.
- Single PR (#43). No new PR. No force-push.
- Conventional commits with `Verified-against:` footer.
