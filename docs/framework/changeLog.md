# Framework Change Log

_Generated from [QaaS.Framework]({{ links.repository_framework }}) CHANGELOG.md._

This file is generated automatically from CI from git history.

## Unreleased

- docs(changelog): add automated changelog
- docs(logging): clarify elastic sink help text
- refactor(config): expose framework configuration getters
- docs(logging): fix send-logs help text
- fix(validation): restore internal config coverage
- docs(framework): annotate public api functions
- fix(configuration): bind internal nested configs
- chore(executions): use qaas elastic bootstrap package
- chore(executions): depend on qaas elastic configuration
- fix(executions): allow disabling elastic defaults
- feat(executions): add elastic defaults hook
- feat(configurations): support overwrite folders
- fix(serialization): constrain binary deserialization
- feat(configurations): add public configuration update helpers
- fix: restore binary formatter test compatibility
- fix: reverted binary serialzation
- fix(config): normalize configuration keys case-insensitively
- fix(configuration): ignore placeholder-only environment roots
- fix(logging): keep default logger console-only
- fix(executions): disable log shipping by default
- fix(validation): handle null path entries
- fix(validation): read nested values safely
- fix(validation): support explicit non-public recursive checks
- feat(validation): tighten framework configuration rules
- test: remove obsolete rabbitmq mock setup
- fix: preserve duplicate kafka headers
- feat: deal with headers which has duplicated keys and test it
- feat: add unit test for consuming message with headers
- feat: add headers when consume messages
- chore: update stable dependencies
- chore: update deps
- fix: harden edge cases and raise coverage
- ci: publish badges from master workflows
- ci: publish coverage badges from master only
- ci: scope solution coverage to product assemblies
- ci: split filtered coverage badges
- ci: publish portable symbols
- ci: sanitize gist badge credentials
- ci: trim coverage badge token
- docs: add workflow and coverage badges
- ci: use supported dotnet-coverage flags
- ci: order dotnet-coverage arguments correctly
- ci: fix dotnet-coverage command invocation
- ci: add coverage reporting and robust package parsing
- ci: stage packed packages in restore artifact
- fix: reject ambiguous full-name hook matches
- fix(framework): harden hook loading and protocol runtime
- test: align config merge null-string expectation
- fix:Yaml loads null when empty string is passed
- feat: deepen architecture qa sweep for framework packages (#8)
- Allow CI on any tag
- fix: address PR feedback and CI warnings
- fix(config): ignore computed properties during runtime merges
- fix(sdk): preserve downstream hook configuration assignment
- refactor(execution): remove unused logic shouldrun contract
- feat(config): merge runtime configuration updates
- chore(deps): update framework stable dependencies
- feat(redis): add framework redis reader support
- fix(s3): preserve raw bytes when loading metadata first
- fix(protocols): reduce sql polling log spam
- fix(serialization): preserve empty yaml strings
- feat(sdk): add datasource configuration CRUD helpers
- Restrict tag pipeline to stable releases
- ci: allow manual source runs for mirror polling
- ci: publish restored package artifact for mirror polling
- style: address PR review formatting comments
- docs: add NuGet readmes and simplify CI
- ci: integrate dotnet-coverage into main job and auto-update badges
- docs: add unified solution README with package badges and coverage
- Modify Dependabot config to ignore pre-releases
- Configure Dependabot for NuGet package updates
- Change Dependabot update schedule to monthly
- Restore base hooks, remover mocker objects and update ci and tests (#5)
- refactor(sdk): remove base status code hook from framework (#4)
- Tests and mocker compatibility
- Fix ci pipeline
- Made the build work with no warnings
- Removed build errors and unused dependenceies
- Added more tests and make elastic logger optional
- Fix/CI

## v1.0.0b1 - 2026-02-09

- update CI workflow to use repository owner for NuGet package source
- update CI workflow to use tag version for NuGet package versioning
- add GitHub Actions CI workflow for build, test, and NuGet package publishing
- replace custom HTTP client wrappers with standard HttpClient and update dependencies
- add macOS system files to .gitignore

## 1.2.7 - 2026-03-23

- fix(validation): restore internal config coverage
- docs(framework): annotate public api functions

## 1.2.6 - 2026-03-23

- fix(configuration): bind internal nested configs

## 1.2.5-alpha.4 - 2026-03-22

- chore(executions): use qaas elastic bootstrap package
- chore(executions): depend on qaas elastic configuration
- fix(executions): allow disabling elastic defaults
- feat(executions): add elastic defaults hook

## 1.2.5-alpha.3 - 2026-03-21

- No changes recorded.

## 1.2.5-alpha.2 - 2026-03-21

- feat(configurations): support overwrite folders
- fix(serialization): constrain binary deserialization

## 1.2.5-alpha.1 - 2026-03-21

- No changes recorded.

## 1.2.5 - 2026-03-21

- feat(configurations): support overwrite folders
- fix(serialization): constrain binary deserialization
- feat(configurations): add public configuration update helpers
- fix: restore binary formatter test compatibility
- fix: reverted binary serialzation

## 1.2.4-alpha.1 - 2026-03-17

- No changes recorded.

## 1.2.4 - 2026-03-17

- fix(config): normalize configuration keys case-insensitively

## 1.2.3-alpha.2 - 2026-03-16

- fix(configuration): ignore placeholder-only environment roots

## 1.2.3-alpha.1 - 2026-03-16

- No changes recorded.

## 1.2.3 - 2026-03-16

- fix(configuration): ignore placeholder-only environment roots
- fix(logging): keep default logger console-only

## 1.2.2 - 2026-03-16

- No changes recorded.

## 1.2.1-alpha.2 - 2026-03-16

- fix(executions): disable log shipping by default
- fix(validation): handle null path entries

## 1.2.1-alpha.1 - 2026-03-16

- fix(validation): read nested values safely
- fix(validation): support explicit non-public recursive checks
- feat(validation): tighten framework configuration rules

## 1.2.1 - 2026-03-16

- test: remove obsolete rabbitmq mock setup
- fix: preserve duplicate kafka headers
- feat: deal with headers which has duplicated keys and test it
- feat: add unit test for consuming message with headers
- feat: add headers when consume messages
- chore: update stable dependencies
- chore: update deps
- fix: harden edge cases and raise coverage
- ci: publish badges from master workflows
- ci: publish coverage badges from master only
- ci: scope solution coverage to product assemblies

## 1.2.0-alpha.17 - 2026-03-15

- ci: split filtered coverage badges
- ci: publish portable symbols
- ci: sanitize gist badge credentials
- ci: trim coverage badge token
- docs: add workflow and coverage badges

## 1.2.0-alpha.16 - 2026-03-15

- ci: use supported dotnet-coverage flags
- ci: order dotnet-coverage arguments correctly
- ci: fix dotnet-coverage command invocation
- ci: add coverage reporting and robust package parsing
- ci: stage packed packages in restore artifact

## 1.2.0-alpha.15 - 2026-03-13

- fix: reject ambiguous full-name hook matches

## 1.2.0-alpha.14 - 2026-03-13

- fix(framework): harden hook loading and protocol runtime
- test: align config merge null-string expectation
- fix:Yaml loads null when empty string is passed

## 1.2.0-alpha.13 - 2026-03-12

- feat: deepen architecture qa sweep for framework packages (#8)

## 1.2.0-alpha.12 - 2026-03-12

- Allow CI on any tag

## 1.2.0-alpha.11 - 2026-03-12

- fix: address PR feedback and CI warnings

## 1.2.0-alpha.10 - 2026-03-11

- fix(config): ignore computed properties during runtime merges

## 1.2.0-alpha.9 - 2026-03-11

- fix(sdk): preserve downstream hook configuration assignment

## 1.2.0-alpha.8 - 2026-03-11

- refactor(execution): remove unused logic shouldrun contract

## 1.2.0-alpha.7 - 2026-03-11

- feat(config): merge runtime configuration updates

## 1.2.0-alpha.6 - 2026-03-11

- chore(deps): update framework stable dependencies

## 1.2.0-alpha.5 - 2026-03-11

- feat(redis): add framework redis reader support
- fix(s3): preserve raw bytes when loading metadata first

## 1.2.0-alpha.4 - 2026-03-11

- No changes recorded.

## 1.2.0-alpha.3 - 2026-03-11

- fix(protocols): reduce sql polling log spam

## 1.2.0-alpha.2 - 2026-03-11

- fix(serialization): preserve empty yaml strings

## 1.2.0-alpha.1 - 2026-03-11

- No changes recorded.

## 1.2.0 - 2026-03-16

- chore: update deps
- fix: harden edge cases and raise coverage
- ci: publish badges from master workflows
- ci: publish coverage badges from master only
- ci: scope solution coverage to product assemblies
- ci: split filtered coverage badges
- ci: publish portable symbols
- ci: sanitize gist badge credentials
- ci: trim coverage badge token
- docs: add workflow and coverage badges
- ci: use supported dotnet-coverage flags
- ci: order dotnet-coverage arguments correctly
- ci: fix dotnet-coverage command invocation
- ci: add coverage reporting and robust package parsing
- ci: stage packed packages in restore artifact
- fix: reject ambiguous full-name hook matches
- fix(framework): harden hook loading and protocol runtime
- test: align config merge null-string expectation
- fix:Yaml loads null when empty string is passed
- feat: deepen architecture qa sweep for framework packages (#8)
- Allow CI on any tag
- fix: address PR feedback and CI warnings
- fix(config): ignore computed properties during runtime merges
- fix(sdk): preserve downstream hook configuration assignment
- refactor(execution): remove unused logic shouldrun contract
- feat(config): merge runtime configuration updates
- chore(deps): update framework stable dependencies
- feat(redis): add framework redis reader support
- fix(s3): preserve raw bytes when loading metadata first
- fix(protocols): reduce sql polling log spam
- fix(serialization): preserve empty yaml strings
- feat(sdk): add datasource configuration CRUD helpers
- Restrict tag pipeline to stable releases

## 1.1.1-alpha.3 - 2026-03-11

- ci: allow manual source runs for mirror polling

## 1.1.1-alpha.2 - 2026-03-11

- ci: publish restored package artifact for mirror polling

## 1.1.1-alpha.1 - 2026-03-11

- docs(code): explain remediation logic inline
- refactor(protocols): clarify transport logging
- Upgraded dependencies version and fix permissions in ci workflow
- chore(repo): remove architecture review docs
- docs(protocols): record s3 deserialization hardening
- fix(protocols): preserve s3 payload bytes for deserializers
- docs(architecture): add deep qa sweep report
- fix(sdk): make context global state thread-safe
- fix(protocols): harden http transport handling
- fix(policies): stabilize policy chaining and load balancing
- style: address PR review formatting comments
- docs(code): explain remediation logic inline
- refactor(protocols): clarify transport logging
- Upgraded dependencies version and fix permissions in ci workflow
- chore(repo): remove architecture review docs
- docs(protocols): record s3 deserialization hardening
- fix(protocols): preserve s3 payload bytes for deserializers
- docs(architecture): add deep qa sweep report
- fix(sdk): make context global state thread-safe
- fix(protocols): harden http transport handling
- fix(policies): stabilize policy chaining and load balancing
- docs: add NuGet readmes and simplify CI
- ci: integrate dotnet-coverage into main job and auto-update badges
- docs: add unified solution README with package badges and coverage
- Modify Dependabot config to ignore pre-releases
- Configure Dependabot for NuGet package updates
- Change Dependabot update schedule to monthly

## 1.1.0-alpha.4 - 2026-03-05

- Restore base hooks, remover mocker objects and update ci and tests (#5)
- refactor(sdk): remove base status code hook from framework (#4)

## 1.1.0-alpha.3 - 2026-03-05

- No changes recorded.

## 1.1.0-alpha.2 - 2026-03-05

- refactor(sdk): remove base status code hook from framework
- Tests and mocker compatibility

## 1.1.0-alpha.1 - 2026-03-05

- test(protocols): expand kafka and prometheus logic coverage
- feat(providers): improve hook assembly discovery
- test(protocols): raise protocol coverage and exclude integration-only adapters

## 1.1.0 - 2026-03-05

- Restore base hooks, remover mocker objects and update ci and tests (#5)
- refactor(sdk): remove base status code hook from framework (#4)
- Tests and mocker compatibility
- Fix ci pipeline

## 1.0.1-alpha.3 - 2026-03-03

- Made the build work with no warnings

## 1.0.1-alpha.2 - 2026-03-03

- Removed build errors and unused dependenceies

## 1.0.1-alpha.1 - 2026-03-03

- Added more tests and make elastic logger optional
- Fix/CI

## 1.0.0-alpha.2 - 2026-03-01

- Changed output path to have backwards slash

## 1.0.0-alpha.1 - 2026-03-01

- Optimised ci to run on single job
- Update dependencies and fix ci
- Update: semver validation and not skipping duplicates
- CI: split build/test/deploy jobs and add NuGet package metadata
- fix CI workflow: remove setup-dotnet cache and locked restore to support missing lock files
- clean up CI workflow: clarify comments, improve cache path handling, and streamline permissions
- refactor CI workflow: improve job structure, enable tag-based packing, and enhance caching and permissions
- update CI workflow to use repository owner for NuGet package source
- update CI workflow to use tag version for NuGet package versioning
- add GitHub Actions CI workflow for build, test, and NuGet package publishing
- replace custom HTTP client wrappers with standard HttpClient and update dependencies
- add macOS system files to .gitignore

## 1.0.0 - 2026-03-03

- Fix/CI
- first commit
