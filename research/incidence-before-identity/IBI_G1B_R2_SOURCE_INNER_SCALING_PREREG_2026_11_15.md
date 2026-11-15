# IBI-G1B R2 — preregistered exact real-inner scaling repair

Date: 2026-11-15 Pacific. Isolated branch: `research/bfss-incidence-unified-20261114`.
Status at preregistration: **PROSPECTIVE / UNQUALIFIED**.

## First-causal R1 failure and preserved control

R1 strict [#43695261997](https://github.com/etblink/math/actions/runs/43695261997), tested `28a0efe59fb31d5a07cf07da219b77bc731c8db5`, failed `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG1BOriginalSignedCross.lean:84:2` at the trailing `simp` in `originalLieTriple_eq_crossTriple`. The first five named source roots passed their standard-only axiom audit; the failing root and its dependent `originalCrossTriple_gauge` had `sorryAx`. Consumer was not compiled. The original RED receipt, workflow and diagnostic artifact remain in history.

## Single source proof change

Keep all statements, imports, original P2-C0 Pauli normalization, G1A and other proofs unchanged. Replace only the trailing broad `simp` after `rw [pairedColorLie_eq_sourceCross]` with the explicitly typed lemma

```lean
  exact real_inner_smul_left
    (sourceCross (spatialColor x i) (spatialColor x j))
    (spatialColor x k) (Real.sqrt 2)
```

The pinned Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Mathlib/Analysis/InnerProductSpace/Basic.lean`, declares `real_inner_smul_left (x y : F) (r : ℝ) : inner ℝ (r • x) y = r * inner ℝ x y`. The original source theorem's goal after the G1B `rw` is exactly this scaling relation on `ColorVector 2`. No proof-search or resource-limit increase. This is a pinned-source proof-shape argument, **not** a Lean execution or qualification.

## Atomic branch gate and falsifiers

Commit source proof, workflow source-byte pin and this preregistration together in one candidate tree to avoid an artificial intermediate pin mismatch. Keep the independent consumer byte-identical at `8ab857bdbc77e01ec0e5c4dd1138cc1698f12244`. Workflow still checks original upstream pins, Lean 4.34.1, Mathlib `d13f23b7...`, cold source build, independent source consumer, and allowed `propext`, `Classical.choice`, `Quot.sound` only, no `sorryAx`. Judge R2 **only** from its exact run and tested SHA; if RED preserve first cause before any subsequent change.

A green would qualify only original `+sqrt(2)` signed cross/triple normalization and its gauge invariance. Still missing: cross-to-determinant coordinate proof, original G3A adjoint det+1, original SU(2) image surjectivity G0C, rank-split orbit classification G2, physical Fock/domain application, and any ontology claim. OCT-SRC octonionic Spin9 research remains separate; unified integration, `main`, FCP and original pilot untouched.
