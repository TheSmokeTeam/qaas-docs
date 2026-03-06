# Elastic

## Available Probe

- `EmptyElasticIndices`

## Purpose

Use `EmptyElasticIndices` when a test needs to delete matching documents from one or more indices before or after a run.

## Key Configuration Fields

| Field | Required | Description |
|---|---|---|
| `Url` | yes | Elasticsearch base URL. |
| `Username` | yes | Elasticsearch username. |
| `Password` | yes | Elasticsearch password. |
| `RequestTimeoutMs` | no | Request timeout in milliseconds. Default: `30000`. |
| `IndexPattern` | yes | Index pattern used to select indices. |
| `MatchQueryString` | no | Query-string filter for documents to delete. Default: `*`. |

## Notes

- the probe resolves indices first, then runs delete-by-query on each matching index
- use a restrictive `MatchQueryString` when only part of the index should be cleaned
