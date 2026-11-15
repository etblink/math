#!/usr/bin/env python3
"""BFSS operational checkpoint consistency. No Lean, no external dependencies.

Advisory check only: does not verify actual CI run conclusions, physical
theorems, or protect a branch ref.
"""
from __future__ import annotations

import json
import hashlib
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
STATE_PATH = ROOT / "BFSS_GATE_STATE.json"
ROADMAP_PATH = ROOT / "BFSS_ACTIVE_ROADMAP.md"
CANONICAL_BRANCH = "integration/bfss-unified-research-20261108"
EXPECTED_MATHLIB = "d13f23b723b8a846827a245b89c10fc7d3f11612"


def require(ok, msg):
    if not ok:
        raise AssertionError(msg)


def main():
    s = json.loads(STATE_PATH.read_text(encoding="utf-8"))
    require(s.get("schema_version") == 1, "schema mismatch")
    require(s.get("purpose") == "canonical_live_checkpoint_not_proof_receipt", "checkpoint/proof conflation")
    require(s.get("branch") == CANONICAL_BRANCH, "unreviewed branch migration")
    require(s.get("roadmap") == ROADMAP_PATH.name, "canonical roadmap moved")
    require(re.fullmatch("M[1-8]", s.get("milestone", "")) is not None, "milestone must be M1-M8")
    q, a = s["last_qualified"], s["active"]
    gate_rx = re.compile(r"P3-(?:D5[A-Z][0-9]*[A-Z]?|M[235][A-Z][0-9]*(?:[A-Z][0-9]*)?(?:-BI)?|AUX-HARDY-G[0-9]+)")
    require(gate_rx.fullmatch(q.get("gate", "")) is not None, "qualified gate ID malformed")
    require(gate_rx.fullmatch(a.get("gate", "")) is not None, "active gate ID malformed")
    require(q["verdict"] == "GREEN", "last qualified verdict not GREEN")
    require(a["status"] in {"PENDING_STRICT_CI", "RED_UNQUALIFIED", "GREEN_QUALIFIED", "BLOCKED", "RESEARCH_ONLY_NOT_STAGED"},
            "invalid active status")
    # Requalification of historically accepted original physical sources has
    # a pinned ancestor-closure manifest, whose deduplicated count is produced
    # by the *new* strict workflow. Never invent that count before its preflight.
    source_join = a.get("gate") == "P3-M3W0D0"
    auxiliary_candidate = a.get("gate") == "P3-AUX-HARDY-G9"
    kinetic_candidate = a.get("gate") == "P3-AUX-HARDY-G10"
    derivative_candidate = a.get("gate") == "P3-AUX-HARDY-G11"
    bilinear_candidate = a.get("gate") == "P3-AUX-HARDY-G12"
    core_assembly_candidate = a.get("gate") == "P3-AUX-HARDY-G13"
    core_collapse_candidate = a.get("gate") == "P3-AUX-HARDY-G14"
    tau_norm_candidate = a.get("gate") == "P3-AUX-HARDY-G15"
    if tau_norm_candidate:
        g15 = s.get("g15_tau_norm_prospective", {})
        require(q.get("gate") == "P3-AUX-HARDY-G14" and q.get("run_id") == 43749092953
                and a.get("qualification") is False and g15.get("qualification") is False
                and ((a.get("status") == "PENDING_STRICT_CI" and g15.get("status") == "STAGED_UNQUALIFIED")
                     or (a.get("status") in {"RED_UNQUALIFIED", "BLOCKED"} and g15.get("status") == "RED_UNQUALIFIED"
                         and ((a.get("run_id") == 43751403932 and a.get("candidate_sha") == "a2d247a1000f2d59807092358ac0f6f71b2909a1")
                              or (a.get("run_id") == 43753325231 and a.get("candidate_sha") == "271ee0174f173cf2917514cd225be76385a1592f"))
                         and a.get("manifest_pins") == 169
                         and (ROOT / a.get("red_receipt", "__missing__")).is_file()))
                and ((a.get("attempt") == "R1" and g15.get("prospective_receipt_commit") == "ae83c423e57bc4ff33b02f0d255728ac59206848")
                     or (a.get("attempt") == "R2" and g15.get("prospective_receipt_commit") == "d7c724f87a30ccb910d1f98b8b3afd6c173ee515"
                         and g15.get("prior_red_run") == 43751403932
                         and (ROOT / g15.get("prior_red_receipt", "__missing__")).is_file()))
                and (ROOT / g15.get("receipt", "__missing__")).is_file()
                and g15.get("expected_manifest_pins") == a.get("expected_manifest_pins") == 169
                and g15.get("source_roots") == 6 and g15.get("consumer_reports") == 12
                and g15.get("native_examples") == 12 and g15.get("early_helper_reports") == [1, 3, 1],
                "G15 cannot bypass accepted G14 or its coefficient norm contract")
        if a.get("status") == "RED_UNQUALIFIED" or a.get("attempt") == "R2":
            archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G15_R1_43751403932_evidence.zip"
            require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                    == "555b4e20d3f43613db646871fa9c3917100e9ae0d87aa07f194d7da91fa09ea1",
                    "G15 complete red artifact missing or changed")
        for kind, sha in {'source': ('3137f2fa64f3d1cbf08f06588c31303e06df4caa' if a.get('attempt') == 'R2' else '1138153ca0ebae9fb5b5e96d9c380d377dd24610'), 'consumer': '7e873eae9001339a0f746637b9ac906311ec106b', 'workflow': ('898e8882e6d5512e98b016a1ad918a7247aff33c' if a.get('attempt') == 'R2' else '0c3fbf040494b70d52fb44c76a7089dcac1d090b')}.items():
            data = (ROOT / a[kind]).read_bytes()
            require(a.get(kind) == g15.get(kind) and a.get(kind + "_blob") == g15.get(kind + "_blob")
                    == hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == sha,
                    "G15 staged bytes drift: " + kind)
    if tau_norm_candidate and s.get("g15_real_coefficient_sum_diagnostic") and not s["g15_real_coefficient_sum_diagnostic"].get("qualification"):
        diagnostic = s["g15_real_coefficient_sum_diagnostic"]
        require(a.get("status") == "BLOCKED" and a.get("run_id") == 43753325231
                and a.get("full_retry_blocked") is True and diagnostic.get("main_G15_blocked") is True
                and diagnostic.get("qualification") is False
                and (ROOT / diagnostic.get("prospective_receipt", "__missing__")).is_file(),
                "Repeated G15 boundary requires isolated diagnostic; no full retry")
        require(diagnostic.get("status") in {"REGISTERED_NOT_EXECUTED", "STAGED_UNQUALIFIED", "CI_IN_PROGRESS", "RED_UNQUALIFIED"},
                "unreviewed G15 D0 status")
        if diagnostic.get("status") != "REGISTERED_NOT_EXECUTED":
            require(diagnostic.get("prospective_receipt_commit") == "b2fa6246e72fce8616b0788c2780aa75dab08398"
                    and diagnostic.get("expected_manifest_pins") == 169 and diagnostic.get("manifest_pins") is None
                    and diagnostic.get("generic_reports") == 2 and diagnostic.get("native_reports") == 4
                    and diagnostic.get("native_examples") == 3,
                    "G15 D0 bounded contract or unmeasured manifest drift")
            for kind, sha in {'generic_source': '732cee2546bfd629fe8bf0b20e63ac3ef356b5bd', 'native_source': 'bb36497f6b2ff95be2395da263effb1f74b9b7b3', 'workflow': 'af7d10b5660898547ddde28d797e164fbdf88369'}.items():
                data = (ROOT / diagnostic[kind]).read_bytes()
                require(diagnostic.get(kind + "_blob") == hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == sha,
                        "G15 D0 staged bytes drift: " + kind)
        archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G15_R2_43753325231_evidence.zip"
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "db2ec23889c6611ebcc2533d89c6678129dd8e0ffd3c0f3d19948282b1190d8d",
                "G15 R2 complete red evidence missing or changed")
    if tau_norm_candidate and s.get("g15_real_coefficient_sum_diagnostic", {}).get("qualification"):
        diagnostic = s["g15_real_coefficient_sum_diagnostic"]
        result = diagnostic.get("result", {})
        require(diagnostic.get("status") == "GREEN_DIAGNOSTIC_QUALIFIED"
                and diagnostic.get("run_id") == 43756234296 and diagnostic.get("job_id") == 132940823716
                and diagnostic.get("tested_sha") == "337f33b74ae6bc0fecce598ae52c1612c7d25413"
                and diagnostic.get("manifest_pins") == 169
                and diagnostic.get("manifest_hash") == "bd200b231d69143399efae8372794f0c7456bf88f0e89f74590d03c1b45d0b33"
                and diagnostic.get("artifact_id") == 14178828720
                and (ROOT / diagnostic.get("receipt", "__missing__")).is_file()
                and result.get("generic_reports") == 2 and result.get("native_reports") == 4
                and result.get("literal_paired_examples") == 3 and result.get("main_G15_qualification") is False
                and (a.get("status") == "BLOCKED" or (a.get("attempt") == "R3" and a.get("status") == "PENDING_STRICT_CI"
                    and s.get("g15_tau_norm_prospective", {}).get("accepted_diagnostic_run") == 43756234296)),
                "G15 D0 exact acceptance or guarded full retry missing")
        for kind, sha in {"generic_source":"732cee2546bfd629fe8bf0b20e63ac3ef356b5bd", "native_source":"bb36497f6b2ff95be2395da263effb1f74b9b7b3", "workflow":"af7d10b5660898547ddde28d797e164fbdf88369"}.items():
            data = (ROOT / diagnostic[kind]).read_bytes()
            require(diagnostic.get(kind + "_blob") == hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == sha,
                    "G15 D0 accepted bytes drift: " + kind)
        archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G15_D0_R1_43756234296_evidence.zip"
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "0e8d2c8fa0a4a9dd07c9e494ad514974e220af1c5f896b026ff534c251c049f0",
                "G15 D0 complete accepted artifact missing or changed")
        prior_red = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G15_R2_43753325231_evidence.zip"
        require(prior_red.is_file() and hashlib.sha256(prior_red.read_bytes()).hexdigest()
                == "db2ec23889c6611ebcc2533d89c6678129dd8e0ffd3c0f3d19948282b1190d8d",
                "G15 R2 red evidence lost after diagnostic")
    if core_collapse_candidate and a["status"] != "GREEN_QUALIFIED":
        g14 = s.get("g14_core_collapse_prospective", {})
        require(q.get("gate") == "P3-AUX-HARDY-G13" and q.get("run_id") == 43746155492
                and a.get("status") == "PENDING_STRICT_CI" and a.get("qualification") is False
                and g14.get("status") == "STAGED_UNQUALIFIED" and g14.get("qualification") is False
                and g14.get("prospective_receipt_commit") == "893ac983aae11c34b231382acf3c895696a2d4e0"
                and (ROOT / g14.get("receipt", "__missing__")).is_file()
                and g14.get("expected_manifest_pins") == a.get("expected_manifest_pins") == 168
                and g14.get("source_roots") == 6 and g14.get("consumer_reports") == 12
                and g14.get("native_examples") == 12 and g14.get("early_helper_reports") == [1, 3, 1],
                "G14 cannot bypass accepted G13 or its bounded core contract")
        for kind, sha in {'source': 'ef1fd6b67dd01c4dc893ef683ab7c75db44973c5', 'consumer': '9dfb7f66c6d3abe6476d4b5a37cd10b695efdff9', 'workflow': 'dfcee5b20eac4865aed407a1966c9e6b97587542'}.items():
            data = (ROOT / a[kind]).read_bytes()
            require(a.get(kind) == g14.get(kind) and a.get(kind + "_blob") == g14.get(kind + "_blob")
                    == hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == sha,
                    "G14 staged bytes drift: " + kind)
    if core_assembly_candidate and a["status"] != "GREEN_QUALIFIED":
        g13 = s.get("parallel_auxiliary_hardy_core_kinetic_tau_assembly", {})
        require(q.get("gate") == "P3-AUX-HARDY-G12" and q.get("run_id") == 43740253917
                and a.get("qualification") is False and g13.get("qualification") is False
                and ((a.get("status") == "PENDING_STRICT_CI" and g13.get("status") == "STAGED_UNQUALIFIED")
                     or (a.get("status") == "RED_UNQUALIFIED" and g13.get("status") == "RED_UNQUALIFIED"
                         and a.get("run_id") == 43743787307
                         and a.get("candidate_sha") == "6da84c396b509436588d7b2ec2e2a1428665e066"
                         and a.get("manifest_pins") == 167
                         and (ROOT / a.get("red_receipt", "__missing__")).is_file()))
                and ((a.get("attempt") == "R1" and g13.get("prospective_receipt_commit") == "cd5520f58b00a83dce1ab73d916c4958ba0eba92")
                     or (a.get("attempt") == "R2" and g13.get("prospective_receipt_commit") == "f26a4d54d677d29c2e2f2a25a74d45da0c47ff49"
                         and g13.get("prior_red_run") == 43743787307
                         and (ROOT / g13.get("prior_red_receipt", "__missing__")).is_file()))
                and g13.get("reviewed_original_baseline") == "8b54ce6b150d8f3689342dd6bf80179414ab95fa"
                and (ROOT / g13.get("prospective_receipt", "__missing__")).is_file()
                and g13.get("expected_manifest_pin_count") == a.get("expected_manifest_pins") == 167
                and g13.get("expected_source_roots") == 6 and g13.get("expected_consumer_reports") == 12
                and g13.get("native_examples") == 12 and g13.get("early_helper_reports") == [1, 3, 1],
                "G13 cannot bypass accepted G12 or its exact original-core contract")
        if a.get("status") == "RED_UNQUALIFIED" or a.get("attempt") == "R2":
            archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G13_R1_43743787307_evidence.zip"
            require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                    == "060fe7984f0a9c493482f54d9abd149432be35e0a7bccefdecf72b455f3bad09",
                    "G13 complete red artifact missing or changed")
        for kind, sha in {'source': 'b112d763fe63a864e3b2ed72f551a521995b42b3', 'consumer': ('31437df721c4cca33e8ff7bd9cafc3826705bbc9' if a.get('attempt') == 'R2' else 'a82dd8590dea928538ebbef1c66bbc22b3726cdf'), 'workflow': ('1111175721389f3d03ca7fdea8867f7fcd095aea' if a.get('attempt') == 'R2' else '02363ae34c5fd3c214b000bde0a79835d2b67ce5')}.items():
            require(a.get(kind) == g13.get(kind) and (ROOT / g13[kind]).is_file(),
                    "G13 registration path drift: " + kind)
            data = (ROOT / g13[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(a.get(kind + "_blob") == g13.get(kind + "_blob") == actual == sha,
                    "G13 staged bytes drift: " + kind)
    if bilinear_candidate and a["status"] != "GREEN_QUALIFIED":
        g12 = s.get("parallel_auxiliary_hardy_derivative_fock_bilinear", {})
        require(q.get("gate") == "P3-AUX-HARDY-G11" and q.get("run_id") == 43708533905
                and a.get("qualification") is False and g12.get("qualification") is False
                and ((a.get("status") == "PENDING_STRICT_CI" and g12.get("status") == "STAGED_UNQUALIFIED")
                     or (a.get("status") in {"RED_UNQUALIFIED", "BLOCKED"} and g12.get("status") == "RED_UNQUALIFIED"
                         and a.get("run_id") in {43711440502, 43730966120, 43738033537}
                         and (ROOT / g12.get("red_receipt", "__missing__")).is_file()))
                and ((a.get("attempt") == "R1" and g12.get("prospective_receipt_commit") == "a080af0c4b08f9085d6a4dfdc1a3169541b132ac")
                     or (a.get("attempt") == "R2" and g12.get("prospective_receipt_commit") == "3a2e7cd63544cda2cded485f3f5be1f0a3683267"
                         and g12.get("prior_red_run") == 43711440502
                         and (ROOT / g12.get("prior_red_receipt", "__missing__")).is_file())
                     or (a.get("attempt") == "R3" and g12.get("prospective_receipt_commit") == "443d9913145656589cc4f3ce29f76f439155e61a"
                         and g12.get("prior_red_run") == 43730966120
                         and g12.get("accepted_diagnostic_run") == 43734601883
                         and (ROOT / g12.get("prior_red_receipt", "__missing__")).is_file())
                     or (a.get("attempt") == "R4" and g12.get("prospective_receipt_commit") == "22b8877413feffb7467abbcb5af000613cf95d96"
                         and g12.get("prior_red_run") == 43738033537
                         and g12.get("source_strict_verified_in_prior_run") == 43738033537
                         and g12.get("accepted_diagnostic_run") == 43734601883
                         and (ROOT / g12.get("prior_red_receipt", "__missing__")).is_file()))
                and g12.get("reviewed_original_baseline") == "7459e472085a6ef9b3c5c8352073ea1bafa6645e"
                and (ROOT / g12.get("prospective_receipt", "__missing__")).is_file()
                and g12.get("expected_manifest_pin_count") == a.get("expected_manifest_pins") == 166
                and g12.get("expected_source_roots") == 6 and g12.get("expected_consumer_reports") == 12
                and g12.get("early_helper_reports") == [1, 3, 1] and g12.get("native_examples") == 12,
                "G12 cannot bypass accepted G11 or its exact prospective contract")
        for kind, sha in {'source': ('f6296a909dcd84a9800012f18f55f7005866cb59' if a.get('attempt') in {'R3', 'R4'} else ('80ea179d9e2afa223bda77ce0d62af6ab61db422' if a.get('attempt') == 'R2' else '567661beef53c27fb8d3a3282a580e296c992962')), 'helper': '2c0b07a603a94ad18342a53a5d88eaad5345cb5d', 'consumer': ('77b70b7a906d26befcc2f08ab71fa3478c4da0d0' if a.get('attempt') == 'R4' else '13f5557809b7ecce2dfeb60d2988febcd85bf529'), 'workflow': ('440e10c2736994e5fa90c2c604fd8481dd703d88' if a.get('attempt') == 'R4' else ('a6671b7de617bae1df3c1925286d50ae35d1ef3e' if a.get('attempt') == 'R3' else ('a90a4f2b04623abdfe7b1db860b3716f0d60d570' if a.get('attempt') == 'R2' else 'd987f7e02dfe98be035d1710409f1ad04601ddc9')))}.items():
            require(a.get(kind) == g12.get(kind) and (ROOT / g12[kind]).is_file(),
                    "G12 registration path drift: " + kind)
            data = (ROOT / g12[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(a.get(kind + "_blob") == g12.get(kind + "_blob") == actual == sha,
                    "G12 staged bytes drift: " + kind)
    if bilinear_candidate and s.get("g12_typed_zero_action_diagnostic") and not s["g12_typed_zero_action_diagnostic"].get("qualification"):
        diagnostic = s.get("g12_typed_zero_action_diagnostic", {})
        require(a.get("status") == "BLOCKED" and a.get("run_id") == 43730966120 and diagnostic.get("main_G12_blocked") is True
                and diagnostic.get("prior_red_run") == 43730966120
                and diagnostic.get("qualification") is False
                and (ROOT / diagnostic.get("prospective_receipt", "__missing__")).is_file(),
                "G12 repeated source boundary requires isolated diagnostic; no full retry")
        require(diagnostic.get("status") in {"REGISTERED_NOT_EXECUTED", "STAGED_UNQUALIFIED", "CI_IN_PROGRESS", "RED_UNQUALIFIED"},
                "unreviewed G12 diagnostic status")
        if diagnostic.get("status") != "REGISTERED_NOT_EXECUTED":
            require(((diagnostic.get("attempt") != "R2" and diagnostic.get("prospective_receipt_commit") == "d57c090740bcbc5648b778fd7a1a53afe8b2bcef")
                     or (diagnostic.get("attempt") == "R2" and diagnostic.get("prospective_receipt_commit") == "536a26c3341016301733cb46690819aee077b21c"
                         and diagnostic.get("prior_diagnostic_red_run") == 43733424334
                         and (ROOT / diagnostic.get("prior_diagnostic_red_receipt", "__missing__")).is_file()))
                    and diagnostic.get("expected_manifest_pins") == 166
                    and diagnostic.get("generic_reports") == 2 and diagnostic.get("native_reports") == 5
                    and diagnostic.get("native_examples") == 3
                    and ((diagnostic.get("status") == "RED_UNQUALIFIED"
                          and diagnostic.get("run_id") == 43733424334 and diagnostic.get("manifest_pins") == 166
                          and diagnostic.get("manifest_hash") == "8bff719f6a81528469463d86eb51393e926833ef16b082470e0369c53e334590"
                          and (ROOT / diagnostic.get("red_receipt", "__missing__")).is_file())
                         or (diagnostic.get("status") != "RED_UNQUALIFIED" and diagnostic.get("manifest_pins") is None)),
                    "G12 D0 diagnostic contract or unmeasured manifest drift")
            for kind, sha in {'generic_source': ('22345a2348f3c2cfcbb893037a07dcbe0030ca34' if diagnostic.get('attempt') == 'R2' else '0a7b8ea4145a004d30577034c88db90346f2d77e'), 'native_source': '12675baab7f764dbcb8f276d357246c70956a927', 'workflow': ('fd23b619157723a8965d83e11d3c61433a81ab86' if diagnostic.get('attempt') == 'R2' else '5057a89c608565ab536ad89690628389816fee3f')}.items():
                data = (ROOT / diagnostic[kind]).read_bytes()
                actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
                require(diagnostic.get(kind + "_blob") == actual == sha,
                        "G12 D0 diagnostic bytes drift: " + kind)
            archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G12_R2_43730966120_evidence.zip"
            require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                    == "62fd68bee2d6cbfbc947cea7c74f585c155f406ede48db9e9e2f746bc0c55a3f",
                    "G12 R2 complete red evidence missing or changed")
            if diagnostic.get("attempt") == "R2":
                archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G12_D0_R1_43733424334_evidence.zip"
                require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                        == "8a2152150071afdc3523966561ef912b688f4eabb8ef04c2fbf77b257e1d0dae",
                        "D0 R1 complete red evidence missing or changed")


    if bilinear_candidate and s.get("g12_typed_zero_action_diagnostic", {}).get("qualification"):
        diagnostic = s["g12_typed_zero_action_diagnostic"]
        receipt = "research/spectral-p2-original-field/P3_AUX_HARDY_G12_D0_R2_GREEN_43734601883_TYPED_ZERO_ACTION_ACCEPTANCE_2026_11_15.md"
        require(diagnostic.get("status") == "GREEN_DIAGNOSTIC_QUALIFIED"
                and diagnostic.get("run_id") == 43734601883 and diagnostic.get("job_id") == 132874310874
                and diagnostic.get("tested_sha") == "5e0836ea1923c8f153bd2b3a0d9c491ebcecabf9"
                and diagnostic.get("manifest_pins") == 166
                and diagnostic.get("manifest_hash") == "968e3ea902d2c88d03c4a4c29482f44be9a67cbb44dfe481755aff54c0491d74"
                and diagnostic.get("artifact_id") == 14170108662
                and diagnostic.get("artifact_sha256") == "e9f80f6e2bf5ad8edc84ebeba040b2d06e877e5afe7f10175b5d6491187176e4"
                and diagnostic.get("generic_reports") == 2 and diagnostic.get("native_reports") == 5
                and diagnostic.get("native_examples") == 3
                and diagnostic.get("acceptance_receipt") == receipt and (ROOT / receipt).is_file(),
                "G12 D0 exact diagnostic acceptance missing")
        for kind, sha in {'generic_source': '22345a2348f3c2cfcbb893037a07dcbe0030ca34', 'native_source': '12675baab7f764dbcb8f276d357246c70956a927', 'workflow': 'fd23b619157723a8965d83e11d3c61433a81ab86'}.items():
            data = (ROOT / diagnostic[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(diagnostic.get(kind + "_blob") == actual == sha, "G12 D0 accepted bytes drift: " + kind)
        archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G12_D0_R2_43734601883_evidence.zip"
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "e9f80f6e2bf5ad8edc84ebeba040b2d06e877e5afe7f10175b5d6491187176e4",
                "G12 D0 complete accepted artifact missing or changed")
        require((a.get("status") == "GREEN_QUALIFIED" and q.get("gate") == "P3-AUX-HARDY-G12" and a.get("qualification") is True)
                or (a.get("qualification") is False
                and (a.get("status") == "BLOCKED"
                     or (a.get("attempt") == "R3" and a.get("status") in {"PENDING_STRICT_CI", "RED_UNQUALIFIED"}
                         and s.get("g12_r3_prospective", {}).get("prospective_receipt_commit") == "443d9913145656589cc4f3ce29f76f439155e61a"
                         and s["g12_r3_prospective"].get("accepted_diagnostic_commit") == "bbeb8f0dd2cfe2f6bfc9794963db71683142fb97"
                         and s["g12_r3_prospective"].get("qualification") is False
                         and (ROOT / s["g12_r3_prospective"].get("prospective_receipt", "__missing__")).is_file())
                     or (a.get("attempt") == "R4" and a.get("status") == "PENDING_STRICT_CI"
                         and s.get("g12_r4_prospective", {}).get("prospective_receipt_commit") == "22b8877413feffb7467abbcb5af000613cf95d96"
                         and s["g12_r4_prospective"].get("accepted_diagnostic_run") == 43734601883
                         and s["g12_r4_prospective"].get("qualification") is False
                         and (ROOT / s["g12_r4_prospective"].get("prospective_receipt", "__missing__")).is_file()))),
                "D0 acceptance alone cannot reopen full G12 without separate R3 contract")
    if derivative_candidate and a["status"] != "GREEN_QUALIFIED":
        g11 = s.get("parallel_auxiliary_hardy_derivative_color_contraction", {})
        require(q.get("gate") == "P3-AUX-HARDY-G10" and q.get("run_id") == 43702235044
                and a.get("qualification") is False and g11.get("qualification") is False
                and ((a.get("status") == "PENDING_STRICT_CI" and g11.get("status") == "STAGED_UNQUALIFIED")
                     or (a.get("status") == g11.get("status") == "RED_UNQUALIFIED"
                         and a.get("run_id") in {43704688425, 43706576557}
                         and (ROOT / g11.get("red_receipt", "__missing__")).is_file()))
                and ((a.get("attempt") == "R1"
                      and g11.get("prospective_receipt_commit") == "52436389bb07df1e7e5cbefbcc0137c2252ffeb5")
                     or (a.get("attempt") == "R2" and g11.get("prior_red_run") == 43704688425
                         and g11.get("prospective_receipt_commit") == "f4cc79e6be261d4bf83580057f4c01ba018f9cf6"
                         and (ROOT / g11.get("prior_red_receipt", "__missing__")).is_file())
                     or (a.get("attempt") == "R3" and g11.get("prior_red_run") == 43706576557
                         and g11.get("prospective_receipt_commit") == "9f79c202888e40d59064b77bb62abc2434439c17"
                         and (ROOT / g11.get("prior_red_receipt", "__missing__")).is_file()))
                and g11.get("reviewed_original_baseline") == "7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d"
                and (ROOT / g11.get("prospective_receipt", "__missing__")).is_file()
                and g11.get("expected_manifest_pin_count") == a.get("expected_manifest_pins") == 164
                and g11.get("expected_source_roots") == 6 and g11.get("expected_consumer_reports") == 12
                and g11.get("native_examples") == 12,
                "G11 cannot bypass accepted G10 or its exact prospective contract")
        for kind, sha in {
            "source": ("fae4dc32dee27c5542f7fffddf217b276ed2bfef" if a.get("attempt") in {"R2", "R3"}
                       else "6f769ce6641ca327c13fc0a61d77496b85fe63c5"),
            "consumer": {"R1": "c0470c8a91adf6548da0348ae8c02cb59cd97955",
                         "R2": "51cebb400a0da2cf35998888bdd81dfbaa591ec4",
                         "R3": "27b63114ea4635beed31bc9cef954b8499e8194e"}[a["attempt"]],
            "workflow": {"R1": "b741f6366b44d1d0a4afdb6d1a578edf592be95b",
                         "R2": "81bcb1651f66b105b2b140162b5ab75ff4503c86",
                         "R3": "d0f14e9aa39fe01e1c7d5f41a3d0fe31cb26c75c"}[a["attempt"]],
        }.items():
            require(a.get(kind) == g11.get(kind) and (ROOT / g11[kind]).is_file(),
                    "G11 registration path drift: " + kind)
            data = (ROOT / g11[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(a.get(kind + "_blob") == g11.get(kind + "_blob") == actual == sha,
                    "G11 staged bytes drift: " + kind)
    if kinetic_candidate and a["status"] != "GREEN_QUALIFIED":
        g10 = s.get("parallel_auxiliary_hardy_kinetic_tau_car", {})
        require(q.get("gate") == "P3-AUX-HARDY-G9" and q.get("run_id") == 43681465949
                and a.get("qualification") is False and g10.get("qualification") is False
                and ((a.get("status") == "PENDING_STRICT_CI" and g10.get("status") == "STAGED_UNQUALIFIED")
                     or (a.get("status") == g10.get("status") == "RED_UNQUALIFIED"
                         and a.get("run_id") in {43699086864, 43700520096}
                         and (ROOT / g10.get("red_receipt", "__missing__")).is_file()))
                and ((a.get("attempt") == "R1"
                      and g10.get("prospective_receipt_commit") == "17360e8d15784bc2b19425edb7708564474b7a44")
                     or (a.get("attempt") == "R2" and g10.get("prior_red_run") == 43699086864
                         and g10.get("prospective_receipt_commit") == "ec6af36c579d35cdee9ad6eb87efd08092dbb57a"
                         and (ROOT / g10.get("prior_red_receipt", "__missing__")).is_file())
                     or (a.get("attempt") == "R3" and g10.get("prior_red_run") == 43700520096
                         and g10.get("prospective_receipt_commit") == "11b9619e376875e8c06b7bc05e7131e2cf73aaba"
                         and (ROOT / g10.get("prior_red_receipt", "__missing__")).is_file()))
                and g10.get("reviewed_original_baseline") == "e22dda02233c1e703cbb092e2ee705c3b169519a"
                and (ROOT / g10.get("prospective_receipt", "__missing__")).is_file()
                and g10.get("expected_manifest_pin_count") == a.get("expected_manifest_pins") == 163
                and g10.get("expected_source_roots") == 6 and g10.get("expected_consumer_reports") == 12
                and g10.get("native_examples") == 12,
                "G10 cannot bypass accepted G9 or its exact prospective contract")
        for kind, sha in {
            "source": ("59aaed1da894e8b91b2df51eda6f47a37cf4c517" if a.get("attempt") in {"R2", "R3"}
                       else "911ff8824b9c95005511aed22f25da4d0edb97f0"),
            "consumer": ("4f5ad59752d744a8e1dd218b36b7f15b6250ab3e" if a.get("attempt") == "R3"
                         else "ed4507504ac58eef9bcb4299bb8092c9b9679b75"),
            "workflow": {"R1": "7ac3353e6415918cd08ae2c0c3e19202dd5abfe4",
                         "R2": "5e126c42ae799170ee6d4aeca33172747eaa3fc4",
                         "R3": "bf74a5a1bc304924b8b24334ab5dab9f3a398e53"}[a["attempt"]],
        }.items():
            require(a.get(kind) == g10.get(kind) and (ROOT / g10[kind]).is_file(),
                    "G10 registration path drift: " + kind)
            data = (ROOT / g10[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(a.get(kind + "_blob") == g10.get(kind + "_blob") == actual == sha,
                    "G10 staged bytes drift: " + kind)
    if auxiliary_candidate and a["status"] != "GREEN_QUALIFIED":
        g9 = s.get("parallel_auxiliary_hardy_entry_derivative_binding", {})
        require(q.get("gate") == "P3-AUX-HARDY-G8" and q.get("run_id") == 43674445069
                and a.get("status") in {"PENDING_STRICT_CI", "RED_UNQUALIFIED"}
                and g9.get("qualification") is False
                and ((a.get("status") == "PENDING_STRICT_CI" and g9.get("status") == "STAGED_UNQUALIFIED")
                     or (a.get("status") == "RED_UNQUALIFIED" and g9.get("status") == "RED_UNQUALIFIED"
                         and a.get("run_id") in {43677035838, 43678236725, 43679125806}
                         and (ROOT / g9.get("red_receipt", "__missing__")).is_file()))
                and ((g9.get("attempt") == "R1" and g9.get("prospective_receipt_commit") == "c2f96fc7ca5dec3bc47c7f92dadde2a97cac52a7")
                     or (g9.get("attempt") in {"R2", "R3"}
                         and g9.get("prior_red_run") == {"R2": 43677035838, "R3": 43678236725}[g9["attempt"]]
                         and re.fullmatch(r"[0-9a-f]{40}", g9.get("prospective_receipt_commit", "")) is not None
                         and g9.get("source_blob") == "3b5a4b52254add95f741bb883f7e9edecf48dbdf"
                         and g9.get("consumer_blob") == "88aa4d8382e62da727ef81b0f998673fe9f9513d")
                     or (g9.get("attempt") == "R4"
                         and g9.get("prior_red_run") == 43679125806
                         and g9.get("prospective_receipt_commit") == "a7196d6248e7cafb5aae57eca6310de7b6a4552f"
                         and g9.get("source_blob") == "59a1360ee22b9ffa24fdcf018d9c9299a0b9ce11"
                         and g9.get("helper_blob") == "e7904e1edf3af664b3900c31c0757412d495d60c"
                         and g9.get("consumer_blob") == "88aa4d8382e62da727ef81b0f998673fe9f9513d"))
                and (ROOT / g9.get("prospective_receipt", "__missing__")).is_file()
                and g9.get("expected_manifest_pin_count") == 162,
                "G9 cannot bypass accepted G8 or its prior unqualified contract")
        for kind in ("source", "consumer", "helper", "workflow"):
            require(g9.get(kind + "_staged") is True
                    and a.get(kind) == g9.get(kind)
                    and a.get(kind + "_blob") == g9.get(kind + "_blob")
                    and (ROOT / g9[kind]).is_file(),
                    "G9 source/helper/consumer/workflow registration drift: " + kind)
    if source_join:
        require(a.get("status") in {"PENDING_STRICT_CI", "RED_UNQUALIFIED", "GREEN_QUALIFIED"},
                "M3W0D0 status outside registered qualification phases")
        require(a.get("source") ==
                "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3W0D0OriginalNonzeroPhysicalChargeDomain.lean"
                and a.get("source_blob") == "86823abdddb70d1c2158f8e215fb35760e107fd5"
                and a.get("consumer") ==
                "lean/diagnostics/BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomainIndependentConsumer.lean"
                and a.get("consumer_blob") == "38fab7d4dd44728cb1aef81d581340bcce755ac7",
                "M3W0D0 current-source theorem or genuine Fock consumer changed")
        require(a.get("workflow") ==
                ".github/workflows/bfss-p3-m3w0d0-original-physical-charge-domain-strict.yml"
                and a.get("manifest_baseline_sha") ==
                "c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5"
                and a.get("expected_root_count") == 3
                and a.get("donor_axiom_root_count") == 5,
                "M3W0D0 source baseline/consumer/axiom audit scope drift")
        require((ROOT / a["prospective_receipt"]).is_file(),
                "original M3W0D0 prospective receipt not preserved")
        if a["status"] == "GREEN_QUALIFIED":
            accepted = ("research/spectral-p2-original-field/"
                        "P3_M3W0D0_R2_GREEN_43484147197_ACCEPTANCE_AND_M5_BE_HANDOFF_2026_11_13.md")
            require(q.get("gate") == "P3-M3W0D0"
                    and q.get("run_id") == 43484147197
                    and q.get("tested_sha") ==
                    "ea41de685de83c209e2ebccc1098fbcbb076918d"
                    and q.get("manifest_pins") == 201
                    and q.get("source_blob") ==
                    "86823abdddb70d1c2158f8e215fb35760e107fd5"
                    and q.get("consumer_blob") ==
                    "38fab7d4dd44728cb1aef81d581340bcce755ac7"
                    and q.get("workflow_blob") ==
                    "e19abdc47e82f3372acd875fc2bc210e9579958c"
                    and q.get("artifact_id") == 14067253421
                    and q.get("digest") ==
                    "sha256:c987b9af30a3b134e8c6e8726debc96277315e6dfbca46c8a70879e9e19b6ce1"
                    and q.get("declarations") == [
                        "originalPhysicalFullL2_witness_ne_zero",
                        "originalPhysicalCharge_naturalDomain_dense",
                        "originalPhysicalCharge_naturalDomain_has_nonzero",
                    ]
                    and q.get("allowed_axioms") ==
                    ["propext", "Classical.choice", "Quot.sound"]
                    and a.get("manifest_pins") == 201
                    and a.get("run_id") == q.get("run_id")
                    and a.get("candidate_sha") == q.get("tested_sha")
                    and s.get("m3w0d0_prospective", {}).get("status") == "GREEN_QUALIFIED"
                    and s.get("next_planned", {}).get("gate") == "P3-M5BE0"
                    and s.get("next_planned", {}).get("status") ==
                        "RESEARCH_DESIGN_NOT_STAGED"
                    and (ROOT / accepted).is_file(),
                    "M3W0D0 GREEN acceptance missing exact 201-pin original physical source evidence")
        else:
            require(a.get("manifest_pins") is None,
                    "M3W0D0 pin count must come from a completed strict audit")
            require(s.get("next_planned", {}).get("gate") == a["gate"]
                    and s.get("next_planned", {}).get("status") ==
                    "STRICT_WORKFLOW_STAGED_PENDING"
                    and s.get("m3w0d0_prospective", {}).get("status") in {
                        "STAGED_UNQUALIFIED", "STRICT_RUN_RUNNING_UNQUALIFIED"
                    }, "M3W0D0 pending or RED transition drift")
            require(q.get("gate") == "P3-M3G0B1" and
                    q.get("run_id") == 43467719230,
                    "new physical source gate cannot supersede accepted M3G0B1")
    port_be = a.get("gate") == "P3-M5BE0"
    if port_be:
        require(a.get("status") in {"PENDING_STRICT_CI", "RED_UNQUALIFIED", "GREEN_QUALIFIED"},
                "M5BE0 gate outside allowed strict acceptance phases")
        require(a.get("source") ==
                "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean"
                and a.get("source_blob") == "f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1"
                and a.get("consumer") == "lean/diagnostics/BFSSP3M5BE0OriginalNativeHamiltonianPortIndependentConsumer.lean"
                and a.get("consumer_blob") == "9d20905d5509be44baf2374fc1bf0eb8820969eb"
                and a.get("underlying_original_BE_source") == "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean"
                and a.get("underlying_original_BE_blob") == "0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5",
                "M5BE0 original BE, paired source or independent consumer pin drift")
        require(a.get("manifest_baseline_sha") ==
                "c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5"
                and a.get("original_root_count") == 7
                and a.get("BE_donor_root_count") == 14
                and a.get("workflow") == ".github/workflows/bfss-p3-m5be0-original-native-hamiltonian-port-strict.yml",
                "M5BE0 exact source-closure manifest/21-root guard invalid")
        require((ROOT / a.get("prospective_receipt", "__missing__")).is_file(),
                "M5BE0 prospective proof contract missing")
        if a["status"] == "GREEN_QUALIFIED":
            acceptance = ("research/spectral-p2-original-field/P3_M5BE0_R2_GREEN_43493125150_NATIVE_HAMILTONIAN_PORT_ACCEPTANCE_AND_BF_HANDOFF_2026_11_13.md")
            require(q.get("gate") == "P3-M5BE0"
                    and q.get("verdict") == "GREEN"
                    and q.get("run_id") == 43493125150
                    and q.get("tested_sha") == "10a9e7e3419f8b02b5e920c60e07facf8602fb42"
                    and q.get("job_id") == 132119186214
                    and q.get("manifest_pins") == 202
                    and q.get("source_blob") == "f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1"
                    and q.get("consumer_blob") == "9d20905d5509be44baf2374fc1bf0eb8820969eb"
                    and q.get("workflow_blob") == "1fffc09202d4a42aff9508214ca0edbb6757c39d"
                    and q.get("original_BE_blob") == "0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5"
                    and q.get("artifact_id") == 14070858752
                    and q.get("digest") ==
                        "sha256:77f7b59ba52f6f824ab8915176f70e90d7d3825827c9453a4b3e8415a5524375"
                    and q.get("declarations") == ["originalPairedNormalizedH_eq_charge_square","originalPairedNormalizedH_naturalDomain","originalPairedNormalizedH_apply","originalPairedNormalizedH_selfAdjoint","originalPairedNormalizedH_closed","originalPairedNormalizedH_domain_dense","originalPairedNormalizedH_weakForm_iff"]
                    and q.get("allowed_axioms") == ["propext", "Classical.choice", "Quot.sound"]
                    and a.get("manifest_pins") == 202
                    and a.get("run_id") == q.get("run_id")
                    and a.get("candidate_sha") == q.get("tested_sha")
                    and s.get("m5be0_prospective", {}).get("status") == "GREEN_QUALIFIED"
                    and s.get("next_planned", {}).get("gate") == "P3-M5BF0"
                    and s.get("next_planned", {}).get("status") == "RESEARCH_DESIGN_NOT_STAGED"
                    and (ROOT / acceptance).is_file(),
                    "M5BE0 GREEN exact-source acceptance or bounded BF handoff drift")
            prior = s.get("previous_qualified", {})
            require(prior.get("gate") == "P3-M3W0D0"
                    and prior.get("run_id") == 43484147197
                    and prior.get("manifest_pins") == 201
                    and prior.get("artifact_id") == 14067253421,
                    "M5BE0 acceptance cannot erase the prior M3W0D0 strict source proof")
        else:
            require(a.get("manifest_pins") is None,
                    "M5BE0 must not invent source-closure count pre-CI")
            require(q.get("gate") == "P3-M3W0D0"
                    and q.get("run_id") == 43484147197
                    and q.get("tested_sha") ==
                        "ea41de685de83c209e2ebccc1098fbcbb076918d"
                    and q.get("manifest_pins") == 201
                    and q.get("artifact_id") == 14067253421
                    and q.get("source_blob") ==
                        "86823abdddb70d1c2158f8e215fb35760e107fd5"
                    and q.get("consumer_blob") ==
                        "38fab7d4dd44728cb1aef81d581340bcce755ac7"
                    and s.get("m3w0d0_prospective", {}).get("status") ==
                        "GREEN_QUALIFIED",
                    "M5 port cannot bypass accepted original M3W0D0 predecessor")
            require(s.get("next_planned", {}).get("gate") == "P3-M5BE0"
                    and s.get("next_planned", {}).get("status") ==
                        "STRICT_WORKFLOW_STAGED_PENDING"
                    and s.get("m5be0_prospective", {}).get("status") in {
                        "SOURCE_CONSUMER_WORKFLOW_STAGED_NOT_LEAN_QUALIFIED",
                        "STRICT_PENDING_UNQUALIFIED"
                    }, "M5BE0 pending source receipt/transition mismatch")
    port_bf = a.get("gate") == "P3-M5BF0"
    if port_bf:
        require(a.get("status") in {"PENDING_STRICT_CI", "RED_UNQUALIFIED", "GREEN_QUALIFIED"},
                "BF0 state outside strict acceptance phases")
        require(a.get("source") == "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean"
                and a.get("source_blob") == "f954917f21669fd68befc12f48a2b092b71a9044"
                and a.get("consumer") == "lean/diagnostics/BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomainIndependentConsumer.lean"
                and a.get("consumer_blob") == "3d00bacf4b8e8cbf88c28d821d6b13336d23a2c2"
                and a.get("original_BF_source") == "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BFOriginalSourceGraphAndPairedHamiltonianProbe.lean"
                and a.get("original_BF_blob") == "fd137fc6f62f42d96bcf6ff3eb9355839a59d562"
                and a.get("accepted_BE0_blob") == "f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1"
                and a.get("accepted_W0_blob") == "86823abdddb70d1c2158f8e215fb35760e107fd5",
                "BF0 source/consumer/prior qualified source SHA drift")
        require(a.get("manifest_baseline_sha") ==
                    "c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5"
                and a.get("new_root_count") == 3
                and a.get("historical_BF_root_count") == 9
                and a.get("accepted_donor_root_count") == 2
                and a.get("workflow") == ".github/workflows/bfss-p3-m5bf0-native-graph-nonzero-h-domain-strict.yml"
                and (ROOT / a.get("prospective_receipt", "__missing__")).is_file(),
                "BF0 prospective source closure/14-root audit scope drift")
        if a["status"] == "GREEN_QUALIFIED":
            receipt = "research/spectral-p2-original-field/P3_M5BF0_R1_GREEN_43498649514_NATIVE_SOURCE_GRAPH_NONZERO_H_DOMAIN_ACCEPTANCE_2026_11_13.md"
            require(q.get("gate") == "P3-M5BF0"
                    and q.get("run_id") == 43498649514
                    and q.get("tested_sha") == "f2499980b808b6c9ddf2c6093f5b88ebff8b825f"
                    and q.get("job_id") == 132138306349
                    and q.get("manifest_pins") == 208
                    and q.get("source_blob") == "f954917f21669fd68befc12f48a2b092b71a9044"
                    and q.get("consumer_blob") == "3d00bacf4b8e8cbf88c28d821d6b13336d23a2c2"
                    and q.get("workflow_blob") == "40e56e2ddd53bfbc325a8991e94b3bf34d537e8e"
                    and q.get("original_BF_blob") == "fd137fc6f62f42d96bcf6ff3eb9355839a59d562"
                    and q.get("artifact_id") == 14074535971
                    and q.get("digest") ==
                        "sha256:cd1ff2d72b54be0fd806ba8e962cff57637f9c4dc47e422f53505c347132ca18"
                    and q.get("declarations") == ["originalPairedChargeGraph_eq_sourceRebased","originalPairedH_eq_accepted_BE","originalPairedH_naturalDomain_has_nonzero"]
                    and q.get("allowed_axioms") == ["propext", "Classical.choice", "Quot.sound"]
                    and a.get("manifest_pins") == 208
                    and a.get("candidate_sha") == q.get("tested_sha")
                    and a.get("run_id") == q.get("run_id")
                    and s.get("m5bf0_prospective", {}).get("status") == "GREEN_QUALIFIED"
                    and s.get("next_planned", {}).get("gate") == "P3-M5BG0"
                    and s.get("next_planned", {}).get("status") == "RESEARCH_DESIGN_NOT_STAGED"
                    and (ROOT / receipt).is_file(),
                    "BF0 exact source/consumer GREEN or BG research-only handoff missing")
            prior = s.get("previous_qualified", {})
            require(prior.get("gate") == "P3-M5BE0"
                    and prior.get("run_id") == 43493125150
                    and prior.get("manifest_pins") == 202
                    and prior.get("artifact_id") == 14070858752,
                    "BF0 acceptance erased M5BE0 current physical Hamiltonian qualification")
        else:
            require(a.get("manifest_pins") is None,
                    "BF0 must not invent source count before strict run")
            require(q.get("gate") == "P3-M5BE0"
                    and q.get("run_id") == 43493125150
                    and q.get("tested_sha") ==
                        "10a9e7e3419f8b02b5e920c60e07facf8602fb42"
                    and q.get("source_blob") == "f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1"
                    and q.get("manifest_pins") == 202
                    and q.get("artifact_id") == 14070858752,
                    "BF0 cannot bypass accepted BE0 provenance")
            require(s.get("next_planned", {}).get("gate") == "P3-M5BF0"
                    and s.get("next_planned", {}).get("status") ==
                        "STRICT_WORKFLOW_STAGED_PENDING"
                    and s.get("m5bf0_prospective", {}).get("status") ==
                        "STAGED_UNQUALIFIED",
                    "BF0 pending original source/consumer status drift")
    if a["status"] == "RESEARCH_ONLY_NOT_STAGED":
        require(a.get("candidate_sha") is None and a.get("run_id") is None,
                "unstaged research cannot claim exact tested CI")
    for entry, key in [(q, "tested_sha"), (a, "candidate_sha")]:
        if entry is a and a["status"] == "RESEARCH_ONLY_NOT_STAGED":
            continue
        require(re.fullmatch(r"[0-9a-f]{40}", entry.get(key, "")) is not None, "invalid exact SHA")
        if entry is a and entry["status"] == "PENDING_STRICT_CI" and entry.get("run_id") is None:
            # A two-commit staged push has no GitHub run ID until the new ref is published.
            # Record the *source ancestor* SHA first, then reconcile run ID on the next
            # checkpoint-only commit; do not invent a workflow result.
            pass
        else:
            require(isinstance(entry.get("run_id"), int) and entry["run_id"] > 0,
                    "missing or invalid run ID")
        if entry is a and bilinear_candidate and a["status"] in {"RED_UNQUALIFIED", "BLOCKED"}:
            g12_red_manifests = {43711440502: "20954c2b80e5b2d0a685d79696d2602e49f721097be054abdb98a641651c2843",
                                 43730966120: "2e93cecf32df8b1e6687cbb0f8db80b082c71dbc16531e42de664a6da8b89995",
                                 43738033537: "c3f595a7f969e10e4b79a26317c31c9c4b932751e8a09411894a64e4dd636ba8"}
            require(entry.get("run_id") in g12_red_manifests and entry.get("manifest_pins") == 166
                    and entry.get("manifest_hash") == g12_red_manifests[entry["run_id"]],
                    "G12 measured red preflight missing")
        elif entry is a and derivative_candidate and a["status"] == "RED_UNQUALIFIED":
            g11_red_manifests = {
                43704688425: "de65204afbda816fb1e54184fe1e87572f65045c46f4b5223dcf6978907dbfe5",
                43706576557: "1bdf0f07ecdfce11e6266dd4f7975bd68395a8f803110db9d98ff7245572885b",
            }
            require(entry.get("run_id") in g11_red_manifests and entry.get("manifest_pins") == 164
                    and entry.get("manifest_hash") == g11_red_manifests[entry["run_id"]],
                    "G11 measured red preflight missing")
        elif entry is a and kinetic_candidate and a["status"] == "RED_UNQUALIFIED":
            g10_red_manifests = {
                43699086864: "9f8d89f87571dba21fd345fd730ea4c062f78a8d3f50236091407fd8ec411ac8",
                43700520096: "cb3bf548628c0368cc648a905a7969308b2a760f7e4eb7d1af1c3df6f829aa62",
            }
            require(entry.get("run_id") in g10_red_manifests and entry.get("manifest_pins") == 163
                    and entry.get("manifest_hash") == g10_red_manifests[entry["run_id"]],
                    "G10 measured red preflight missing")
        elif entry is a and auxiliary_candidate and a["status"] == "RED_UNQUALIFIED":
            red_manifests = {
                43677035838: "860a3059669d4f6e92ee523c37055a61dfc3fc157845ce9a28ef9aa4f97534f8",
                43678236725: "963b2de0e257bb28fcf9f5f5a8fd69108bd0799ced02772b27efa9484eb9a86b",
                43679125806: "5bce6af68bc704073e666549f238c39e6f5d0dc8590f0862832ea4aeb91abc2e",
            }
            require(entry.get("manifest_pins") == 162
                    and entry.get("run_id") in red_manifests
                    and entry.get("manifest_hash") == red_manifests[entry["run_id"]],
                    "G9 measured red preflight missing")
        elif entry is a and core_assembly_candidate and a["status"] == "RED_UNQUALIFIED":
            require(entry.get("manifest_pins") == 167 and entry.get("run_id") == 43743787307
                    and entry.get("manifest_hash") == "378cf5196a17f4f476ae3e7eac56ff13e363a7a77b027818c92cfe42e283aa40",
                    "G13 measured red preflight missing")
        elif entry is a and tau_norm_candidate and a["status"] in {"RED_UNQUALIFIED", "BLOCKED"}:
            require(entry.get("manifest_pins") == 169 and ((entry.get("run_id") == 43751403932
                    and entry.get("manifest_hash") == "1c474d67d01103777db6504bf12ba72a2280297b4b738e85e1e9dbf2b3fb316a")
                    or (entry.get("run_id") == 43753325231 and entry.get("manifest_hash") == "8865f8167bed9d038f9967480f9eed47c80a0cb77554d4de5dae756742970478")),
                    "G15 measured red preflight missing")
        elif entry is a and ((port_be or source_join or port_bf or auxiliary_candidate or kinetic_candidate or derivative_candidate or bilinear_candidate or core_assembly_candidate or core_collapse_candidate or tau_norm_candidate) and a["status"] != "GREEN_QUALIFIED"):
            require(entry.get("manifest_pins") is None,
                    "new-source pin count was invented before strict CI")
        else:
            require(entry.get("manifest_pins", 0) >= 1,
                    "missing verified source manifest count")
        for k in ("source", "consumer"):
            path = Path(entry[k])
            require(not path.is_absolute() and ".." not in path.parts and (ROOT/path).is_file(),
                    "missing or unsafe " + k + ": " + str(path))
    if not source_join and not port_be and not port_bf and not auxiliary_candidate and not kinetic_candidate and not derivative_candidate and not bilinear_candidate and not core_assembly_candidate and not core_collapse_candidate and not tau_norm_candidate:
        require(a["manifest_pins"] >= q["manifest_pins"], "pin count regression")
    # The BE native-H source port is an independently pinned historical
    # dependency closure; never compare its raw count to M3W0D0's 201 pins.
    # M3W0D0 does not reuse the M3B1 463-pin import closure.
    # It independently proves its current-source closure against the immutable
    # c625... baseline and records its count in CI; arithmetic comparison
    # between unrelated import closures is mathematically meaningless.
    require(Path(a["source"]).stem.casefold().startswith(a["gate"].replace("-", "").casefold()),
            "active gate/source mismatch")
    # The live allocation has moved from the original-H port to Hardy algebra.
    # Preserve the physical-H receipt independently; do not require its old BG
    # handoff to remain the project's current mathematical priority.
    if q["gate"] == "P3-AUX-HARDY-G8":
        accepted = s.get("parallel_auxiliary_hardy_tau_derivative_acceptance", {})
        result = accepted.get("result", {})
        focus = s.get("current_focus", {})
        receipt = ("research/spectral-p2-original-field/"
                   "P3_AUX_HARDY_G8_R2_GREEN_43674445069_ORIGINAL_TAU_DERIVATIVE_ACCEPTANCE_2026_11_14.md")
        require(s["milestone"] == "M5" and q.get("run_id") == 43674445069
                and q.get("tested_sha") == "19a441adc0bc2408e639a1dca2ec0e67e31e6f57"
                and q.get("manifest_pins") == 160
                and q.get("manifest_hash") == "06a3822136ea677928f38230b4b6840447a0e09b9c06230a6acde22f9dc1d2a5"
                and q.get("artifact_id") == 14146161190
                and q.get("digest") == "sha256:62414b5ff808ab2afe72e0243150379708f1bbd8d7891d53ab43cb2663a49160"
                and accepted.get("status") == "GREEN_QUALIFIED"
                and result.get("source_reports") == 6
                and result.get("consumer_reports") == 12
                and result.get("all_twelve_native_controls_passed") is True
                and q.get("receipt") == receipt and (ROOT / receipt).is_file(),
                "G8 exact accepted receipt or native audit drift")
        expected_blobs = {
            "source": "138ab7f545bf00812a55d1cb035251a9eccb6c27",
            "consumer": "0d3714894391fd6afa1bfb00b1df7238421ae7e7",
            "workflow": "73a08204ca5a38089f1e69fa6dcb72dd1b1a006c",
        }
        for kind, expected in expected_blobs.items():
            data = (ROOT / q[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(q.get(kind + "_blob") == expected and actual == expected,
                    "G8 accepted " + kind + " bytes drift")
        physical = s.get("last_qualified_physical_operator", {})
        require(physical.get("gate") == "P3-M5BF0" and physical.get("run_id") == 43498649514
                and physical.get("tested_sha") == "f2499980b808b6c9ddf2c6093f5b88ebff8b825f",
                "G8 refresh erased original physical-H qualification")
        require(focus.get("latest_qualified_gate") == q["gate"]
                and focus.get("latest_qualified_run") == q["run_id"]
                and focus.get("highest_forward_research")
                and focus.get("remaining_blockers") and focus.get("reconsideration_triggers")
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G9"
                and s["next_planned"].get("status") in {"RESEARCH_DESIGN_NOT_STAGED",
                    "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                    "STRICT_WORKFLOW_STAGED_PENDING", "STRICT_CI_IN_PROGRESS", "RED_UNQUALIFIED_REPAIR_PENDING"},
                "G8 live focus or bounded unqualified G9 handoff missing")
    if q["gate"] == "P3-AUX-HARDY-G9":
        acceptance = s.get("parallel_auxiliary_hardy_entry_derivative_binding_acceptance", {})
        result = acceptance.get("result", {})
        g9 = s.get("parallel_auxiliary_hardy_entry_derivative_binding", {})
        receipt = ("research/spectral-p2-original-field/"
                   "P3_AUX_HARDY_G9_R4_GREEN_43681465949_ORIGINAL_ENTRY_DERIVATIVE_ACCEPTANCE_2026_11_15.md")
        require(s["milestone"] == "M5" and (a.get("gate") == q["gate"] or kinetic_candidate)
                and q.get("run_id") == 43681465949
                and q.get("tested_sha") == "e22dda02233c1e703cbb092e2ee705c3b169519a"
                and q.get("job_id") == 132712801846
                and q.get("manifest_pins") == 162
                and q.get("manifest_hash") == "51f5a6eeb0cbaf4bc42c3f4c04a2ec480b5757d2ef3313fe2ec7390ac6b30bf3"
                and q.get("artifact_id") == 14149490274
                and q.get("digest") == "sha256:4d3cb75b8649dac9d4ed9c3ac81543b1999ebd007fd078712acbe030852cef2e"
                and q.get("receipt") == receipt and (ROOT / receipt).is_file()
                and acceptance.get("status") == g9.get("status") == "GREEN_QUALIFIED"
                and g9.get("qualification") is True
                and result.get("helper_reports") == [1, 3]
                and result.get("source_reports") == 6 and result.get("consumer_reports") == 12
                and result.get("all_twelve_native_controls_passed") is True,
                "G9 exact accepted source/native evidence missing")
        expected = {
            "source": "59a1360ee22b9ffa24fdcf018d9c9299a0b9ce11",
            "helper": "e7904e1edf3af664b3900c31c0757412d495d60c",
            "consumer": "88aa4d8382e62da727ef81b0f998673fe9f9513d",
            "workflow": "5994f52f60019e2a9089131ec68f20ad1cca2f04",
        }
        for kind, sha in expected.items():
            data = (ROOT / q[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(q.get(kind + "_blob") == g9.get(kind + "_blob") == actual == sha
                    and (kinetic_candidate or a.get(kind + "_blob") == sha),
                    "G9 accepted bytes drift: " + kind)
        prior = s.get("last_qualified_hardy_pre_G9", {})
        physical = s.get("last_qualified_physical_operator", {})
        focus = s.get("current_focus", {})
        require(prior.get("gate") == "P3-AUX-HARDY-G8" and prior.get("run_id") == 43674445069
                and prior.get("tested_sha") == "19a441adc0bc2408e639a1dca2ec0e67e31e6f57"
                and (ROOT / prior.get("receipt", "__missing__")).is_file()
                and physical.get("gate") == "P3-M5BF0" and physical.get("run_id") == 43498649514
                and physical.get("tested_sha") == "f2499980b808b6c9ddf2c6093f5b88ebff8b825f"
                and focus.get("latest_qualified_gate") == q["gate"]
                and focus.get("latest_qualified_run") == q["run_id"]
                and focus.get("highest_forward_research") and focus.get("remaining_blockers")
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G10"
                and s["next_planned"].get("status") in {"RESEARCH_DESIGN_NOT_STAGED", "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                    "STRICT_WORKFLOW_STAGED_PENDING", "STRICT_CI_IN_PROGRESS", "RED_UNQUALIFIED_REPAIR_PENDING"},
                "G9 predecessor, physical-H or bounded next-stage handoff missing")
        if not kinetic_candidate:
            require(a.get("status") == "GREEN_QUALIFIED" and a.get("qualification") is True
                    and a.get("run_id") == q["run_id"] and a.get("candidate_sha") == q["tested_sha"]
                    and a.get("manifest_pins") == q["manifest_pins"] and a.get("manifest_hash") == q["manifest_hash"],
                    "G9 active accepted checkpoint drift")
        archive = (ROOT / "research/spectral-p2-original-field/diagnostics/"
                   "P3_AUX_HARDY_G9_R4_43681465949_evidence.zip")
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "4d3cb75b8649dac9d4ed9c3ac81543b1999ebd007fd078712acbe030852cef2e",
                "G9 complete accepted artifact missing or changed")
    if q["gate"] == "P3-AUX-HARDY-G10":
        acceptance = s.get("parallel_auxiliary_hardy_kinetic_tau_car_acceptance", {})
        result = acceptance.get("result", {})
        g10 = s.get("parallel_auxiliary_hardy_kinetic_tau_car", {})
        receipt = ("research/spectral-p2-original-field/"
                   "P3_AUX_HARDY_G10_R3_GREEN_43702235044_ORBITAL_CAR_ACCEPTANCE_2026_11_15.md")
        require(s["milestone"] == "M5" and (a.get("gate") == q["gate"] or derivative_candidate)
                and q.get("run_id") == 43702235044
                and q.get("tested_sha") == "7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d"
                and q.get("job_id") == 132775658384
                and q.get("manifest_pins") == 163
                and q.get("manifest_hash") == "65142f6ef1c9f0233eddf42729c09ba4f7cc55403add65bcdbec58b76922534d"
                and q.get("artifact_id") == 14157550157
                and q.get("digest") == "sha256:d7acb15fac710626dbb608cbf7c929091b6ad716521e4ff51b989f3ffd4ebb6c"
                and q.get("receipt") == receipt and (ROOT / receipt).is_file()
                and acceptance.get("status") == g10.get("status") == "GREEN_QUALIFIED"
                and g10.get("qualification") is True
                and result.get("helper_reports") == [1, 3]
                and result.get("source_reports") == 6 and result.get("consumer_reports") == 12
                and result.get("all_twelve_native_controls_passed") is True,
                "G10 exact accepted source/native evidence missing")
        for kind, sha in {
            "source": "59aaed1da894e8b91b2df51eda6f47a37cf4c517",
            "consumer": "4f5ad59752d744a8e1dd218b36b7f15b6250ab3e",
            "workflow": "bf74a5a1bc304924b8b24334ab5dab9f3a398e53",
        }.items():
            data = (ROOT / q[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(q.get(kind + "_blob") == g10.get(kind + "_blob") == actual == sha
                    and (derivative_candidate or a.get(kind + "_blob") == sha),
                    "G10 accepted bytes drift: " + kind)
        prior = s.get("last_qualified_hardy_pre_G10", {})
        physical = s.get("last_qualified_physical_operator", {})
        focus = s.get("current_focus", {})
        require(prior.get("gate") == "P3-AUX-HARDY-G9" and prior.get("run_id") == 43681465949
                and prior.get("tested_sha") == "e22dda02233c1e703cbb092e2ee705c3b169519a"
                and (ROOT / prior.get("receipt", "__missing__")).is_file()
                and physical.get("gate") == "P3-M5BF0" and physical.get("run_id") == 43498649514
                and physical.get("tested_sha") == "f2499980b808b6c9ddf2c6093f5b88ebff8b825f"
                and focus.get("latest_qualified_gate") == q["gate"]
                and focus.get("latest_qualified_run") == q["run_id"]
                and focus.get("highest_forward_research") and focus.get("remaining_blockers")
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G11"
                and s["next_planned"].get("status") in {"RESEARCH_DESIGN_NOT_STAGED", "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                    "STRICT_WORKFLOW_STAGED_PENDING", "STRICT_CI_IN_PROGRESS", "RED_UNQUALIFIED_REPAIR_PENDING"},
                "G10 predecessor, physical-H or bounded next-stage handoff missing")
        if not derivative_candidate:
            require(a.get("status") == "GREEN_QUALIFIED" and a.get("qualification") is True
                    and a.get("run_id") == q["run_id"] and a.get("candidate_sha") == q["tested_sha"]
                    and a.get("manifest_pins") == q["manifest_pins"] and a.get("manifest_hash") == q["manifest_hash"],
                    "G10 active accepted checkpoint drift")
        archive = (ROOT / "research/spectral-p2-original-field/diagnostics/"
                   "P3_AUX_HARDY_G10_R3_43702235044_evidence.zip")
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "d7acb15fac710626dbb608cbf7c929091b6ad716521e4ff51b989f3ffd4ebb6c",
                "G10 complete accepted artifact missing or changed")
    if q["gate"] == "P3-AUX-HARDY-G11":
        acceptance = s.get("parallel_auxiliary_hardy_derivative_color_contraction_acceptance", {})
        result = acceptance.get("result", {})
        g11 = s.get("parallel_auxiliary_hardy_derivative_color_contraction", {})
        receipt = ("research/spectral-p2-original-field/"
                   "P3_AUX_HARDY_G11_R3_GREEN_43708533905_DERIVATIVE_COLOR_CONTRACTION_ACCEPTANCE_2026_11_15.md")
        require(s["milestone"] == "M5"
                and (bilinear_candidate or (a.get("gate") == q["gate"]
                     and a.get("status") == "GREEN_QUALIFIED" and a.get("qualification") is True
                     and a.get("run_id") == q.get("run_id")
                     and a.get("candidate_sha") == q.get("tested_sha")
                     and a.get("manifest_pins") == q.get("manifest_pins")
                     and a.get("manifest_hash") == q.get("manifest_hash")))
                and q.get("run_id") == 43708533905
                and q.get("tested_sha") == "7459e472085a6ef9b3c5c8352073ea1bafa6645e"
                and q.get("job_id") == 132794815882
                and q.get("manifest_pins") == 164
                and q.get("manifest_hash") == "9b58bf7f93dbcf7586da0c39d89741e77b723cdfe1f354e2191708145da34d2a"
                and q.get("artifact_id") == 14159937387
                and q.get("digest") == "sha256:021dc41236d246ecfcf503d273effe46f7e06b5b9b105b522cc8f3bb435ada35"
                and q.get("receipt") == receipt and (ROOT / receipt).is_file()
                and acceptance.get("status") == g11.get("status") == "GREEN_QUALIFIED"
                and g11.get("qualification") is True
                and result.get("helper_reports") == [1, 3]
                and result.get("source_reports") == 6 and result.get("consumer_reports") == 12
                and result.get("all_twelve_native_controls_passed") is True,
                "G11 exact accepted source/native evidence missing")
        for kind, sha in {
            "source": "fae4dc32dee27c5542f7fffddf217b276ed2bfef",
            "consumer": "27b63114ea4635beed31bc9cef954b8499e8194e",
            "workflow": "d0f14e9aa39fe01e1c7d5f41a3d0fe31cb26c75c",
        }.items():
            data = (ROOT / q[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(q.get(kind + "_blob") == g11.get(kind + "_blob") == actual == sha
                    and (bilinear_candidate or a.get(kind + "_blob") == sha),
                    "G11 accepted bytes drift: " + kind)
        prior = s.get("last_qualified_hardy_pre_G11", {})
        physical = s.get("last_qualified_physical_operator", {})
        focus = s.get("current_focus", {})
        require(prior.get("gate") == "P3-AUX-HARDY-G10" and prior.get("run_id") == 43702235044
                and prior.get("tested_sha") == "7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d"
                and (ROOT / prior.get("receipt", "__missing__")).is_file()
                and physical.get("gate") == "P3-M5BF0" and physical.get("run_id") == 43498649514
                and physical.get("tested_sha") == "f2499980b808b6c9ddf2c6093f5b88ebff8b825f"
                and focus.get("latest_qualified_gate") == q["gate"]
                and focus.get("latest_qualified_run") == q["run_id"]
                and focus.get("highest_forward_research") and focus.get("remaining_blockers")
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G12"
                and s["next_planned"].get("status") in {"RESEARCH_DESIGN_NOT_STAGED", "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED", "STRICT_WORKFLOW_STAGED_PENDING", "STRICT_CI_IN_PROGRESS", "PROSPECTIVE_REPAIR_NOT_STAGED", "ISOLATED_DIAGNOSTIC_REGISTERED", "ISOLATED_DIAGNOSTIC_STAGED", "ISOLATED_DIAGNOSTIC_IN_PROGRESS", "ISOLATED_DIAGNOSTIC_REPAIR_REGISTERED"},
                "G11 predecessor, physical-H or bounded next-stage handoff missing")
        archive = (ROOT / "research/spectral-p2-original-field/diagnostics/"
                   "P3_AUX_HARDY_G11_R3_43708533905_evidence.zip")
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "021dc41236d246ecfcf503d273effe46f7e06b5b9b105b522cc8f3bb435ada35",
                "G11 complete accepted artifact missing or changed")
    if q["gate"] == "P3-AUX-HARDY-G12":
        g12 = s.get("parallel_auxiliary_hardy_derivative_fock_bilinear", {})
        acceptance = s.get("parallel_auxiliary_hardy_derivative_fock_bilinear_acceptance", {})
        result = acceptance.get("result", {})
        receipt = "research/spectral-p2-original-field/P3_AUX_HARDY_G12_R4_GREEN_43740253917_ORDERED_DERIVATIVE_FOCK_BILINEAR_ACCEPTANCE_2026_11_15.md"
        require((core_assembly_candidate or (a.get("gate") == q["gate"] and a.get("status") == "GREEN_QUALIFIED"
                     and a.get("qualification") is True and a.get("run_id") == q.get("run_id")
                     and a.get("candidate_sha") == q.get("tested_sha") and a.get("manifest_pins") == q.get("manifest_pins")
                     and a.get("manifest_hash") == q.get("manifest_hash"))) and g12.get("qualification") is True
                and acceptance.get("status") == g12.get("status") == "GREEN_QUALIFIED"
                and q.get("run_id") == 43740253917
                and q.get("tested_sha") == "8b54ce6b150d8f3689342dd6bf80179414ab95fa"
                and q.get("job_id") == 132891625052 and q.get("manifest_pins") == 166
                and q.get("manifest_hash") == "17a3155a59d23f270d406ac167cfbda1dbe1330128738879c360a5bd9868aae5"
                and q.get("artifact_id") == 14172740560
                and q.get("digest") == "sha256:2a3d6012d6348b7b63d4a6f7f7e0da3c1cbff39cdf2d10301ecb5bb4ed22a58b"
                and q.get("receipt") == receipt and (ROOT / receipt).is_file()
                and result.get("helper_reports") == [1, 3, 1] and result.get("source_reports") == 6
                and result.get("consumer_reports") == 12 and result.get("all_twelve_native_controls_passed") is True,
                "G12 exact full source/native acceptance missing")
        for kind, sha in {'source': 'f6296a909dcd84a9800012f18f55f7005866cb59', 'helper': '2c0b07a603a94ad18342a53a5d88eaad5345cb5d', 'consumer': '77b70b7a906d26befcc2f08ab71fa3478c4da0d0', 'workflow': '440e10c2736994e5fa90c2c604fd8481dd703d88'}.items():
            data = (ROOT / q[kind]).read_bytes()
            actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
            require(q.get(kind + "_blob") == g12.get(kind + "_blob") == actual == sha
                    and (core_assembly_candidate or a.get(kind + "_blob") == sha),
                    "G12 accepted bytes drift: " + kind)
        prior = s.get("last_qualified_hardy_pre_G12", {})
        physical = s.get("last_qualified_physical_operator", {})
        focus = s.get("current_focus", {})
        require(prior.get("gate") == "P3-AUX-HARDY-G11" and prior.get("run_id") == 43708533905
                and prior.get("tested_sha") == "7459e472085a6ef9b3c5c8352073ea1bafa6645e"
                and (ROOT / prior.get("receipt", "__missing__")).is_file()
                and physical.get("gate") == "P3-M5BF0" and physical.get("run_id") == 43498649514
                and focus.get("latest_qualified_gate") == q["gate"] and focus.get("latest_qualified_run") == q["run_id"]
                and focus.get("highest_forward_research") and focus.get("remaining_blockers")
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G13"
                and s["next_planned"].get("status") in {"RESEARCH_DESIGN_NOT_STAGED", "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED", "STRICT_WORKFLOW_STAGED_PENDING", "STRICT_CI_IN_PROGRESS", "RED_UNQUALIFIED_REPAIR_PENDING"},
                "G12 predecessor, physical-H or bounded core-assembly handoff missing")
        archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G12_R4_43740253917_evidence.zip"
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "2a3d6012d6348b7b63d4a6f7f7e0da3c1cbff39cdf2d10301ecb5bb4ed22a58b",
                "G12 complete accepted artifact missing or changed")
    if q["gate"] == "P3-AUX-HARDY-G13":
        acc = s.get("parallel_auxiliary_hardy_core_kinetic_tau_assembly_acceptance", {})
        result = acc.get("result", {})
        require(q.get("run_id") == 43746155492 and q.get("tested_sha") == "d065dda605b28120e10c347efa9afc07ddbb8147"
                and q.get("job_id") == 132909800078 and q.get("manifest_pins") == 167
                and q.get("manifest_hash") == "33a135b594df1ed18c6cef9b4479c3552aced349617464950024bcb1fbf24517"
                and q.get("artifact_id") == 14173879807 and acc.get("status") == "GREEN_QUALIFIED"
                and (ROOT / q.get("receipt", "__missing__")).is_file()
                and result.get("source_reports") == 6 and result.get("consumer_reports") == 12
                and result.get("helper_reports") == [1, 3, 1] and result.get("all_twelve_native_controls_passed") is True
                and s.get("last_qualified_hardy_pre_G13", {}).get("run_id") == 43740253917
                and s.get("last_qualified_physical_operator", {}).get("run_id") == 43498649514
                and s.get("current_focus", {}).get("latest_qualified_run") == 43746155492
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G14",
                "G13 exact acceptance or preserved predecessor/physical-H missing")
        for kind, sha in {"source":"b112d763fe63a864e3b2ed72f551a521995b42b3", "consumer":"31437df721c4cca33e8ff7bd9cafc3826705bbc9", "workflow":"1111175721389f3d03ca7fdea8867f7fcd095aea"}.items():
            data = (ROOT / q[kind]).read_bytes()
            require(q.get(kind + "_blob") == hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == sha,
                    "G13 accepted bytes drift: " + kind)
        archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G13_R2_43746155492_evidence.zip"
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "fa94fa2ff24279af34b7d67d46625dec1431b8a461cd7b910de503679f9e057d",
                "G13 complete accepted artifact missing or changed")
    if q["gate"] == "P3-AUX-HARDY-G14":
        acc = s.get("g14_core_collapse_acceptance", {})
        result = acc.get("result", {})
        require(q.get("run_id") == 43749092953 and q.get("tested_sha") == "3e2cc5da7a2e0965f158c0683acc774bcf1a81b8"
                and q.get("job_id") == 132918820908 and q.get("manifest_pins") == 168
                and q.get("manifest_hash") == "359fa5c4224a095c6c535ac87025c9e2510f8dc4a22e8f1d4b827b2dffd25548"
                and q.get("artifact_id") == 14176380839 and acc.get("status") == "GREEN_QUALIFIED"
                and (ROOT / q.get("receipt", "__missing__")).is_file()
                and result.get("source_reports") == 6 and result.get("consumer_reports") == 12
                and result.get("helper_reports") == [1, 3, 1] and result.get("all_twelve_native_controls_passed") is True
                and s.get("last_qualified_hardy_pre_G14", {}).get("run_id") == 43746155492
                and s.get("last_qualified_physical_operator", {}).get("run_id") == 43498649514
                and s.get("current_focus", {}).get("latest_qualified_run") == 43749092953
                and s.get("next_planned", {}).get("gate") == "P3-AUX-HARDY-G15",
                "G14 exact acceptance or preserved predecessor/physical-H missing")
        for kind, sha in {"source":"ef1fd6b67dd01c4dc893ef683ab7c75db44973c5", "consumer":"9dfb7f66c6d3abe6476d4b5a37cd10b695efdff9", "workflow":"dfcee5b20eac4865aed407a1966c9e6b97587542"}.items():
            data = (ROOT / q[kind]).read_bytes()
            require(q.get(kind + "_blob") == hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == sha,
                    "G14 accepted bytes drift: " + kind)
        archive = ROOT / "research/spectral-p2-original-field/diagnostics/P3_AUX_HARDY_G14_R1_43749092953_evidence.zip"
        require(archive.is_file() and hashlib.sha256(archive.read_bytes()).hexdigest()
                == "8bc27105fd09627299e21d9f2c8b56dee4d77432b291a7f6feec45c7d5163d5b",
                "G14 complete accepted artifact missing or changed")
    require(s.get("if_green") and s.get("if_red"), "decision alternatives missing")
    require(s["toolchain"] == {"lean": "4.34.1", "mathlib": EXPECTED_MATHLIB},
            "pinned toolchain changed without roadmap review")
    require(s.get("exploratory") == "NOT_PROMOTED", "exploratory physics promoted silently")
    scientific = s.get("scientific_method", {})
    require(scientific.get("protocol") == "research/methodology/BFSS_SCIENTIFIC_METHOD_PROTOCOL.md" and
            scientific.get("registry") == "research/methodology/BFSS_EXPERIMENT_REGISTRY.json",
            "research-method protocol/registry absent from active checkpoint")
    experiment = json.loads((ROOT / scientific["registry"]).read_text(encoding="utf-8"))
    require(experiment.get("schema_version") == 1 and experiment.get("protocol") == scientific["protocol"],
            "research method registry schema/link drift")
    require((ROOT / scientific["protocol"]).is_file(), "scientific method protocol missing")
    require("eight stages" in (ROOT / scientific["protocol"]).read_text(encoding="utf-8").lower(),
            "eight-stage research protocol removed")
    entries = experiment.get("entries", [])
    require(entries and all(isinstance(x, dict) for x in entries), "experimental registry empty")
    require(len({x["id"] for x in entries}) == len(entries), "duplicate experiment identifiers")
    required = {"observation","question","background","hypothesis","falsifiers","experiment","analysis_plan","conclusion_rule","communication"}
    for item in entries:
        require(item["status"] in experiment["allowed_statuses"], "unregistered experiment status")
        require(required <= set(item["stages"]), "missing scientific-method stages in " + item["id"])
        require(item.get("qualified_physical_claim") is False or item["status"] == "LEAN_QUALIFIED",
                "physical claim elevated from a non-Lean experiment")
    require(scientific["first_test_id"] in [x["id"] for x in entries],
            "active research test not indexed")
    alignment = s.get("monograph_alignment")
    require(isinstance(alignment, dict), "Edition 0.7 monograph review not recorded")
    require(alignment.get("status") == "REVIEWED_NOT_MERGED", "monograph merge/qualification status needs review")
    require(alignment.get("exact_commit") == "b603f4c1715e15f5f92c69d7fb071992dbaa9f40",
            "monograph source changed without an explicit fresh review")
    require(alignment.get("original_math_baseline") ==
            "d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5",
            "monograph historical proof baseline drift")
    require(alignment.get("atlas_records") == 38 and
            alignment.get("new_mathematical_qualification") is False and
            alignment.get("monograph_fast_forward_authorized") is False,
            "monograph review must not promote evidence or merge")
    if s["milestone"] == "M3" and q["gate"] == "P3-M3G0B1":
        receipt = ("research/spectral-p2-original-field/"
                   "P3_M3G0B1_R2_GREEN_43467719230_ACCEPTANCE_AND_M3_RECOVERY_HANDOFF_2026_11_13.md")
        require(q.get("verdict") == "GREEN"
                and q.get("run_id") == 43467719230
                and q.get("tested_sha") ==
                "adb7f1378fd1e06da45352952a15d32b00c4654b"
                and q.get("manifest_pins") == 463
                and q.get("artifact_id") == 14061845908
                and q.get("source_blob") ==
                "095e63582a5f04a9dd2be0a192fb42586d97dd2f"
                and q.get("consumer_blob") ==
                "42e12c82dcf854fa0be0c73dbd38b0fd13f12692"
                and q.get("workflow_blob") ==
                "b3a7a888b89908a170aa4d1a690b11ef5f5ba9aa"
                and q.get("declarations") == [
                    "originalFockOperatorGaugeEquiv_source_all_basis_ae",
                    "originalFockOperator_eq_of_basis",
                    "originalFockOperatorGaugeEquiv_source_operator_ae",
                ]
                and q.get("allowed_axioms") ==
                ["propext", "Classical.choice", "Quot.sound"]
                and (ROOT / receipt).is_file(),
                "M3G0B1 exact accepted source+consumer receipt mutated")
    if s["milestone"] == "M1":
        expected_next = {"P3-D5B3": "P3-D5B4A", "P3-D5B4A": "P3-D5B4B"}.get(q["gate"])
        require(expected_next is not None and s.get("next_planned", {}).get("gate") == expected_next,
                "M1 accepted-gate to next-gate sequence drift")
    if s["milestone"] == "M2" and q["gate"] == "P3-D5B4B":
        require(s.get("next_planned", {}).get("gate") == "P3-M2A" and
                s.get("stage_transition", {}).get("status") in {"M1_DELIVERABLE_QUALIFIED_M2_GATE_NOT_STAGED", "M1_DELIVERABLE_QUALIFIED_M2_GATE_STAGED_UNQUALIFIED"},
                "M2 transition requires B4B exact accepted receipt and first HS-fiber gate review")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2A":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B1" and
                s.get("stage_transition", {}).get("status") in {"M1_COMPLETE_M2A_ACCEPTED_M2B1_UNSTAGED", "M1_COMPLETE_M2A_ACCEPTED_M2B1_STAGED_UNQUALIFIED"},
                "M2A strict qualification requires scoped M2B1 handoff; no premature M3 or spectrum")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B1":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2A" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_ACCEPTED_M2B2A_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_ACCEPTED_M2B2A_STAGED_UNQUALIFIED"},
                "M2B1 strict qualification requires a scoped unstaged M2B2A research handoff")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2A":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2B0" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_ACCEPTED_M2B2B0_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_ACCEPTED_M2B2B0_STAGED_UNQUALIFIED"},
                "M2B2A accepted requires source original operator-L2 M2B2B handoff, no M3 promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2B0":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2B1" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_ACCEPTED_B1_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_ACCEPTED_B1_STAGED_UNQUALIFIED"},
                "B0 qualified requires source operator-valued Lp B1 handoff; no physical promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2B1":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2B2" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_ACCEPTED_B2_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_ACCEPTED_B2_STAGED_UNQUALIFIED"},
                "B1 qualified requires bounded original operator Lp B2 equivalence handoff, no physical promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2B2":
        require(s.get("next_planned", {}).get("gate") == "P3-M2C0" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_ACCEPTED_M2C0_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_ACCEPTED_M2C0_STAGED_UNQUALIFIED"},
                "B2 accepted requires bounded operator-to-Fock Lp columns M2C0 handoff, no physical promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2C0":
        require(s.get("next_planned", {}).get("gate") == "P3-M2C1" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_M2C0_ACCEPTED_M2C1_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_M2C0_ACCEPTED_M2C1_STAGED_UNQUALIFIED"},
                "M2C0 qualified requires explicit original operator Lp vs Fock column norm-bound M2C1 handoff")
    # M2C1 remains the last strictly qualified mathematical gate. The
    # following states are PROSPECTIVE M3 preparation, not new theorem greens.
    prospective_m3_source = None
    if s["milestone"] == "M3" and q["gate"] == "P3-M2C1":
        nxt = s["next_planned"]
        require(s["stage_transition"]["status"] ==
                "M2_SCOPE_COMPLETE_M3G0_RESEARCH_UNSTAGED",
                "M2C1 scoped closure/transition status changed")
        old_handoff = (nxt.get("gate") == "P3-M3G0" and
                       nxt.get("status") == "RESEARCH_DESIGN_NOT_STAGED")
        p = s.get("m3g0a_prospective", {})
        prospective_handoff = (nxt.get("gate") == "P3-M3G0A" and
                               nxt.get("status") in {
                                   "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                                   "UNCOMPILED_SOURCE_AND_CONSUMER_CANDIDATE_STAGED_WORKFLOW_NOT_STAGED",
                                   "STRICT_WORKFLOW_STAGED_PENDING",
                               } and
                               p.get("mathematical_qualification") is False and
                               p.get("last_accepted_mathematical_run") == 43379713104 and
                               ((p.get("workflow_staged") is False and
                                 nxt.get("status") != "STRICT_WORKFLOW_STAGED_PENDING")
                                or (p.get("workflow_staged") is True and
                                    p.get("status") == "STRICT_WORKFLOW_STAGED_PENDING" and
                                    nxt.get("status") == "STRICT_WORKFLOW_STAGED_PENDING" and
                                    a.get("gate") == "P3-M3G0A" and
                                    a.get("status") == "PENDING_STRICT_CI" and
                                    a.get("manifest_pins") == 459 and
                                    (a.get("run_id") is None or
                                     (isinstance(a.get("run_id"), int) and
                                      a.get("run_id") > 0 and
                                      isinstance(a.get("workflow_tested_head_sha"), str) and
                                      re.fullmatch(r"[0-9a-f]{40}", a["workflow_tested_head_sha"]))) and
                                    p.get("distinct_deduplicated_manifest_pins") == 459)))
        require(old_handoff or prospective_handoff,
                "M2C1 qualified requires original M3G0 research handoff or bounded unqualified M3G0A candidate")
        if prospective_handoff:
            receipt = Path(p.get("receipt", "__missing__"))
            require(not receipt.is_absolute() and ".." not in receipt.parts and
                    (ROOT / receipt).is_file() and
                    p.get("status") in {"PROSPECTIVE_RECEIPT_ONLY",
                                       "SOURCE_CONSUMER_CANDIDATE_UNCOMPILED",
                                       "STRICT_WORKFLOW_STAGED_PENDING"} and
                    nxt.get("pre_gate_receipt_complete") is True,
                    "M3G0A prospective receipt/state missing or inaccurately qualified")
            candidate_path = ("lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
                              "P3M3G0AOriginalFockGaugeColumnTransport.lean")
            consumer_path = ("lean/diagnostics/"
                             "BFSSP3M3G0AOriginalFockGaugeColumnTransportIndependentConsumer.lean")
            if p.get("lean_source_staged") or p.get("independent_consumer_staged"):
                require(p.get("lean_source_staged") is True and
                        p.get("independent_consumer_staged") is True and
                        p.get("status") in {
                            "SOURCE_CONSUMER_CANDIDATE_UNCOMPILED",
                            "STRICT_WORKFLOW_STAGED_PENDING",
                        } and
                        nxt.get("status") in {
                            "UNCOMPILED_SOURCE_AND_CONSUMER_CANDIDATE_STAGED_WORKFLOW_NOT_STAGED",
                            "STRICT_WORKFLOW_STAGED_PENDING",
                        } and
                        nxt.get("proof_source") == candidate_path and
                        nxt.get("independent_consumer") == consumer_path and
                        (ROOT / candidate_path).is_file() and
                        (ROOT / consumer_path).is_file(),
                        "M3G0A source and original-Fock independent consumer not both staged")
                prospective_m3_source = candidate_path
            else:
                require(p.get("status") == "PROSPECTIVE_RECEIPT_ONLY" and
                        nxt.get("status") == "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                        "M3G0A receipt-only state must not claim a source or workflow")
        review = s.get("priority_review", {})
        require(review.get("status") == "M2_SCOPED_MATH_COMPLETE_M3_RESEARCH_ONLY" and
                (ROOT / review.get("review", "__missing__")).is_file() and
                (ROOT / review.get("acceptance", "__missing__")).is_file(),
                "M2 closure and M3 prioritized reuse receipts absent")
    if s["milestone"] == "M3" and q["gate"] == "P3-M3G0A":
        receipt = Path("research/spectral-p2-original-field/"
                       "P3_M3G0A_GREEN_43391099205_ACCEPTANCE_M3G0B_RESEARCH_HANDOFF_2026_11_13.md")
        require(q.get("verdict") == "GREEN" and
                q.get("run_id") == 43391099205 and
                q.get("tested_sha") == "f5fffd4aa3ad0ddfda499f87a5e358cf83e83b2f" and
                q.get("manifest_pins") == 459 and
                q.get("artifact_id") == 14021737638 and
                q.get("source_blob") == "cc40839076eb980dab54f57af9c95b9d9e33da2c" and
                q.get("consumer_blob") == "b66dcf427baf572a44de3bd72566857803accbea" and
                q.get("workflow_blob") == "01339242a437da51153a64f97b55e077e73e01c5" and
                q.get("declaration_count") == 9 and
                len(q.get("declarations", [])) == 9 and
                (ROOT / receipt).is_file(),
                "M3G0A exact accepted proof receipt/pins missing or mutated")
        require(s.get("next_planned", {}).get("gate") in {"P3-M3G0B", "P3-M3G0B0"} and
                ((s.get("next_planned", {}).get("gate") == "P3-M3G0B" and
                  s.get("next_planned", {}).get("status") == "RESEARCH_DESIGN_NOT_STAGED" and
                  s.get("next_planned", {}).get("pre_gate_receipt_complete") is False)
                 or
                 (s.get("next_planned", {}).get("gate") == "P3-M3G0B0" and
                  s.get("next_planned", {}).get("status") in {
                      "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                      "SOURCE_CONSUMER_STAGED_UNQUALIFIED",
                      "STRICT_WORKFLOW_STAGED_PENDING",
                      "RED_UNQUALIFIED_REPAIR_PENDING",
                  } and
                  s.get("next_planned", {}).get("pre_gate_receipt_complete") is True and
                  (ROOT / s["next_planned"].get("pre_gate_receipt", "__missing__")).is_file() and
                  s.get("m3g0b_prospective", {}).get("mathematical_qualification") is False)) and
                ((s.get("next_planned", {}).get("gate") == "P3-M3G0B" and
                  s.get("stage_transition", {}).get("status") ==
                  "M3G0A_QUALIFIED_M3G0B_RESEARCH_UNSTAGED" and
                  s.get("m3g0b_prospective", {}).get("source_staged") is False and
                  s.get("m3g0b_prospective", {}).get("workflow_staged") is False)
                 or
                 (s.get("next_planned", {}).get("gate") == "P3-M3G0B0" and
                  s.get("stage_transition", {}).get("status") ==
                  "M3G0A_QUALIFIED_M3G0B0_PROSPECTIVE_AND_STRICT_PENDING" and
                  s.get("m3g0b_prospective", {}).get("source_staged") is
                    (s["next_planned"]["status"] != "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED") and
                  s.get("m3g0b_prospective", {}).get("consumer_staged") is
                    (s["next_planned"]["status"] != "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED") and
                  s.get("m3g0b_prospective", {}).get("workflow_staged") is
                    (s["next_planned"]["status"] in {
                        "STRICT_WORKFLOW_STAGED_PENDING",
                        "RED_UNQUALIFIED_REPAIR_PENDING",
                    }))) and
                s.get("m3g0a_prospective", {}).get("mathematical_qualification") is True and
                s.get("m3g0b_prospective", {}).get("mathematical_qualification") is False and
                s.get("evidence_ledger_latest") == str(receipt),
                "M3G0A acceptance requires exact unqualified M3G0B/B0 phase transition")

    if s.get("next_planned", {}).get("gate") == "P3-M3G0B0":
        b0 = s.get("m3g0b_prospective", {})
        source = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0B0OriginalGaugeAEBasisColumn.lean"
        consumer = "lean/diagnostics/BFSSP3M3G0B0OriginalGaugeAEBasisColumnIndependentConsumer.lean"
        require(b0.get("gate") == "P3-M3G0B0" and
                b0.get("pre_gate_receipt_complete") is True and
                b0.get("status") in {
                    "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                    "SOURCE_CONSUMER_STAGED_UNQUALIFIED",
                    "STRICT_WORKFLOW_STAGED_PENDING",
                    "RED_UNQUALIFIED_REPAIR_PENDING",
                }, "M3G0B0 pre-gate receipt must precede any new source")
        if b0.get("source_staged") or b0.get("consumer_staged"):
            require(b0.get("source_staged") is True and
                    b0.get("consumer_staged") is True and
                    (ROOT / source).is_file() and (ROOT / consumer).is_file() and
                    b0.get("source_path") == source and
                    b0.get("consumer_path") == consumer,
                    "M3G0B0 source and original consumer must be staged together")
            prospective_m3_source = source
        if b0.get("workflow_staged"):
            is_pending = (a.get("status") == "PENDING_STRICT_CI")
            exact_red_receipts = {
                43398003237: ("research/spectral-p2-original-field/"
                              "P3_M3G0B0_R1_RED_43398003237_SOURCE_AE_REWRITE_REPAIR_2026_11_13.md"),
                43421947368: ("research/spectral-p2-original-field/"
                              "P3_M3G0B0_R2_RED_43421947368_SHALLOW_BASELINE_CHECKOUT_2026_11_13.md"),
            }
            is_recorded_red = (a.get("status") == "RED_UNQUALIFIED" and
                               a.get("run_id") in exact_red_receipts and
                               a.get("red_receipt") ==
                                   exact_red_receipts.get(a.get("run_id")) and
                               (ROOT / a["red_receipt"]).is_file())
            require(a.get("gate") == "P3-M3G0B0" and
                    (is_pending or is_recorded_red) and
                    a.get("manifest_pins") >= q.get("manifest_pins") and
                    b0.get("mathematical_qualification") is False and
                    q.get("gate") == "P3-M3G0A",
                    "M3G0B0 strict pending or preserved R1 RED must not promote math")

    if s["milestone"] == "M3" and q["gate"] == "P3-M3G0B0":
        receipt = Path("research/spectral-p2-original-field/"
                       "P3_M3G0B0_R3_GREEN_43422546945_ACCEPTANCE_M3G0B1_HANDOFF_2026_11_13.md")
        required_declarations = [
            "actualOriginalFullL2GaugeUnitaryHom_apply_ae",
            "originalFockOperatorGaugeEquiv_source_column_ae",
            "originalFockOperatorGaugeEquiv_source_basis_ae",
        ]
        require(q.get("verdict") == "GREEN" and
                q.get("run_id") == 43422546945 and
                q.get("tested_sha") == "38017936230c959dc61dfb07c0e776d5ffc04ab5" and
                q.get("manifest_pins") == 461 and
                q.get("source_blob") == "ffffa9e8d8679577a5f32999dd36fe5c9e904a07" and
                q.get("consumer_blob") == "c914864eccc801d9045656f0d06157ae384670f4" and
                q.get("workflow_blob") == "0681a9292b420d729d1e63c95061750098958ada" and
                q.get("artifact_id") == 14036922930 and
                q.get("declaration_count") == 3 and
                q.get("declarations") == required_declarations and
                q.get("allowed_axioms") ==
                    ["propext", "Classical.choice", "Quot.sound"] and
                (ROOT / receipt).is_file(),
                "M3G0B0 scoped green needs exact tested original-source proof receipt/pins")
        b1 = s.get("m3g0b1_prospective", {})
        nxt = s.get("next_planned", {})
        b1_receipt = Path("research/spectral-p2-original-field/"
            "P3_M3G0B1_PROSPECTIVE_FINITE_AE_FULL_ORIGINAL_FOCK_OPERATOR_ACTION_2026_11_13.md")
        phase_research = (nxt.get("status") == "RESEARCH_DESIGN_NOT_STAGED" and
                          nxt.get("pre_gate_receipt_complete") is False and
                          b1.get("status") == "RESEARCH_DESIGN_NOT_STAGED" and
                          b1.get("source_staged") is False and
                          b1.get("consumer_staged") is False and
                          b1.get("workflow_staged") is False)
        phase_prepared = (nxt.get("status") in {
                              "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED",
                              "SOURCE_CONSUMER_STAGED_UNQUALIFIED",
                              "STRICT_WORKFLOW_STAGED_PENDING",
                              "RED_UNQUALIFIED_REPAIR_PENDING",
                          } and
                          nxt.get("pre_gate_receipt_complete") is True and
                          nxt.get("pre_gate_receipt") == str(b1_receipt) and
                          (ROOT / b1_receipt).is_file() and
                          b1.get("receipt") == str(b1_receipt) and
                          b1.get("pre_gate_receipt_complete") is True and
                          b1.get("status") == nxt.get("status") and
                          b1.get("source_staged") is
                             (nxt["status"] != "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED") and
                          b1.get("consumer_staged") is
                             (nxt["status"] != "PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED") and
                          b1.get("workflow_staged") is
                             (nxt["status"] in {
                                 "STRICT_WORKFLOW_STAGED_PENDING",
                                 "RED_UNQUALIFIED_REPAIR_PENDING",
                             }))
        require(nxt.get("gate") == "P3-M3G0B1" and
                (phase_research or phase_prepared) and
                s.get("stage_transition", {}).get("status") ==
                    "M3G0B0_QUALIFIED_M3G0B1_RESEARCH_UNSTAGED" and
                s.get("m3g0b_prospective", {}).get("mathematical_qualification") is True and
                b1.get("mathematical_qualification") is False and
                s.get("evidence_ledger_latest") == str(receipt),
                "M3G0B0 acceptance requires guarded unqualified B1 transition")
        if b1.get("source_staged") or b1.get("consumer_staged"):
            source = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0B1OriginalGaugeAEFullOperator.lean"
            consumer = "lean/diagnostics/BFSSP3M3G0B1OriginalGaugeAEFullOperatorIndependentConsumer.lean"
            require(b1.get("source_path") == source and
                    b1.get("consumer_path") == consumer and
                    (ROOT / source).is_file() and (ROOT / consumer).is_file(),
                    "M3G0B1 original bounded operator source/consumer mismatch")
            prospective_m3_source = source
        if b1.get("workflow_staged"):
            require(a.get("gate") == "P3-M3G0B1" and
                    (a.get("status") == "PENDING_STRICT_CI" or
                     (a.get("status") == "RED_UNQUALIFIED" and
                      a.get("run_id") == 43461444633 and
                      a.get("red_receipt") ==
                        "research/spectral-p2-original-field/"
                        "P3_M3G0B1_R1_RED_43461444633_FERMION_COE_NORMALIZATION_2026_11_13.md" and
                      (ROOT / a["red_receipt"]).is_file())) and
                    a.get("manifest_pins") >= 461 and
                    b1.get("mathematical_qualification") is False,
                    "B1 strict pending must not be conflated with qualified B0")

    if a["status"] == "GREEN_QUALIFIED":
        require(a["gate"] == q["gate"] and a["run_id"] == q["run_id"] and
                a["manifest_pins"] == q["manifest_pins"] and
                a.get("workflow_tested_head_sha") == q["tested_sha"],
                "green active checkpoint does not match last qualified exact run")
    roadmap = ROADMAP_PATH.read_text(encoding="utf-8")
    require(STATE_PATH.name in roadmap, "roadmap not linked to live checkpoint")
    require("research/methodology/BFSS_SCIENTIFIC_METHOD_PROTOCOL.md" in roadmap and "research/methodology/BFSS_EXPERIMENT_REGISTRY.json" in roadmap,
            "scientific-method protocol not discoverable from active roadmap")
    require("b603f4c1715e15f5f92c69d7fb071992dbaa9f40" in roadmap and
            "Monograph S1" in roadmap and "Alternative independent spectral" in roadmap,
            "pinned monograph dependency/alternate-route crosswalk missing")
    for name in ("README.md", "AGENTS.md"):
        require(ROADMAP_PATH.name in (ROOT/name).read_text(encoding="utf-8"),
                name + " must point to canonical roadmap")
    # Advisory HEAD^→HEAD drift check for both active spectral gate families.
    # Permit edits to exactly the currently declared source, not to a qualified
    # ancestor or unrelated P3D5/P3M2 source. Do NOT parse a gate from the
    # module stem: P3M2B1Original... would ambiguously swallow the "O".
    # Strict source blob pins/CI, not this check, establish proof authority.
    try:
        changes = subprocess.check_output(
            ["git", "diff", "--name-only", "HEAD^", "HEAD"],
            cwd=ROOT, text=True).splitlines()
    except subprocess.CalledProcessError as exc:
        raise AssertionError("cannot inspect source drift from HEAD^: " + str(exc)) from exc
    source_dir = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
    for filename in changes:
        if not filename.startswith(source_dir):
            continue
        stem = Path(filename).stem
        if stem.startswith(("P3D5", "P3M2", "P3M3", "P3M5")) and filename.endswith(".lean"):
            require(filename == a["source"] or filename == prospective_m3_source,
                    "P3 spectral source changed outside active qualified or explicitly "
                    "staged uncompiled M3G0A source: " +
                    filename + " (active " + a["source"] + ")")
    print("BFSS_ROADMAP_CHECK_PASS", "milestone", s["milestone"],
          "accepted", q["gate"], "active", a["gate"], a["status"])


if __name__ == "__main__":
    try:
        main()
    except (AssertionError, KeyError, TypeError, ValueError, OSError) as exc:
        print("BFSS_ROADMAP_CHECK_FAIL:", exc, file=sys.stderr)
        sys.exit(1)

