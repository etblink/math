#!/usr/bin/env python3
"""BFSS H1 proof/evidence locator: offline invariants, cold retrieval, and remote pin verification.

Uses only the Python standard library and immutable GitHub API refs. Read-only.
It does NOT prove Lean theorems, assert completeness, or refresh the registry.

Examples:
  python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --check --cold-test
  python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --search "OP2 Fock gauge source"
  python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --check --cold-test --remote
"""
from __future__ import annotations
import argparse
import base64
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import re
import sys
from urllib.error import HTTPError, URLError
from urllib.parse import quote
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parents[3]
REGISTRY = ROOT / "contributions/bfss-kotler/BFSS_H1_EVIDENCE_REGISTRY_V1.json"
TESTS = ROOT / "contributions/bfss-kotler/BFSS_H1_COLD_START_TESTS_V1.json"
SHA = re.compile(r"^[a-f0-9]{40}$")
DIGEST = re.compile(r"^sha256:[a-f0-9]{64}$")
WORDS = re.compile(r"[a-z0-9_]+")
STOPWORDS = frozenset("a an the is are and or of at for from to in on with what which who where how was does do its exact original source find record into do not".split())
STATUSES = {"QUALIFIED_AT_COMMIT", "SOURCE_VERIFIED_NOT_THEOREM", "CANDIDATE_SEPARATE_SNAPSHOT",
            "HISTORICAL_FAILURE", "REJECTED_ROUTE", "OPEN_UNQUALIFIED", "REFERENCE_ONLY",
            "NOT_SCANNED", "UNKNOWN"}

class ValidationError(RuntimeError):
    pass

def assert_true(condition: bool, message: str) -> None:
    if not condition:
        raise ValidationError(message)

def load(path: Path) -> dict:
    obj = json.loads(path.read_text(encoding="utf-8"))
    assert_true(isinstance(obj, dict), f"JSON object expected: {path}")
    return obj

def source_objects(record: dict) -> list[dict]:
    return [record["source"]] + list(record.get("related_sources", []))

def check_schema(db: dict) -> None:
    assert_true(db.get("schema") == "bfss-h1-evidence-registry/v1", "unexpected registry schema")
    assert_true(db.get("repository_governance", {}).get("never_modify_main") == "etblink/math:main",
                "upstream main governance fence is missing")
    records = db.get("records", [])
    assert_true(isinstance(records, list) and len(records) > 0, "empty registry")
    assert_true(db.get("record_count") == len(records), "record count mismatch")
    ids = [r["id"] for r in records]
    assert_true(len(ids) == len(set(ids)), "duplicate record IDs")
    for r in records:
        loc = r["id"]
        assert_true(r.get("status") in STATUSES, f"{loc}: unrecognized epistemic status")
        assert_true(bool(r.get("keywords")) and bool(r.get("scope_limit")),
                    f"{loc}: missing search terms or scope boundary")
        assert_true(SHA.fullmatch(r.get("exact_commit", "")) is not None,
                    f"{loc}: missing immutable exact commit")
        assert_true(r["repository"] in ("etblink/math", "etblink/Foundational-Convergence-Program"),
                    f"{loc}: unrecognized owner")
        src = r["source"]
        expected_url = f"https://github.com/{r['repository']}/blob/{r['exact_commit']}/{src['path']}"
        assert_true(r.get("location_url") == expected_url, f"{loc}: unpinned or inconsistent URL")
        paths = set()
        for f in source_objects(r):
            assert_true(bool(f.get("path")) and SHA.fullmatch(f.get("blob_sha", "")) is not None,
                        f"{loc}: missing source path/blob SHA")
            assert_true(f["path"] not in paths, f"{loc}: duplicate evidence file")
            paths.add(f["path"])
        q = r.get("qualification")
        if r["status"] == "QUALIFIED_AT_COMMIT":
            assert_true(isinstance(q, dict), f"{loc}: missing qualifying run")
            assert_true(q.get("conclusion") == "success" and q.get("tested_sha") == r["exact_commit"],
                        f"{loc}: qualification not bound to exact successful commit")
            assert_true(q.get("run_id", 0) > 0 and q.get("run_attempt", 0) > 0, f"{loc}: run identity missing")
            assert_true(DIGEST.fullmatch(q.get("evidence_digest", "")) is not None,
                        f"{loc}: durable artifact digest missing")
            assert_true(q["workflow_path"] in paths and q["consumer_path"] in paths,
                        f"{loc}: consumer/workflow not blob pinned")
            assert_true(q.get("forbidden_axioms_observed") is False, f"{loc}: forbidden axioms not cleared")
        else:
            assert_true(q is None, f"{loc}: nonqualified record carries accepted qualification")
        audit = r.get("source_audit")
        if audit is not None:
            assert_true(r["status"] == "SOURCE_VERIFIED_NOT_THEOREM",
                        f"{loc}: a source audit cannot masquerade as a theorem qualification")
            assert_true(audit.get("tested_sha") == r["exact_commit"]
                        and audit.get("run_id", 0) > 0
                        and audit.get("run_attempt", 0) > 0
                        and re.fullmatch(r"[a-f0-9]{64}", audit.get("source_graph_sha256", "")),
                        f"{loc}: source audit run/hash not pinned")
        if r["status"] == "HISTORICAL_FAILURE":
            f = r.get("failure_mode")
            assert_true(isinstance(f, dict) and f.get("run_conclusion") == "failure"
                        and f.get("tested_sha") == r["exact_commit"], f"{loc}: red-run pin mismatch")
        if r["status"] == "REJECTED_ROUTE":
            assert_true(bool(r.get("failure_mode", {}).get("diagnostic")),
                        f"{loc}: rejected route lacks explanation")
    print(f"STATIC PASS: {len(records)} uniquely pinned, typed records")

def score(query: str, record: dict) -> int:
    normalized = query.casefold()
    token_set = set(WORDS.findall(normalized)) - STOPWORDS
    tags = [str(record["title"]), record["id"]] + record["keywords"]
    source = record["source"]
    tags += source.get("symbols", []) + [source["path"]]
    haystack = " ".join(tags).casefold()
    haywords = set(WORDS.findall(haystack))
    relevance = sum(1 for word in token_set if word in haywords)
    bonus = sum(3 for term in record["keywords"] if term.casefold() in normalized)
    return relevance + bonus

def search(db: dict, query: str, k: int) -> list[tuple[int, dict]]:
    ranked = [(score(query, item), item) for item in db["records"]]
    ranked = [(n, r) for n, r in ranked if n > 0]
    return sorted(ranked, key=lambda x: (-x[0], x[1]["id"]))[:k]

def cold_tests(db: dict, tests: dict) -> None:
    assert_true(tests.get("schema") == "bfss-h1-cold-start/v1", "wrong cold-test schema")
    total = len(tests.get("tests", []))
    assert_true(total >= 5, "fewer than five cold-start tests")
    missing = []
    for t in tests["tests"]:
        hits = [item["id"] for _, item in search(db, t["question"], t.get("top_k", 8))]
        absent = sorted(set(t["expected_ids"]) - set(hits))
        print(f"{t['id']}: hits={hits}; missing={absent}")
        if absent:
            missing.append({"id": t["id"], "missing": absent})
    assert_true(not missing, f"cold-start retrieval failures: {missing}")
    print(f"COLD-START PASS: {total}/{total} defined queries returned all required records")

def api_json(route: str, cache: dict) -> dict:
    if route not in cache:
        token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")
        headers = {"Accept": "application/vnd.github+json",
                   "User-Agent": "bfss-h1-evidence-registry-v1",
                   "X-GitHub-Api-Version": "2022-11-28"}
        if token:
            headers["Authorization"] = f"Bearer {token}"
        request = Request("https://api.github.com" + route, headers=headers)
        try:
            with urlopen(request, timeout=25) as response:
                cache[route] = json.loads(response.read())
        except (HTTPError, URLError) as e:
            raise ValidationError(f"GitHub remote read failed {route}: {e}") from e
    return cache[route]

def remote_verify(db: dict) -> None:
    cache: dict = {}
    files_checked = set()
    runs_checked = set()
    artifact_checks = 0
    for r in db["records"]:
        loc = r["id"]
        repo, commit = r["repository"], r["exact_commit"]
        for f in source_objects(r):
            path = f["path"]
            key = (repo, commit, path)
            if key not in files_checked:
                route = f"/repos/{repo}/contents/{quote(path, safe='/')}?ref={commit}"
                item = api_json(route, cache)
                assert_true(item.get("sha") == f["blob_sha"],
                            f"{loc}: GitHub blob mismatch {path}: {item.get('sha')} != {f['blob_sha']}")
                if f.get("symbols"):
                    raw = item.get("content", "")
                    assert_true(bool(raw), f"{loc}: cannot inspect declarations at {path}")
                    content = base64.b64decode(raw).decode("utf-8")
                    for symbol in f["symbols"]:
                        assert_true(symbol.split(".")[-1] in content,
                                    f"{loc}: missing candidate declaration {symbol}")
                files_checked.add(key)
        q = r.get("qualification")
        if q:
            route = f"/repos/{repo}/actions/runs/{q['run_id']}"
            run = api_json(route, cache)
            assert_true(run.get("head_sha") == q["tested_sha"]
                        and run.get("conclusion") == "success"
                        and run.get("run_attempt") == q["run_attempt"],
                        f"{loc}: run head/status/attempt mismatch")
            runs_checked.add(q["run_id"])
            artifacts = api_json(route + "/artifacts?per_page=100", cache).get("artifacts", [])
            target = next((a for a in artifacts if a.get("id") == q["evidence_artifact_id"]), None)
            if target:
                assert_true(target.get("digest") == q["evidence_digest"],
                            f"{loc}: retained artifact digest mismatch")
                artifact_checks += 1
            else:
                expiration = datetime.fromisoformat(q["artifact_expires_at"].replace("Z","+00:00"))
                assert_true(datetime.now(timezone.utc) > expiration,
                            f"{loc}: missing artifact before expected expiry")
                print(f"RETAINED HASH ONLY (artifact expired): {loc}")
        audit = r.get("source_audit")
        if audit:
            run = api_json(f"/repos/{repo}/actions/runs/{audit['run_id']}", cache)
            assert_true(run.get("head_sha") == audit["tested_sha"]
                        and run.get("conclusion") == audit["conclusion"] == "success"
                        and run.get("run_attempt") == audit["run_attempt"],
                        f"{loc}: source audit run/status/commit mismatch")
            runs_checked.add(audit["run_id"])
        if r["status"] == "HISTORICAL_FAILURE":
            f = r["failure_mode"]
            run = api_json(f"/repos/{repo}/actions/runs/{f['run_id']}", cache)
            assert_true(run.get("head_sha") == f["tested_sha"]
                        and run.get("conclusion") == "failure", f"{loc}: red-run mismatch")
            runs_checked.add(f["run_id"])
    print(f"REMOTE PASS: {len(files_checked)} pinned source files, "
          f"{len(runs_checked)} exact CI runs, {artifact_checks} available evidence digests")

def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--registry", type=Path, default=REGISTRY)
    p.add_argument("--tests", type=Path, default=TESTS)
    p.add_argument("--check", action="store_true", help="Validate schema, hashes and status firewalls")
    p.add_argument("--cold-test", action="store_true", help="Run six conversation-independent retrieval tests")
    p.add_argument("--remote", action="store_true", help="Read-only GitHub API pin, CI and artifact checks")
    p.add_argument("--search", type=str, help="Search by declaration, carrier, run, failure or idea")
    p.add_argument("--top", type=int, default=10)
    a = p.parse_args()
    try:
        db = load(a.registry)
        check_schema(db)
        if a.cold_test:
            cold_tests(db, load(a.tests))
        if a.remote:
            remote_verify(db)
        if a.search:
            matches = [{"id": r["id"], "score": s, "status": r["status"],
                        "title": r["title"], "source": r["location_url"],
                        "qualification_run": (r.get("qualification") or {}).get("run_id")}
                       for s, r in search(db, a.search, a.top)]
            print(json.dumps(matches, indent=2))
    except (ValidationError, KeyError, ValueError, OSError, json.JSONDecodeError) as e:
        print(f"H1 FAIL: {e}", file=sys.stderr)
        return 1
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
