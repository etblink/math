#!/usr/bin/env python3
"""Truth-first SM-D0 curated empirical ledger verifier.

Checks exact frozen first-pass primary-source records and provenance fields.
Does NOT fetch web pages, establish statistical independence, recompute
experimental likelihoods, or prove that any candidate theory is true.
"""
from __future__ import annotations

import copy
import datetime as dt
import hashlib
import json
import re
import sys
from decimal import Decimal, InvalidOperation
from pathlib import Path
from urllib.parse import urlparse


ROOT = Path(__file__).resolve().parents[3]
LEDGER_PATH = ROOT / "research/standard-model/data/SM_D0_EMPIRICAL_CONSTRAINTS_ASOF_2026_11_18.json"
CUTOFF = dt.date(2026, 11, 18)
ALLOWED_DOMAINS = {"higgs", "electroweak", "neutrinos", "baryon_number", "cp_violation"}
ALLOWED_PUBLISHER_HOSTS = {
    "cms.cern", "pmc.ncbi.nlm.nih.gov", "arxiv.org", "doi.org",
    "journals.aps.org", "news.fnal.gov"
}
ALLOWED_SOURCE_STATUSES = {
    "peer_reviewed_primary", "collaboration_preliminary",
    "collaboration_preprint", "official_collaboration_release"
}
# These literal crosschecks were separately transcribed from the identified
# primary papers / official collaborations; not recomputed BFSS outputs.
EXPECTED = {
    "higgs_mass_cms_2026": ("measurement", "125.065", "0.088", "0.088", "GeV",
        "https://cms.cern/news/how-much-does-higgs-boson-weigh-cms-gives-its-most-precise-answer-yet", "2026-11-02"),
    "w_mass_cms_nature_2026": ("measurement", "80360.2", "9.9", "9.9", "MeV",
        "https://pmc.ncbi.nlm.nih.gov/articles/PMC13061639/", "2026-04-08"),
    "higgs_inclusive_mu_cms_2026": ("measurement", "1.014", "0.053", "0.055", "ratio",
        "https://arxiv.org/abs/2602.18611", "2026-08-14"),
    "juno_sin2theta12_2026": ("measurement", "0.3092", "0.0087", "0.0087", "dimensionless",
        "https://doi.org/10.1038/s41586-026-10538-z", "2026-06-10"),
    "juno_dm2_21_2026": ("measurement", "0.0000750", "0.0000012", "0.0000012", "eV^2",
        "https://doi.org/10.1038/s41586-026-10538-z", "2026-06-10"),
    "p_to_e_pi0_sk_2020": ("lower_limit", "2.4e34", "0.90", "", "years",
        "https://journals.aps.org/prd/abstract/10.1103/PhysRevD.102.112011", "2020-12-22"),
    "p_to_e_pi0pi0_sk_2026": ("lower_limit", "7.2e33", "0.90", "", "years",
        "https://journals.aps.org/prd/abstract/10.1103/frxr-pk3t", "2026-10-26"),
    "p_to_mu_pi0pi0_sk_2026": ("lower_limit", "4.5e33", "0.90", "", "years",
        "https://journals.aps.org/prd/abstract/10.1103/frxr-pk3t", "2026-10-26"),
    "p_to_e_invisible_sk_2026": ("lower_limit", "1.72e33", "0.90", "", "years",
        "https://journals.aps.org/prd/abstract/10.1103/rsr5-d3x2", "2026-10-13"),
    "muon_edm_fermilab_2026": ("upper_limit", "1.1e-19", "0.95", "", "e*cm",
        "https://news.fnal.gov/2026/08/muon-g-2-experiment-places-new-constraints-on-a-forbidden-property-of-muons/", "2026-08"),
}

CHANNELS = {
    "p_to_e_pi0_sk_2020": "p→e+π0",
    "p_to_e_pi0pi0_sk_2026": "p→e+π0π0",
    "p_to_mu_pi0pi0_sk_2026": "p→μ+π0π0",
    "p_to_e_invisible_sk_2026": "p→e+X (invisible massless neutral X)",
}
REQUIRED_OPEN_REQUIREMENTS = {
    "three_generations", "higgs_yukawa_spectrum", "neutrino_absolute_mass",
    "ckm_pmns_full", "4d_chirality_gauge", "quantum_gravity"
}


def req(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def d(s: str) -> Decimal:
    req(isinstance(s, str), "numeric values must be decimal strings")
    try:
        result = Decimal(s)
    except (InvalidOperation, ValueError) as exc:
        raise AssertionError(f"invalid decimal {s!r}") from exc
    req(result.is_finite(), "nonfinite decimal forbidden")
    return result


def validate_date(text: str) -> None:
    req(isinstance(text, str), "publication_date must be string")
    if re.fullmatch(r"\d{4}-\d{2}", text):
        date = dt.date.fromisoformat(text + "-01")
    else:
        req(re.fullmatch(r"\d{4}-\d{2}-\d{2}", text) is not None,
            "date must have year-month or full YYYY-MM-DD precision")
        date = dt.date.fromisoformat(text)
    req(date <= CUTOFF, "future-dated source")
    req(date.year >= 2019, "source unexpected stale era")


def valid(doc: dict) -> None:
    req(isinstance(doc, dict), "root must be object")
    req(doc.get("schema") == "SM-D0_EVIDENCE_LEDGER/0.1", "schema mismatch")
    req(doc.get("as_of") == "2026-11-18", "cutoff drift")
    req(doc.get("frozen_pdg_edition") ==
        "https://pdg.lbl.gov/2026/listings/particle_properties.html",
        "historical PDG edition drift (pdgLive can advance to 2027)")
    governance = doc.get("governance")
    req(isinstance(governance, dict), "missing governance")
    req(governance.get("source_review_date") == "2026-11-18", "source review date changed")
    for key in ("purpose", "qualifications", "claim_ceiling", "online_recheck_policy"):
        req(isinstance(governance.get(key), str) and len(governance[key]) > 45,
            f"missing meaningful governance field {key}")
    rows = doc.get("constraints")
    req(isinstance(rows, list) and len(rows) == len(EXPECTED), "snapshot row count drift")
    ids = [x.get("id") for x in rows]
    req(len(set(ids)) == len(ids) and set(ids) == set(EXPECTED), "missing or duplicate ID")
    for row in rows:
        rid = row["id"]
        expected = EXPECTED[rid]
        req(row.get("domain") in ALLOWED_DOMAINS, f"unrecognized domain for {rid}")
        req(isinstance(row.get("observable"), str) and len(row["observable"]) > 15,
            f"no observable for {rid}")
        req(row.get("kind") == expected[0], f"measurement/limit swapped for {rid}")
        val = row.get("value")
        req(isinstance(val, dict) and val.get("unit") == expected[4],
            f"unit mismatch for {rid}")
        if row["kind"] == "measurement":
            req(d(val.get("central")) == d(expected[1]), f"central value mismatch for {rid}")
            req(d(val.get("error_minus")) == d(expected[2]), f"lower error mismatch for {rid}")
            req(d(val.get("error_plus")) == d(expected[3]), f"upper error mismatch for {rid}")
            req(d(val["error_minus"]) > 0 and d(val["error_plus"]) > 0,
                f"uncertainty not positive for {rid}")
            req("threshold" not in val and "confidence_level" not in val,
                f"limit fields improperly placed in measurement {rid}")
            req("uncertainty_label" in val, f"uncertainty provenance missing {rid}")
        else:
            req(d(val.get("threshold")) == d(expected[1]),
                f"threshold mismatch for {rid}")
            req(d(val.get("confidence_level")) == d(expected[2]),
                f"confidence level mismatch for {rid}")
            req(d(val["threshold"]) > 0, f"invalid bound for {rid}")
            req(not any(k in val for k in ("central", "error_minus", "error_plus")),
                f"limit and measurement data mixed {rid}")
            req("limit_label" in val and "CL" in val["limit_label"],
                f"confidence semantics missing for {rid}")
        req(row.get("source_date") == expected[6], f"source date changed for {rid}")
        validate_date(row["source_date"])
        source = row.get("source")
        req(isinstance(source, dict), f"missing source for {rid}")
        req(source.get("url") == expected[5], f"source link changed for {rid}")
        u = urlparse(source["url"])
        req(u.scheme == "https" and u.hostname in ALLOWED_PUBLISHER_HOSTS,
            f"nonprimary or insecure source for {rid}")
        req(source.get("status") in ALLOWED_SOURCE_STATUSES, f"bad source status for {rid}")
        req(isinstance(source.get("title"), str) and len(source["title"]) >= 30,
            f"missing paper title for {rid}")
        details = row.get("details")
        interpretation = row.get("interpretation")
        req(isinstance(details, dict) and isinstance(interpretation, dict),
            f"missing model context for {rid}")
        for key in ("model_test", "limitation"):
            req(isinstance(interpretation.get(key), str) and
                len(interpretation[key]) >= 60, f"unsupported physical inference {rid}/{key}")
        req(isinstance(details.get("aggregation"), str) and len(details["aggregation"]) >= 25,
            f"missing correlation/aggregation semantics for {rid}")
        if rid in CHANNELS:
            req(details.get("decay_channel") == CHANNELS[rid],
                f"proton decay modes cannot be interchanged: {rid}")
    by_id = {row["id"]: row for row in rows}
    req(by_id["higgs_inclusive_mu_cms_2026"]["details"]["analysis_mass_assumption"] ==
        "125.38 GeV", "Higgs rate fit assumed mass lost")
    req(by_id["higgs_mass_cms_2026"]["kind"] == "measurement",
        "Higgs mass not a model prediction in this ledger")
    for juno_id in ("juno_sin2theta12_2026", "juno_dm2_21_2026"):
        req(by_id[juno_id]["details"]["analysis_ordering"] == "normal ordering scenario",
            "JUNO analysis ordering missing")
        req("correlated" in by_id[juno_id]["details"]["aggregation"],
            "correlated JUNO measurements falsely declared independent")
    requirements = doc.get("open_requirements")
    req(isinstance(requirements, list), "missing open questions")
    req({x.get("id") for x in requirements} == REQUIRED_OPEN_REQUIREMENTS,
        "missing important unresolved particle physics constraints")
    req(all(isinstance(x.get("why"), str) and len(x["why"]) >= 40
            and x.get("status") for x in requirements), "unreasoned open requirements")


def run() -> None:
    raw = LEDGER_PATH.read_bytes()
    doc = json.loads(raw)
    valid(doc)
    mutations = []
    def mutate(label, modify):
        clone = copy.deepcopy(doc)
        modify(clone)
        mutations.append((label, clone))
    mutate("wrong_w_mass", lambda x: x["constraints"][1]["value"].__setitem__("central","80360.0"))
    mutate("future_dated_source", lambda x: x["constraints"][0].__setitem__("source_date","2026-12-01"))
    mutate("duplicate_row", lambda x: x["constraints"][1].__setitem__("id",x["constraints"][0]["id"]))
    mutate("limit_as_measurement", lambda x: x["constraints"][5].__setitem__("kind","measurement"))
    mutate("wrong_confidence", lambda x: x["constraints"][6]["value"].__setitem__("confidence_level","0.95"))
    mutate("proton_channel_swap", lambda x: x["constraints"][7]["details"].__setitem__(
        "decay_channel","p→e+π0π0"))
    mutate("juno_false_independence", lambda x: x["constraints"][3]["details"].__setitem__(
        "aggregation","standalone source; statistically independent"))
    mutate("higgs_fit_assumed_mass_erased", lambda x: x["constraints"][2]["details"].__setitem__(
        "analysis_mass_assumption","125.065 GeV"))
    mutate("missing_limitations", lambda x: x["constraints"][0]["interpretation"].__setitem__(
        "limitation",""))
    mutate("live_pdg_unpinned", lambda x: x.__setitem__(
        "frozen_pdg_edition","https://pdg.lbl.gov/"))
    for label, mutant in mutations:
        try:
            valid(mutant)
        except (AssertionError, ValueError, TypeError, KeyError):
            continue
        raise AssertionError(f"negative control {label} was incorrectly accepted")
    print("SM_D0_10_PRIMARY_SOURCED_RECORDS_MEASUREMENT_LIMIT_TYPES_10_NEGATIVE_MUTATIONS_PASSED")
    result = {
        "schema": "SM-D0_VALIDATION_RESULT/0.1",
        "as_of": doc["as_of"],
        "ledger_sha256": hashlib.sha256(raw).hexdigest(),
        "validator_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "record_count": len(doc["constraints"]),
        "measurement_count": sum(x["kind"] == "measurement" for x in doc["constraints"]),
        "lower_limit_count": sum(x["kind"] == "lower_limit" for x in doc["constraints"]),
        "upper_limit_count": sum(x["kind"] == "upper_limit" for x in doc["constraints"]),
        "negative_mutations_rejected": len(mutations),
        "primary_sources_fetched_in_ci": False,
        "assertion_ceiling": "Schema, exact transcribed values/source URLs and semantics, not independent external-source verification or candidate model test"
    }
    output = Path(sys.argv[1]) if len(sys.argv) > 1 else None
    if output:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    run()
