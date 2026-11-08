# BFSS 420-module full source-import scan — verified diagnostic report

**Date:** 2026-11-08  
**Repository:** `etblink/math`  
**Research branch:** `research/bfss-original-gamma-faithfulness-20261107`  
**Tested commit:** `af04a644aef61592d171ce44b36aec54473476f8`  
**Frozen inventory baseline:** `5e2591d70bed7aa111aa97737289396523375b29`  
**BFSS source subtree SHA:** `ce9b6477d1467bd6e9f6ca0d8d7b6e1d0ad278ab`  
**Workflow:** [Run #42510563445](https://github.com/etblink/math/actions/runs/42510563445) — SUCCESS  
**Generated evidence:** [GitHub Actions artifact #13629710423](https://github.com/etblink/math/actions/runs/42510563445/artifacts/13629710423), temporary retention through **2026-11-22**.  
**Complete generated JSON:** `BFSS_IMPORT_GRAPH_FULL_2026_11_08.json` in artifact (426146 uncompressed bytes; SHA-256 `4d5722087e4cc7094ec086a3653520423a0d1116aa8192a2597ffaef07545b35`). **The full graph is not yet committed as a tracked repository file.**

## Exact observed results

| Check | Result |
| --- | --- |
| Full checkout pinned to tested commit | PASS |
| Frozen BFSS subtree SHA matched source checkout | PASS |
| 420 inventoried Lean source files checked against blob SHA-1 and byte size | PASS |
| 24 sampled direct import sets cross-checked | PASS |
| Generated graph deterministic second `--check` | PASS |
| BFSS Lean source modules | 420 |
| Direct internal import edges | 597 |
| Direct outside-inventory import edges | 306 |
| Total direct import edges | 903 |
| Missing BFSS-prefixed module imports | 0 |
| Cyclic internal strongly connected components | 0 |
| Modules with zero **internal direct downstream** imports | 20 |
| Graph artifact upload | PASS |

**Explicit scope limit:** This is a static source-import graph under the generator's parser. It is **not** a Lean build, theorem qualification, independent consumer, axiom audit, source declaration audit, reachability proof, compilation-cost profile, or dead-code proof. A zero-internal-downstream module may still have external consumers, be an independent research endpoint, or be used by workflows. Do **not** delete/move files based on this count.

**Structural observation:** `OAI.MathematicalPhysics.BFSS.Main` has 73 direct internal imports. This is useful as a top-level aggregation entry point, but not a good foundation for a tiny reusable interface diagnostic; importing it would broaden ancestry.

## Nonfatal workflow issue discovered during log review

The result-capturing shell step included backtick-formatted commit hashes in a double-quoted `echo` for the GitHub job summary. Shell command substitution attempted to execute the hashes, producing two `command not found` lines. Those specific summary lines were malformed; the separate checkout identity check, frozen tree comparison, generator execution and second `--check` all returned success, and the complete JSON and evidence files were uploaded.

**Action:** Repair only the workflow summary formatting in a separate bounded unit, with no claim that this cosmetic issue invalidates the completed graph validation.

## Architecture decision for the next bounded unit

Do **not** undertake repository garbage collection, bulk moves, a new `Main` facade, or a source-Spin/Fock integration jump.

The smallest logically independent interface experiment remains the previously proposed **OP0–OP1 gauge-fixed projection diagnostic**:

1. **OP0**: Mathlib-only finite-dimensional gauge-fixed projection API: a genuine unitary representation, fixed subspace `W`, orthogonal projection `P_W`, and its range characterization. No original BFSS imports.
2. **OP1**: Generic lemma that a unital complex-linear star-algebra automorphism fixing the gauge operators fixes `P_W`. Prove two-sided inverse and orthogonal projection uniqueness with an independent consumer.
3. **Only after OP0–OP1 qualify**: assess source-carrier binding OP2, actual 48-Majorana operator action OP3, gauge commutation OP4, and the original physical form constraints. Preserve the operator-fiber M=12 versus Fock-vector M=6 distinction.

This is a **planning selection**, not an executed Lean experiment or qualified representation theorem.

## Required continuation handoff

`BRANCH=research/bfss-original-gamma-faithfulness-20261107`  
`TESTED_HEAD=af04a644aef61592d171ce44b36aec54473476f8`  
`OBJECTIVE=full 420-module static import graph scan`  
`VERIFIED=PASS, 420 modules, 597 internal edges, 306 external edges, 0 cycles, 0 missing BFSS imports, 24 sampled match`  
`NOT_RUN=Lean source/consumer/axiom qualification, OP0–OP1, permanent full-graph Git commit`  
`NEXT_UNIT=preserve full JSON as tracked provenance and repair summary formatting; then scope OP0 only`

Related: [bounded-execution protocol](BFSS_BOUNDED_EXECUTION_PROTOCOL_2026_11_08.md), [project map](BFSS_PROJECT_MAP_2026_11_08.md), [sampled dependency audit](BFSS_REPOSITORY_DEPENDENCY_AND_HOUSEKEEPING_AUDIT_2026_11_08.md), and [OP0–OP1 feasibility memorandum](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md).
