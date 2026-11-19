# RHOPF-P9A0 — R1 RED and R2 bounded native compiler repair

**Research date:** 2026-11-18 (US Pacific); GitHub run UTC 2026-11-19.
**Strict original run:** [#44463306244](https://github.com/etblink/math/actions/runs/44463306244) (RED)
**Tested exact commit:** `db0678aec909db0c6ccb23970649691fe095328c`
**Failed original job:** `source-and-independent-consumer`, job ID `135355010611`
**Preserved failure artifact:** [artifact 14501122874](https://github.com/etblink/math/actions/runs/44463306244/artifacts/14501122874); workflow artifact ZIP sha256 `c4b9c2d374c78f6f2970503fed868796df5b36e1bd87fe566bee027549afb28d`.

## R1 exact evidence and classification

Original-source checkout, all six preflight Git hash assertions, the standard-library independent integer signed-permutation consumer, Lean 4.34.1 and exact pinned Mathlib restoration: **PASS**.

The unchanged literal original `SU2RealGammaProbe.lean` compilation passed (8925 jobs in its build), with the expected original source axiom reports. The *new* P9A0 file under strict `-DwarningAsError=true` then failed:

1. `RHOPFP9A0OriginalGammaPairClifford.lean:43:16`: deprecated `if_neg` lemma; Lean reports “Use `ite_eq_right` instead.” This is a strict-warning compatibility problem.
2. Source line 88: `No goals to be solved` — `rw [Matrix.transpose_neg, originalGammaPair_skew 2 5 (by decide)]` already closed the skew-symmetry goal, making trailing `simp` invalid.
3. Source line 93: same redundant `simp` after the `Gamma4 Gamma6` rewrite.

The ten native `#print axioms` reports are present (only `propext`, `Classical.choice`, `Quot.sound`), but R1 **does not qualify** because the module had three compiler errors. The native independent Lean consumer was skipped. There is no evidence of a theorem being false, and this is not a CI/environment regression.

## R2 surgical correction

**Exactly three edits**, with **no theorem statement, imported source, proof target, gamma entries, independent consumer, Fock operator, or physical semantics changed**:

- Line 43 simplification `simpa only [if_neg hab, zero_smul] using (gamma_clifford a b)` replaced by `simpa [hab] using (gamma_clifford a b)`.
- Remove trailing `simp` at each of the K25_skew and K46_skew proofs because `rw` already discharges those goals.
- Update the strict workflow's **sole source pin** to the exact revised Git blob; all other ancestry and code pins are unchanged.

**R1 source Git blob:** `588d9ceab142b8260ad299aaa7d98b8e7c38069f`.
**R2 source Git blob:** `bf5eb554232a6d452e86d85b05220aad7c5d0aeb`.
**R1 workflow blob:** `1c4ea15f55d372eaf1e0242da0fc870f5f5bdade`.
**R2 workflow blob:** `0ca9b03305763e4696b9afcd67aac1f3ef3b6c70`.

## Acceptance and stop rule

R2 is **PROSPECTIVE** until GitHub Actions finishes the original strict workflow against its *exact tested commit* and both original-source module and independent Lean consumer pass warning-as-error, source hashes and axiom checking. If a new RED occurs, preserve exact evidence and diagnose before another change.

This gate establishes only source gamma Clifford bivector square/skew identities. The three restricted Hopf-phase equalities, full-generator inequivalence and 36-bivector projection are still independently source checked **but not newly native-proved**. Nothing here establishes original BFSS Hamiltonian/Spin(9) Noether current, Fock-vector group implementer, closed physical domain, topological soliton, proton, particle mass or new Standard Model quantum number.

Preserve BFSS original source, FCP main, retired NFC tower and SM program constraints.
