# Probes Change Log

_Generated from [QaaS.Common.Probes]({{ links.repository_probes }}) CHANGELOG.md._

This file is generated automatically from CI from git history.

## Unreleased

- docs(changelog): add automated changelog

## 1.1.3-alpha.1 - 2026-03-22

- chore: consume framework 1.2.5-alpha.4

## 1.1.2 - 2026-03-21

- chore(deps): bump framework packages to 1.2.5
- fix(rabbitmq): secure management probe defaults
- chore(deps): bump framework packages to 1.2.5-alpha.1
- test(probes): raise coverage above 90 percent
- feat(probes): add rabbitmq management and redis command probes

## 1.1.1 - 2026-03-17

- test: reduce probe test runtime
- chore(deps): update qaas.framework packages to 1.2.4
- chore: update framework to 1.2.1
- fix: avoid hanging on streaming exec output
- chore: update framework to 1.2.0
- test: raise probe coverage above 90 percent
- ci: publish badges from master workflows
- ci: publish coverage badges from master only
- ci: scope solution coverage to product assemblies

## 1.1.0-alpha.4 - 2026-03-15

- ci: split filtered coverage badges
- ci: publish portable symbols
- ci: sanitize gist badge credentials
- ci: trim coverage badge token
- docs: add workflow and coverage badges

## 1.1.0-alpha.3 - 2026-03-15

- ci: use supported dotnet-coverage flags
- ci: order dotnet-coverage arguments correctly
- ci: fix dotnet-coverage command invocation
- ci: add coverage reporting and robust package parsing
- ci: stage packed packages in restore artifact

## 1.1.0-alpha.2 - 2026-03-13

- chore: bump framework packages to 1.2.0-alpha.15
- Fix flaky openshift auth test listener binding
- fix(common-probes): harden auth and trim framework deps

## 1.1.0-alpha.1 - 2026-03-12

- No changes recorded.

## 1.1.0 - 2026-03-16

- chore: update framework to 1.2.1
- fix: avoid hanging on streaming exec output
- chore: update framework to 1.2.0
- test: raise probe coverage above 90 percent
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
- chore: bump framework packages to 1.2.0-alpha.15
- Fix flaky openshift auth test listener binding
- fix(common-probes): harden auth and trim framework deps
- chore: update dependencies
- fix(os): force env var rollouts for consecutive updates
- docs(pr): add detailed pull request template
- fix(os): fallback when observed generation is missing
- chore(deps): align framework executions package
- chore(deps): align framework executions package
- chore(deps): update probes stable dependencies
- chore(deps): align probes framework package version
- feat(mongodb): add empty collection probe
- feat(redis): support regex key cleanup in redis probes
- fix(os): wait for rollout generation when updating env vars
- fix(os): force env var rollouts for consecutive updates
- Allow CI on any tag
- docs(pr): add detailed pull request template
- fix(os): fallback when observed generation is missing

## 1.0.0-alpha.10 - 2026-03-11

- chore(deps): align framework executions package

## 1.0.0-alpha.9 - 2026-03-11

- chore(deps): align framework executions package

## 1.0.0-alpha.8 - 2026-03-11

- chore(deps): update probes stable dependencies

## 1.0.0-alpha.7 - 2026-03-11

- chore(deps): align probes framework package version

## 1.0.0-alpha.6 - 2026-03-11

- feat(mongodb): add empty collection probe

## 1.0.0-alpha.5 - 2026-03-11

- feat(redis): support regex key cleanup in redis probes

## 1.0.0-alpha.4 - 2026-03-11

- fix(os): wait for rollout generation when updating env vars
- Restrict tag pipeline to stable releases

## 1.0.0-alpha.3 - 2026-03-11

- ci: publish restored package artifact for mirror polling
- chore: upgrade QaaS.Framework.Executions to 1.1.0
- docs: match framework README structure for probes solution
- docs: align README scope and enforce package metadata in CI
- docs: align README format with framework style and remove coverage
- Configure Dependabot for NuGet with monthly updates
- docs: rewrite solution README with badges and coverage

## 1.0.0-alpha.2 - 2026-03-04

- Fix: added readme to csproj

## 1.0.0-alpha.1 - 2026-03-04

- Added CI and more tests
- first commit
