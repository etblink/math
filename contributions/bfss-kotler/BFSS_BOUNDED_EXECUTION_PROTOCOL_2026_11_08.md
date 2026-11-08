# BFSS bounded-execution and recovery protocol — v1.0

**Effective:** 2026-11-08  
**Repository:** `etblink/math`  
**Adopted on branch:** `research/bfss-original-gamma-faithfulness-20261107`  
**Observed branch head before this document:** `f9b5ebbdda6a33be02d14e9023ce95ef77a6e365`  
**Nature:** project operations and provenance; **no new Lean theorem, CI qualification, dependency audit, or scientific acceptance**.

> Seek truth; preserve accepted results and negative knowledge. Treat the Git tree and exact qualification evidence as the canonical research record. Avoid response-level tool orchestration failures by making progress bounded and resumable.

## 1. Scope one execution unit

An **execution unit** should have one objective and one verifiable terminal artifact or outcome. Separate:
- read-only reconnaissance and mathematical strategy;
- source inventory generation and hash validation;
- reusable interface design;
- Lean edits, consumers, and exact CI qualification;
- documentation and housekeeping.

Do not combine all five in a single long-running assistant response. As a practical heuristic, use a few focused external calls per unit, not a numerical quota claim. If the unit is becoming broad, stop at a durable checkpoint. A long reasoning chain is **not** itself evidence of a platform limit. No known numeric tool-call ceiling has been established.

## 2. Standard unit record

Before a material operation, identify:
- **objective / explicit exclusions**;
- **repository / branch / starting HEAD**;
- **source prerequisites and expected output**;
- **acceptance test and stop conditions**;
- **whether mutation is authorized**.

After it, report:
- **ACTUAL** returned commit SHA(s), artifact path(s), and CI run ID(s), if any;
- **OBSERVED** PASS/FAIL or diagnostic result, distinguished from assertions;
- **NOT RUN / UNKNOWN**, as applicable;
- **next smallest unit**, without implying it already happened.

Do not claim a commit, scan, gate, check, or proof is completed when a tool failed or returned no confirmation. If the chat interrupts, recover using the **actual remote branch head** and exact saved results, not inferred conversation state.

## 3. Failure taxonomy and recovery

| Failure class | Required action |
| --- | --- |
| ChatGPT conversation/tool orchestration | Stop creating further remote mutations in that response; inspect GitHub state in a fresh unit and reconstruct only missing evidence |
| GitHub transport or permission error | Confirm whether any mutation actually landed before retrying; avoid duplicate commits |
| Script/source inventory mismatch | Fail closed; record path, expected versus actual blob/byte count, and pinned checkout |
| Lean compiler/linter error | Inspect the first causative diagnostic and exact source ancestry; do one bounded repair rather than speculative retry cycling |
| CI infrastructure/cache/transient failure | Separate environment/transient failures from proof failures; preserve source pinning and cold qualification |
| Genuine mathematical obstruction | Record negative result and assumptions; do not swap source carriers or silently weaken hypotheses |

Avoid treating a green workflow as a general theorem about later commits; qualification is **commit-specific and gate-specific**.

## 4. Scientific integrity invariants

1. Preserve original source carriers, representations, normalizations, central Spin signs and source Hamiltonian operators.
2. Keep independent consumers and exact source/manifest hashes wherever existing strict gates require them.
3. Retain cold-build and axiom checks where required; a warm cache cannot substitute for proof qualification.
4. Distinguish QUALIFIED / CANDIDATE / EXPLORATORY / CONDITIONAL / REJECTED / SUPERSEDED.
5. No bulk source moves, renames, workflow deletion, or history rewrites as ad-hoc cleanup. Classify first; preserve provenance.
6. A dependency facade improves discoverability only after exact imported declarations and consumer status are understood; an import-only facade does not reduce transitive Lean cost on its own.
7. Keep the **Fock-vector M=6** and **operator-fiber M=12** bounds separate. Do not promote spectral test functions into eigenvalue or mass-gap claims.

## 5. Immediate pending milestone: complete 420-module source inventory

**Current observed state at adoption:** the deterministic generator exists at
`contributions/bfss-kotler/tools/build_import_graph.py`, added in commit
`f9b5ebbdda6a33be02d14e9023ce95ef77a6e365`.
The frozen inventory lists **420** BFSS Lean source files, and the generator cross-checks **24** sampled import sets. The full generator has **not** been verified as executed in this checkpoint.

**Next execution unit (separate from adoption of this policy):**

1. Obtain a **full local checkout** of the exact intended branch commit; record `git rev-parse HEAD` and confirm it matches the requested revision. Do not assume a GitHub contents read is an executable checkout.
2. Run `python3 contributions/bfss-kotler/tools/build_import_graph.py --repo-root .`.
3. Run `python3 contributions/bfss-kotler/tools/build_import_graph.py --repo-root . --check`.
4. Inspect and record: source-integrity result, module count, sampled-import crosscheck, internal/outside edges, missing BFSS imports, cycles, and any script errors.
5. Preserve the generated JSON and exact evidence **in a subsequent bounded documentation/data unit**. If anything fails, preserve the diagnostic and do not label the graph complete.

The scan is **not** a Lean build, a dependency-closure proof, an axiom audit, a consumer qualification, or evidence of dead code. The generator's import parser must itself be evaluated against the source syntax if discrepancies emerge.

**After successful inventory only:** inspect dependency subgraphs to select the smallest reusable contract experiment. The OP0–OP1 gauge-fixed projection plan is a candidate, not a prior qualification. Preserve the separate source-faithful Fock/Spin(9)/closed-form integration research program.

## 6. Response and handoff rule

Every substantive tool-heavy response should end with a short, self-contained checkpoint:
`BRANCH | START_HEAD | END_HEAD | OBJECTIVE | FILES | VERIFIED | NOT_RUN | NEXT_UNIT`.

If an interruption occurs, the next session begins read-only by fetching the remote branch HEAD and inspecting the referenced artifact before any write. Repeat only the unfinished unit, not the entire historical investigation.

## 7. Cross references

- [Project map](BFSS_PROJECT_MAP_2026_11_08.md)
- [Dependency and housekeeping audit](BFSS_REPOSITORY_DEPENDENCY_AND_HOUSEKEEPING_AUDIT_2026_11_08.md)
- [Original Fock / Spin(9) / physical form memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md)
- [Gauge-fixed OP0–OP1 feasibility memorandum](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md)
