# v2 cookbook fold plan

> v2 contract §8 cancels the Cookbooks top-level section. The 10 v1 drafts (commit 3102001 on docs-revamp/cookbooks worktree) must be folded into existing sections as how-to pages, or dropped.

## Fold mapping

| Original cookbook | Destination | Disposition | Notes |
|---|---|---|---|
| docs/cookbooks/first-test-end-to-end.md | docs/qaas/quickStart/ (already has equivalent: writeTestYaml.md + writeTestCode.md + runTest.md) | DROP | Legacy quickStart covers it. |
| docs/cookbooks/configuration-layering.md | docs/qaas/userInterfaces/runner/configurationSections/overview.md (extend) | FOLD as "Layering example" section | YAML-first content fits. |
| docs/cookbooks/parallelism.md | docs/qaas/userInterfaces/runner/commands/run.md (extend) | FOLD as "Parallelism" subsection | Runner-flag specific. |
| docs/cookbooks/custom-probe-http-503.md | docs/probes/custom-authoring-guide.md (extend with realistic example) | FOLD as "Realistic example" | Replaces lorem-ipsum example. |
| docs/cookbooks/custom-generator-from-csv.md | docs/generators/custom-authoring-guide.md (extend) | FOLD as "Realistic example" | Same pattern. |
| docs/cookbooks/custom-processor-pii-redaction.md | docs/processors/custom-authoring-guide.md (extend) | FOLD as "Realistic example" | Same pattern. |
| docs/cookbooks/custom-assertion-with-mocker.md | docs/assertions/custom-authoring-guide.md (extend) | FOLD as "Realistic example with Mocker" | Same pattern. |
| docs/cookbooks/multi-server-mock-routing.md | docs/mocker/authoring-guide/ (new leaf: multi-server-routing.md) | KEEP as new how-to leaf under mocker section | Genuinely mocker-specific. |
| docs/cookbooks/yaml-schema-extension.md | docs/qaas/userInterfaces/runner/ (new leaf: schema-extensions.md) under "Configuration Reference" | KEEP as new how-to leaf | Runner-config specific. |
| docs/cookbooks/ci-pipeline-github-actions.md | docs/integrations/ci-pipeline.md (new leaf in existing integrations section) | KEEP as new how-to leaf | Integrations section already exists. |
| docs/cookbooks/debugging-failed-test.md | docs/qaas/quickStart/debugTestFailure.md (already exists — merge content) | MERGE | Combine into existing legacy page. |
| docs/cookbooks/index.md | n/a | DROP | No section landing needed. |

## Execution order

1. Cherry-pick 3102001 into a fresh branch so the v1 drafts are accessible as patch source.
2. For each FOLD/MERGE: copy relevant content into target page, rewrite frontmatter to v2, drop AI/agent wording, verify identifiers against source.
3. For each KEEP-as-leaf: move file, rewrite per v2 contract.
4. For each DROP: discard.
5. Update mkdocs.yml nav with the 3 new leaf pages (multi-server-routing.md under Mocker > Authoring Guide, schema-extensions.md under Runner > Configuration Reference, ci-pipeline.md under Integrations).
6. Delete docs/cookbooks/ directory and the docs-revamp/cookbooks worktree branch.
