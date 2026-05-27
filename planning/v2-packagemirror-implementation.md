# QaaS.PackageMirror — v2 Docs Pipeline Implementation Plan

Scope: minimal, defensive. Lands on `TheSmokeTeam/QaaS.PackageMirror`. Not part of qaas-docs PR #43.

## 1. Branch

`feature/v2-docs-pipeline-guard`

## 2. Workflow diff — v2 guard plus drift-check mode

Add `workflow_dispatch` input `docs_drift_check_only`:

```yaml
      docs_drift_check_only:
        description: Fail when regenerated docs differ instead of opening a docs PR
        required: true
        type: boolean
        default: false
```

When `docs_drift_check_only` is true:

- `Decide whether to sync docs` enables the docs-sync path and records `check_only=true`.
- The docs regeneration step appends `--check` to `generate-reference-docs`.
- `Commit docs updates`, `Push docs feature branch`, and `Create docs pull request` are skipped.
- `Commit updated mirror contents`, `Push updated mirror contents`, and `Publish mirror release` are skipped, so check-only mode has no remote write side effects.

Insert the v2 artifact guard immediately after the docs regeneration step and before `Commit docs updates`:

```yaml
      - name: Guard against v1 docs artifacts
        if: steps.docs_sync.outputs.enabled == 'true'
        shell: bash
        run: |
          set -euo pipefail
          fail=0

          if [ -d qaas-docs/docs/_meta ]; then
            echo "::error::v1 artifact present: qaas-docs/docs/_meta/ must not exist under v2."
            fail=1
          fi

          # grep -r returns 0 on match, 1 on no-match, 2 on error. We want fail on match.
          if grep -RIl --include='*.md' -E '^[[:space:]]*ai_summary[[:space:]]*:' qaas-docs/docs >/dev/null 2>&1; then
            echo "::error::Forbidden 'ai_summary:' frontmatter key found in generated docs:"
            grep -RIln --include='*.md' -E '^[[:space:]]*ai_summary[[:space:]]*:' qaas-docs/docs || true
            fail=1
          fi

          if [ "$fail" -ne 0 ]; then
            exit 1
          fi
          echo "v2 guard passed: no _meta/ directory, no ai_summary frontmatter."
```

Notes:

- `set -euo pipefail` keeps later additions safe.
- `grep -RIl` skips binaries; anchored regex avoids matching the literal word inside prose.
- Step runs only when the docs sync was enabled, mirroring upstream `if:` gating.
- No `continue-on-error`. Hard fail.

## 3. PR-body scrub

Current body (line 323) is already free of "AI"/"agent"/`_meta`/`ai_summary`. Recommend tightening to drop the ambiguous "generated docs" phrasing and use the v2-canonical "reference documentation":

Proposed replacement for the `--body` argument:

```powershell
--body "## Summary`n- refresh reference documentation from the latest mirrored package state`n- update bundled schema assets (schema.json, docs-manifest.json, hook-catalog.json) so the docs site ships current downloadable contracts`n- regenerate Runner, Mocker, Framework, and hook reference pages from the mirrored source refs recorded in state/*.json"
```

Title stays: `docs: sync generated reference docs from package mirror` (acceptable; "generated" describes provenance, not AI).

## 4. Resolution of 5 open survey questions

1. **Does PR #43 change `docs-manifest.json` / `hook-catalog.json` shape?** → **No-go on schema change here.** Survey of v2 shows frontmatter + publish-tree edits only. If PR #43 review surfaces a schema delta, branch a follow-up PR; do not bundle.
2. **Does PR #43 relocate `qaas-docs/tools/QaaS.Docs.Generator/QaaS.Docs.Tools.csproj`?** → **Go: verify via `gh pr view 43 --repo TheSmokeTeam/qaas-docs --json files` before merging this PR.** Path is hard-coded at line 275; any move forces a workflow edit in the same commit.
3. **Does PR #43 change `qaas-docs/requirements.txt` location/split?** → **Go: verify same way.** If split (e.g., `requirements-docs.txt` + `requirements-gen.txt`), update line 269 to install both. Otherwise no change.
4. **Add `_meta`/`ai_summary` guard now or skip?** → **Go: add now.** Cost is one bash step, payoff is permanent regression fence. See §2.
5. **Is the PR body wording v2-acceptable?** → **Go with scrub from §3.** Current text passes; the proposed wording is marginally cleaner and removes ambiguity by naming "reference documentation".

## 5. Acceptance criteria

- [ ] Branch `feature/v2-docs-pipeline-guard` pushed to `TheSmokeTeam/QaaS.PackageMirror`.
- [ ] `.github/workflows/sync-packages.yml` contains one new step named `Guard against v1 docs artifacts`, positioned between docs regeneration and `Commit docs updates`.
- [ ] `workflow_dispatch` exposes `docs_drift_check_only`; when true, regenerated docs run with `--check` and the workflow skips docs commit/PR creation, mirror-content commits, and mirror release publishing.
- [ ] `gh pr create --body` block updated per §3 (or left unchanged if reviewer prefers — non-blocking).
- [ ] Dependency-refresh and schema-refresh changes are committed separately from the workflow change.
- [ ] `workflow_dispatch` dry-run with `create_docs_pr=true` against a v2-merged qaas-docs `master` passes the guard step (no `_meta/`, no `ai_summary:` matches).
- [ ] `workflow_dispatch` with `docs_drift_check_only=true` fails on byte drift and passes only when regenerated docs are byte-identical.
- [ ] Negative test: temporarily seed `qaas-docs/docs/_meta/.keep` or an `ai_summary:` line in a test branch → guard step fails with the expected `::error::` annotation.
- [ ] Pre-merge confirmation that qaas-docs PR #43 does NOT move the generator csproj path or split `requirements.txt` (per Q2/Q3). If it does, fold the path fix into this same PR.
- [ ] PR description references this plan path and the survey path.

## 6. Commit message template

```text
ci(sync-packages): add v2 docs guard and drift check mode

Add a post-generate step that fails the run if v1 artifacts leak into
the regenerated qaas-docs tree:

  - presence of qaas-docs/docs/_meta/ (removed in v2)
  - any ai_summary: frontmatter key in qaas-docs/docs/**/*.md

Also tighten the gh pr create --body wording to reference
"reference documentation" explicitly and drop ambiguous phrasing.
Title unchanged.

Add a workflow_dispatch check-only mode that runs generated docs with
--check and skips docs commit/PR creation, mirror-content commits, and
mirror release publishing. No behaviour change in the existing
write-and-PR path when generator output is already v2-clean.

Verified-against: D:/QaaS/qaas-docs@<sha>
```

Replace `<sha>` with the qaas-docs `master` HEAD sha at the moment this PR is opened (post PR #43 merge). Capture via `git -C D:/QaaS/qaas-docs rev-parse HEAD`.
