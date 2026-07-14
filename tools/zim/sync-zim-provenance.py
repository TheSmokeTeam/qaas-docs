#!/usr/bin/env python3
"""Create or validate the PackageMirror-to-ZIM metadata contract."""

from __future__ import annotations

import argparse
import json
from datetime import date
from pathlib import Path


SCHEMA_VERSION = 1
ZIM_NAME = "QaaS Documantation"
ZIM_TITLE = "Complete QaaS Documantation"
ZIM_FILE_NAME = "qaas-docs.zim"
PROVENANCE_FILE_NAME = "qaas-docs-zim-provenance.json"


def fail(message: str) -> None:
    raise SystemExit(f"[zim-provenance] ERROR: {message}")


def validate_date(value: object) -> str:
    if not isinstance(value, str):
        fail("docsUpdatedDateUtc must be a string in yyyy-MM-dd format")
    try:
        parsed = date.fromisoformat(value)
    except ValueError:
        fail("docsUpdatedDateUtc must be an exact calendar date in yyyy-MM-dd format")
    if parsed.isoformat() != value:
        fail("docsUpdatedDateUtc must be an exact calendar date in yyyy-MM-dd format")
    return value


def canonical_contract(docs_updated_date_utc: str) -> dict[str, object]:
    validated_date = validate_date(docs_updated_date_utc)
    return {
        "schemaVersion": SCHEMA_VERSION,
        "docsUpdatedDateUtc": validated_date,
        "zim": {
            "name": ZIM_NAME,
            "title": ZIM_TITLE,
            "description": validated_date,
            "fileName": ZIM_FILE_NAME,
        },
    }


def validate_contract(contract: object, provenance_path: Path) -> dict[str, object]:
    if not isinstance(contract, dict):
        fail(f"{provenance_path} must contain a JSON object")
    if set(contract) != {"schemaVersion", "docsUpdatedDateUtc", "zim"}:
        fail(f"{provenance_path} has unexpected or missing top-level properties")

    docs_updated_date_utc = validate_date(contract.get("docsUpdatedDateUtc"))
    expected = canonical_contract(docs_updated_date_utc)
    if contract != expected:
        fail(
            f"{provenance_path} does not match the required ZIM metadata contract: "
            f"name={ZIM_NAME!r}, title={ZIM_TITLE!r}, "
            f"description={docs_updated_date_utc!r}, fileName={ZIM_FILE_NAME!r}"
        )
    return expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--provenance-path",
        type=Path,
        default=Path(PROVENANCE_FILE_NAME),
    )
    parser.add_argument("--docs-updated-date-utc")
    args = parser.parse_args()

    provenance_path: Path = args.provenance_path
    if provenance_path.exists():
        try:
            contract = json.loads(provenance_path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exception:
            fail(f"could not read {provenance_path}: {exception}")
        validated = validate_contract(contract, provenance_path)
    else:
        if not args.docs_updated_date_utc:
            fail(
                f"{provenance_path} does not exist and --docs-updated-date-utc was not supplied"
            )
        validated = canonical_contract(args.docs_updated_date_utc)
        provenance_path.write_text(
            json.dumps(validated, indent=2) + "\n",
            encoding="utf-8",
        )

    print(validated["docsUpdatedDateUtc"])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
