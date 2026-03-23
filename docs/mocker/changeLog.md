# Mocker Change Log

_Generated from [QaaS.Mocker]({{ links.repository_mocker }}) CHANGELOG.md._

This file is generated automatically from CI from git history.

## Unreleased

- docs(changelog): add automated changelog
- feat(mocker): support custom bootstrap runner types
- refactor(config): expose mocker configuration getters
- test(stubs): reflect internal serializer config access
- chore(deps): update framework packages to 1.2.7
- fix(configuration): consume framework 1.2.6
- docs(mocker): annotate public configuration functions
- fix(configuration): internalize mocker builder configs
- feat(mocker): support discovered code configurators

## 2.0.6-alpha.1 - 2026-03-22

- No changes recorded.

## 2.0.5-alpha.4 - 2026-03-22

- chore: consume framework 1.2.5-alpha.4 and comm objects 2.0.2-alpha.4
- fix(cli): restore bootstrap path and tighten coverage
- refactor(mocker): remove lint execution mode
- fix(cli): handle top-level help with no-env
- refactor(mocker): align cli verbs and builder visibility
- fix(cli): show help for empty mocker invocations
- chore(deps): bump framework and mocker packages

## 2.0.5-alpha.3 - 2026-03-21

- test(mocker): remove legacy server type refs

## 2.0.5-alpha.2 - 2026-03-21

- refactor(mocker): remove server type discriminator
- feat(mocker): simplify server configs and overwrite folders

## 2.0.5-alpha.1 - 2026-03-21

- No changes recorded.

## 2.0.5 - 2026-03-21

- chore(deps): bump framework and mocker packages
- test(mocker): remove legacy server type refs
- refactor(mocker): remove server type discriminator
- feat(mocker): simplify server configs and overwrite folders
- chore(deps): bump mocker communicationobjects alpha
- feat(stubs): expose configuration crud updates
- fix(ci): fail fast when package publishing breaks
- ci(mocker): align workflow structure with runner
- docs(mocker): expand runtime code documentation

## 2.0.4 - 2026-03-21

- fix(ci): publish all mocker packages with xml docs
- fix: ci pushing

## 2.0.3 - 2026-03-17

- fix(cache): preserve text bodies in cached traffic
- test(cache): align transaction cache assertions with runner payloads
- Add runner integration overlay and cache fixes
- chore: dep upgrade
- added gRPC request to example
- test: reduce mocker test logging overhead
- chore(deps): update qaas.framework packages to 1.2.4
- chore: dep upgrade
- added gRPC request to example
- test: reduce mocker test logging overhead
- chore(deps): update qaas.framework packages to 1.2.4
- fix(stubs): rename transaction stub processor config

## 2.0.2-alpha.1 - 2026-03-17

- Add runner integration overlay and cache fixes

## 2.0.2 - 2026-03-17

- chore: dep upgrade
- added gRPC request to example
- test: reduce mocker test logging overhead
- chore(deps): update qaas.framework packages to 1.2.4
- chore: dep upgrade
- added gRPC request to example
- test: reduce mocker test logging overhead
- chore(deps): update qaas.framework packages to 1.2.4
- fix(stubs): rename transaction stub processor config

## 2.0.1 - 2026-03-16

- simplify example processor lookup and drop common processors
- fix example path normalization and test coverage
- rename runner and test runtime coverage
- fix example runner and upgrade framework
- chore: update package dependencies
- chore: update framework to 1.2.0
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
- Handle fatal socket shutdown cancellation
- chore: upgrade depndencies
- Exclude config types from coverage
- test: more tests
- chore: bump framework packages to 1.2.0-alpha.15
- fix(mocker): stabilize socket server runtime
- fix: gPRC logs
- feat(servers): support multi-server runtimes
- chore(logging): lower optional controller skip noise
- refactor(cli): remove initialization shim and env noise
- chore: update dependencies and fix io config
- fix(example): validate tls setup and sample run
- test(runtime): expand action-switch and concurrency coverage
- docs(code): explain runtime and protocol logic
- refactor(logging): improve runtime diagnostics readability
- docs(architecture): extend runner protocol audit
- test(protocol): cover runner serialization regressions
- fix(protocol): harden runner and socket contracts
- docs(architecture): capture deep-dive review findings
- test(runtime): expand action-switch and concurrency coverage
- fix(runtime): harden state transitions and command throughput

## 2.0.0-alpha.12 - 2026-03-15

- ci: split filtered coverage badges
- ci: publish portable symbols
- ci: sanitize gist badge credentials
- ci: trim coverage badge token
- docs: add workflow and coverage badges

## 2.0.0-alpha.11 - 2026-03-15

- ci: use supported dotnet-coverage flags
- ci: order dotnet-coverage arguments correctly
- ci: fix dotnet-coverage command invocation
- ci: add coverage reporting and robust package parsing
- ci: stage packed packages in restore artifact
- Codex/template alignment (#7)
- Allow CI on any tag

## 2.0.0-alpha.10 - 2026-03-11

- fix(deps): align mocker with latest internal packages

## 2.0.0-alpha.9 - 2026-03-11

- chore(deps): update mocker stable dependencies

## 2.0.0-alpha.8 - 2026-03-11

- chore(deps): align mocker internal package versions
- Restrict tag pipeline to stable releases

## 2.0.0-alpha.7 - 2026-03-11

- ci: publish restored package artifact for mirror polling
- docs(ci): align workflow template and bump framework to 1.1.0
- docs: align readme format and package-focused guidance

## 2.0.0-alpha.6 - 2026-03-06

- build(deps): align framework packages with validated tag
- Configure Dependabot for NuGet package updates
- docs: replace solution readme with detailed package guide

## 2.0.0-alpha.5 - 2026-03-05

- fix: align communication contracts and harden mocker logic tests (#2)

## 2.0.0-alpha.4 - 2026-03-05

- feat(ci): skip duplicate runs and harden controller runtime

## 2.0.0-alpha.3 - 2026-03-05

- fix(ci): remove external controller project dependency
- chore: upgrade QaaS framework deps to 1.1.0-alpha.3 and fix build/tests

## 2.0.0-alpha.2 - 2026-03-05

- fix(controller): stabilize runner-mocker redis contract and lifecycle handling
- Common Processors
- feat(mocker): migrate example and stubs to common processors

## 2.0.0-alpha.1 - 2026-03-05

- No changes recorded.

## 2.0.0 - 2026-03-16

- chore: update package dependencies
- chore: update framework to 1.2.0
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
- Handle fatal socket shutdown cancellation
- chore: upgrade depndencies
- Exclude config types from coverage
- test: more tests
- chore: bump framework packages to 1.2.0-alpha.15
- fix(mocker): stabilize socket server runtime
- fix: gPRC logs
- feat(servers): support multi-server runtimes
- chore(logging): lower optional controller skip noise
- refactor(cli): remove initialization shim and env noise
- chore: update dependencies and fix io config
- fix(example): validate tls setup and sample run
- test(runtime): expand action-switch and concurrency coverage
- docs(code): explain runtime and protocol logic
- refactor(logging): improve runtime diagnostics readability
- docs(architecture): extend runner protocol audit
- test(protocol): cover runner serialization regressions
- fix(protocol): harden runner and socket contracts
- docs(architecture): capture deep-dive review findings
- test(runtime): expand action-switch and concurrency coverage
- fix(runtime): harden state transitions and command throughput
- Codex/template alignment (#7)
- Allow CI on any tag
- Restrict tag pipeline to stable releases
- ci: publish restored package artifact for mirror polling
- docs(ci): align workflow template and bump framework to 1.1.0
- docs: align readme format and package-focused guidance
- build(deps): align framework packages with validated tag
- Configure Dependabot for NuGet package updates
- docs: replace solution readme with detailed package guide
- fix: align communication contracts and harden mocker logic tests (#2)
- Common Processors
- feat(mocker): migrate example and stubs to common processors
- First attempt of making this come back to life, added tests and ci and fixed building logics builders etc..
- first commit
