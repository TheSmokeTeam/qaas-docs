from copy import deepcopy
from pathlib import Path
import json
import unittest
from model import build, exposition
from oracle import verify

DATA=json.loads((Path(__file__).resolve().parent/"fixtures/input.json").read_text())

class Rules(unittest.TestCase):
    def test_sql_oracle(self):
        result=verify(exposition(list(build(DATA))),DATA)
        self.assertEqual((result["cells_checked"],result["scope_count"]),(522,18))

    def test_cancellation_is_not_a_good_platform_result_and_no_denominator(self):
        data=deepcopy(DATA)
        data["expected"]=[{"id":"only","project":"alpha","due_at":"2026-11-20T16:00:00Z"}]
        data["terminals"]=[{"id":"only","project":"alpha","completed_at":"2026-11-20T17:00:00Z",
                            "status":"cancelled","duration_ms":0,"capabilities":["run"]}]
        row=dict(build(data))["7d","all","all"]
        self.assertIsNone(row["functional_failure_ratio"])
        self.assertIsNone(row["duration_p95_seconds"])
        self.assertEqual((row["coverage_ratio"],row["platform_good_ratio"],row["attempts"]),(1,0,1))

    def test_duplicate_conflict_and_unbounded_dimensions_rejected(self):
        for key in ("expected","terminals","roster"):
            data=deepcopy(DATA)
            data[key].append(data[key][0])
            with self.assertRaises(ValueError): list(build(data))
        for array,key,value in [("terminals","project","beta"),("terminals","capabilities",["run","unbounded-id"]),
                                ("roster","team","project-label")]:
            data=deepcopy(DATA)
            data[array][0][key]=value
            with self.assertRaises(ValueError): list(build(data))

    def test_cross_window_due_not_matched(self):
        data=deepcopy(DATA)
        data["expected"][0]["due_at"]="2026-11-21T16:00:00Z"
        data["terminals"][0]["completed_at"]="2026-11-15T15:59:59Z"
        week=dict(build(data))["7d","all","all"]
        self.assertEqual((week["expected"],week["covered"],week["missing"]),(8,6,2))

if __name__=="__main__": unittest.main(verbosity=2)
