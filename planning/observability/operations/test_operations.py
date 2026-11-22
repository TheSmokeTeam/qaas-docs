"""Check bounded fixture and deterministic generator without dependencies."""
import json, unittest

from generate import ROOT, dashboard, goldens, LATENCY, MOCKER_LATENCY
from verify import samples

class TestOperations(unittest.TestCase):
    def test_checked_in_artifacts_match(self):
        out=json.loads((ROOT/"dashboard.json").read_text())
        self.assertEqual(out,dashboard());self.assertEqual(len(out["panels"]),11)
        expected={t["expr"] for p in out["panels"] for t in p["targets"]}
        self.assertEqual(len(expected),21)
        golden=json.loads((ROOT/"promql.test.yml").read_text())
        self.assertEqual(golden,goldens())
        checks=[c for t in golden["tests"] for c in t["promql_expr_test"]]
        self.assertEqual(len(checks),48);self.assertEqual({c["expr"] for c in checks},expected)

    def test_application_cardinality_is_bounded(self):
        early=samples("active",1,1000);late=samples("active",5,1005)
        self.assertEqual(len(early),33);self.assertEqual(set(early),set(late))
        self.assertEqual({k.partition("{")[2].split("=")[0] for k in early if "{" in k},{"le","outcome"})
        for metric in (LATENCY,MOCKER_LATENCY):
            self.assertEqual(late[metric+"_count"],late[metric+'_bucket{le="+Inf"}'])

    def test_no_data_states_are_distinct(self):
        self.assertEqual(samples("idle",99,1000)["qaas_ingest_last_accepted_timestamp_seconds"],0)
        self.assertEqual(samples("idle",99,1000)[LATENCY+"_count"],0)
        self.assertEqual(samples("active",3,1000)["qaas_ingest_last_accepted_timestamp_seconds"],990)
        unbounded=samples("unbounded",3,1000)
        self.assertEqual(unbounded["qaas_ingest_queue_capacity"],0)
        self.assertEqual(unbounded["qaas_ingest_queue_size"],80)

    def test_denominator_is_not_completed_throughput(self):
        rec=samples("active",1,1000)
        hit=rec['qaas_mocker_requests_completed_total{outcome="hit"}']
        miss=rec['qaas_mocker_requests_completed_total{outcome="miss"}']
        error=rec['qaas_mocker_requests_completed_total{outcome="error"}']
        self.assertEqual(hit/(hit+miss),.75)
        self.assertEqual(error/rec["qaas_mocker_requests_accepted_total"],.1)
        self.assertNotEqual(error/(hit+miss+error),.1)

if __name__=="__main__":
    unittest.main()
