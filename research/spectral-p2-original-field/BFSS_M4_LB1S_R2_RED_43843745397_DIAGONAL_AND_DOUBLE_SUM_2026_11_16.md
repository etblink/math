# BFSS M4-LB1S R2 RED — diagonal real zero, elaboration recursion, double zero sum

**Date:** 2026-11-16 (Pacific), **branch:** `integration/bfss-unified-research-20261108` ONLY. **Status:** R2 RED / 5+4 qualification NOT accepted; physical Fock-vector group/charge-domain claims remain OPEN.

## Immutable tested evidence

- [Strict R2 #43843745397](https://github.com/etblink/math/actions/runs/43843745397): completed/failure, attempt 1, tested SHA **`d1db6be7be4c0e9aff8611a4d021bffe7b960c6d`**, job `133218628254`. Exact source/consumer/donor/toolchain pins and pinned Lean 4.34.1 + Mathlib restoration PASS; cold actual LB1S source compile RED, independent consumer NOT reached.
- [R2 artifact #14214961953](https://github.com/etblink/math/actions/runs/43843745397/artifacts/14214961953), 3,383 bytes, GitHub-reported SHA256 `352469dea5baed8c1df86de81d7cb530ed10515c4875c7d38d6f0d32ba67c02f` (provider-supplied, not locally rehashed).
- Tested source Git blob `d2dc3a8bcc45cc8cbc260bc97458fa8d11edc3b8`; independent source-typed consumer blob **`b66be3f0097dbb0a2747e58f7ff21b1bf1d7a1d8`**; accepted original LB0 donor blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`.
- Two source declarations **`originalSource48BivectorK`** (actual original (K(A)=\frac14\sum_{p,q} A_{pq}\Gamma_p\Gamma_q)) and **`originalSource48_matrixSkew_entries`** printed only standard axioms `propext, Classical.choice, Quot.sound`. The remaining skew adjoint, transpose corollary, and zero operator proof are NOT accepted and contain `sorryAx` in R2. There is no nine-of-nine source-plus-consumer result.

## Exact first causal diagnostics

- **Line 85:4**, diagonal branch `A p p=0`: Lean leaves `star (0 • (Γ_pΓ_p)) = -(0 • (Γ_pΓ_p))`. The original Fock operator scalar action is real-to-complex nontrivial, and generic `zero_smul` rewriting did not fire. Do not add a fake real-star module instance or rescale `Γ`.
- **Line 108:2**: `maximum recursion depth has been reached` at a `change` that unfolds a fully elaborated 48×48 nested `Finset` sum. Do NOT raise `maxRecDepth`/heartbeats. Prove a separate generic double-sum lemma on a typed `FockOp` fiber, then instantiate it without elaborating the entire sum in the final theorem body.
- **Line 136:63**: `∑ x,∑ x_1, 0 • (Γ_xΓ_x_1) = 0` unresolved; same missing exact operator real-zero scalar bridge. Use the already checked `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`, then `zero_smul ℂ`, with bounded `Finset.sum_eq_zero`.
- Warnings: unused simp arguments `zero_smul`, `star_zero`, `neg_zero`, and `Finset.sum_const_zero` in R2. Strict warning-as-error would fail even if all tactic goals closed; replace brittle/broad simp with explicitly typed local equalities.
- Original [R1 #43840918666](https://github.com/etblink/math/actions/runs/43840918666) and [R1 first-causal audit](BFSS_M4_LB1S_R1_RED_43840918666_SCALAR_STAR_SUM_BOUNDARY_2026_11_16.md) remain preserved. R2 successfully established the **real-to-complex star scalar action** bridge; do not discard that progress while repairing the new local failures.

## Bounded R3 next test / stopping rule

Keep all **five source theorem statements**, the exact `originalSource48BivectorK` definition and `A p q / 4 : ℝ` coefficient, original `Source48Label=Fin24×Fin2`, real skew hypothesis, and all **four consumer statements/bodies** fixed. In the skew proof only, prove typed `(0:ℝ) • x=(0:Op)` via the original real-to-complex scalar bridge plus `zero_smul ℂ`; introduce a small typed generic `doubleSum` star-neg lemma using one row-sum then one outer-sum, without modifying the mathematical result. In the zero proof, use the same local zero scalar identity and two explicit `Finset.sum_eq_zero` applications. Re-pin the source blob in the strict workflow; do not relax the source pin, axioms, warning-as-error, or resource bounds.

Record R3 first failure independently if still red; no acceptance until original source cold build + four true original-Fock independent consumers + **9/9** standard-only axiom reports and no `sorryAx`. Even success leaves the full `[K(A),\Gamma_k]`, Lie bracket, coherent Spin(9) Fock-vector unitary and physical 16-charge domain OPEN.
