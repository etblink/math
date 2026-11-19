# RHOPF-P9C3B1 R2 — strict RED from unused simp argument; R3 minimum repair

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`
**R2 original run:** [#44600630683](https://github.com/etblink/math/actions/runs/44600630683), attempt 1, conclusion RED.
**Exact tested SHA:** `3b600892c5e570b8fa30a9a33192adec128ff880`.
**Original retained artifact:** [#14568157462](https://github.com/etblink/math/actions/runs/44600630683/artifacts/14568157462), ZIP SHA-256 `45c0909dd61e23707c3235283bbb7aff320d797eba51a49b0fb7d79c4db231e8`, independently downloaded/checksummed and verified to match GitHub digest, embedded `exact-tested-commit.txt` equals exact SHA.

## R1 vs R2 distinction

R1 [#44597813788](https://github.com/etblink/math/actions/runs/44597813788) original source RED at line 48 from unsolved `noncomm_ring` nine-term scalar-coefficient rearrangement; native `#print axioms` showed `sorryAx`. R2 replaced the fragile hand-expanded `calc` by direct distribution and scalar-action normalization with qualified original projector/complement/phase identities and `module`.

In R2 original-source preflight, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` and original dependency compilation PASS. At native source line 37:62, warning-as-error reported only **unused simp argument `smul_smul`**. The kernel axiom report for `FCP.RHOPFP9C3B1.relationalCirclePhase_mul` lists `propext`, `Classical.choice`, `Quot.sound`, and notably **no sorryAx**. Thus the R2 mathematical proof completed; strict workflow is RED due solely to the linter on the unused explicit lemma. Independent imported consumer was skipped because the native step was RED. No accepted claim promoted yet.

## R3 bounded source correction

Only change `simp only [add_mul, mul_add, mul_smul_comm, smul_mul_assoc, smul_smul, ...]` to `simp only [add_mul, mul_add, mul_smul_comm, smul_mul_assoc, ...]`; preserve all other proof bytes, theorem statement, original source imports, source frozen hashes except exact native proof pin, independent consumer, resource limits, CI and original integer fixture. This is a strict linter repair, **not** a new algebraic proof design.

A GREEN result must be independently verified at exact original tested SHA, source+consumer compilation, both root axiom reports allowed-only with no sorryAx, original artifact ZIP digest and embedded SHA, before formal qualification. If R3 develops a new native problem, preserve that evidence and revisit decomposition rather than weakening linter or freezing compiler warnings. All previous P9C1C1B source-coordinate R1/R2 REDs and P9C3B1 R1/R2 failures remain preserved.

**Scientific boundary:** Even qualified real parameter phase composition does not establish a continuous circle group action, original selected basis, a Hopf quotient, or implementation in the original BFSS Fock space/Hamiltonian/physical gauge sector.
