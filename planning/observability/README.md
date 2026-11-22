# QaaS observability: implementation and rollout

This is a proposal, not a claim that the producers, indexes, metrics or dashboards are deployed. See the [usage dashboard](kpi/dashboards/usage.json), [operations dashboard](operations/dashboard.json) and [validation evidence](evidence/observability-evidence.md). Validate first with synthetic data in a disposable environment.

## Separate diagnostic, usage and operations data

| Plane | Source | Purpose |
| --- | --- | --- |
| Diagnostics | Existing Elastic application and test logs | Investigate specific failures. One attempt can emit many entries, and retries or duplicate deliveries create more. Log counts are not usage or SLO denominators. |
| Usage | One canonical terminal summary per execution attempt | Count attempts and outcomes, measure durations, and aggregate assertions and Mocker activity. |
| Operations | Independent scheduler expectation ledger plus low-cardinality health metrics | Distinguish on-time, late, missing and unknown work; monitor ingestion, queueing, rejection and delivery. An absent log must not remove an expected attempt from the denominator. |

Keep current diagnostic logging during rollout. Implement the summary path independently of per-assertion log filtering and of the logging framework. A short-lived runner's scrape counter is not reliable as the sole source for expected or observed runs.

## Canonical attempt summary and ingestion

1. Assign stable logical-run and attempt identities at dispatch, scoped to the owning namespace. A transport retry reuses the same attempt identity; a new execution retry gets a new one. Invalid identities are errors, not a reason to mint another identity at send time. Do not expose either identity as a metric label.
2. Aggregate in process. At the terminal boundary seal a schema-versioned immutable snapshot with attempt identity, UTC completion time, bounded outcome, duration measured on a monotonic clock, allowlisted dimensions and optional assertion/Mocker counters. Distinguish measured zero, disabled collection and missing evidence. Apply event time to usage queries and keep ingest time separately for lag. A genuine execution retry is its own usage record; it does not change the prior attempt's outcome. Define a separate policy for logical-run success.
3. Cap record size, buffer bytes, batch size/age, send timeout and shutdown drain. Use bounded retry with backoff and jitter, tracking delivered, buffered, rejected, dropped and retry-exhausted records. Telemetry must not hang the process or change its test result. Memory buffering alone does not survive a crash. If recovery is required, use an outbox or supervised durable relay, prove restart behavior and reconcile gaps against scheduler expectations rather than promising exactly-once delivery.
4. Validate at ingestion with an explicit schema/mapping and bounded field values. Bulk HTTP 200 can contain mixed item outcomes; inspect each item. Acknowledge writes independently, retry transient failures only within policy, and quarantine scrubbed metadata for permanent errors. A create conflict says an ID is occupied, not that its payload matches. Compare trusted identity/content where possible and investigate divergence; do not overwrite silently.

### Idempotency across rollover

Elasticsearch document IDs are unique within a concrete index, not across an alias or data stream's backing indexes. Retrying the same ID after rollover can create a second record if it reaches the new backing index. Enforce one of these strategies explicitly:

- Persist a durable deduplication ledger keyed by canonical attempt identity. Reserve the concrete write target before the first send, preserve it on retries and acknowledge only after per-item resolution. Keep that target writable for the retry window. Verify recovery after crashing between successful create and ledger acknowledgment, and verify concurrent retries and rollover.
- Or derive a protected concrete partition from immutable original event time, not ingest time. Enforce an agreed late-arrival window and never re-create expired partitions during ordinary retry. Keep backfills separate and auditable.

An ambiguous transport outcome is safe to replay only with stable identity, routing and the corresponding deduplication contract. Use one canonical query view. Exact reconciliation of legacy duplicates should group by attempt identity; approximate cardinality or dashboard-side deduplication is not an ingestion safety control.

## Independent expected work and SLO

Materialize expected occurrences from the approved scheduler or dispatch inventory, independently of the runner and Elastic logging. Store occurrence identity, schedule time, deadline, eligibility and the policy for linking retries to that occurrence. Reconcile observed terminal attempts against those expectations. Count only matured eligible deadlines after a defined reporting lag. Late completions remain late; report them separately. Manual runs and backfills belong in separate cohorts unless the contract explicitly says otherwise.

- **On-time completion:** occurrences with accepted terminal evidence by deadline / eligible expected occurrences with matured deadlines. A recorded failure can be on time.
- **On-time success:** occurrences meeting the configured success/retry policy by deadline / the same matured denominator. Completion is not success.
- **Missing, unknown and empty:** an expected occurrence with no terminal evidence after grace is missing when feeds are healthy; stale expectations or degraded evidence coverage make the result unknown. Zero eligible occurrences is not 100%. Track feed freshness and coverage separately from run failure.

Use a controller or collector that outlives the runner for persistent operational counters. Keep labels bounded; exclude attempt/run IDs, paths, URLs, test names, customer identifiers and arbitrary error text. Display freshness/no-data explicitly and aggregate histogram buckets before deriving fleet percentiles.

## Mocker activity

Capture bounded aggregates such as activation, calls handled, misses or errors, and timing only where coverage and units are defined. Specify whether misses include fallback, whether error and miss can overlap, how retries are counted and which timing observation is the denominator. Test those semantics. Enabled with zero calls, disabled and unknown are separate states. Do not emit bodies, headers, request paths, match expressions or full mock configuration. Mocker activity neither defines expected-work eligibility nor establishes a successful run.

## Retention, security and cost

- Separate diagnostic and summary indexes and roles. Require TLS and a least-privilege writer scoped to the intended path; provision mappings and lifecycle with a different admin role. Give dashboards read-only access to intended datasets. The isolated benchmark's loopback/no-auth settings do not apply to shared environments.
- Allowlist fields and value domains at origin and revalidate in ingestion. Exclude credentials, environment dumps, host paths, URLs, raw error details and sensitive fixture content from summaries. Protect joining identifiers in storage and keep diagnostic drill-down separate.
- Agree independent retention for raw logs, summaries, scheduler expectations, outbox/dedup state and rejection records. Bound retries within the dedup retention and concrete-target write window; retain joinable expectations for the reporting period. Apply expiration to backups as required. Keep rejection metadata scrubbed and bounded.
- Measure offered and accepted volume. Estimate costs using production volume, effective retention, replicas, compression/mapping and billing; toy one-node index bytes are not a cost forecast. Compact summaries do not preserve arbitrary assertion-level detail, so preserve approved diagnostics under their own policy.

## Rollout and rollback

1. **Agree the gates.** Set schema, limits, expected-work semantics, SLO denominator and predeclared absolute/relative performance, delivery and queue budgets. Document each owner. Confirm rollback can disable publication independently of diagnostics.
2. **Exercise failure paths.** Use synthetic inputs to check agreed dashboard values and no-data states. Test duplicate and conflicting records, mixed bulk responses, retries through rollover, relay restart, pending-buffer saturation, ingest timeouts, exit failure, abrupt termination and invalid/high-cardinality data. Preserve original exit codes.
3. **Measure process launch through process exit.** Pair baseline and candidate under the same workload, concurrency, backend and hardware. Alternate or randomize order, repeat enough for tail comparisons and include small/large suites, cold/warm starts and healthy, slow and unavailable ingestion. Start before subprocess launch; end after the process exits, including startup, synchronous writes, final drain/flush and shutdown. Report sample counts, median/tail wall time, variability, CPU, peak memory, bytes, accepted records and drops. Where a relay works after exit, measure time to durable acceptance, pending growth and delivery success separately. Enqueue or serialization-only speed is not a runner-overhead gate, and a faster run that drops records does not pass.
4. **Shadow, then canary.** Keep current diagnostics authoritative while comparing summary and SLO results to independent expectations in a read-only shadow view. Check duplicates, accepted counts, unmatched expectations, late/missing/unknown coverage, lag, cardinality and through-exit overhead. Canary one representative cohort; widen only when agreed budgets pass over a representative business cycle.
5. **Roll back safely.** Disable the new publisher by feature flag or revert the producer. Preserve existing diagnostics, independent expectations and retained summaries. Mark coverage gaps rather than resetting the denominator. Preserve bounded pending records and their identity/target for controlled replay. Recheck baseline behavior and exit codes. Pause expansion on unexplained gaps/duplicates, rollout or rollover divergence, retention/security violations or exceeded performance/delivery budgets.
