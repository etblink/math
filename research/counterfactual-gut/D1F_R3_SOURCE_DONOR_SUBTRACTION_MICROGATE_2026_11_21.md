# D1F R3 — Original Fock source-donor subtraction architecture

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Native source/consumer tested SHA:** `6d2a9978005cac7f5cddf0bc5c5ed1fb9619a37c`.  
**Run:** [#44937500313](https://github.com/etblink/math/actions/runs/44937500313).  
**Evidence status when this note was committed:** **CI IN PROGRESS — NOT QUALIFIED**. Do not interpret source presence or passed preflight as GREEN. Next date-stamped status should inspect exact run, job, first-causal log, source consumer axiom reports and artifact.

## Why this is not an unauthorized third blind simplifier retry

Prior [D1F R1/R2 RED evidence](./D1F_R1_R2_STRICT_REDS_AND_SOURCE_DONOR_DECISION_2026_11_21.md) showed failures from direct hand-normalization of the original double Majorana sum. Both REDs remain immutable. R3 **removes** those attempted proofs and replaces them with a source-donor decomposition using an upstream theorem already qualified on exact pinned bytes:

- Original `OAI.BFSSQuantum.AlgebraData.deformedFermionField_quantized` in `FermionQuantization.lean` (blob `c6b72d030225c707ef54f5285a18a7a8175ee280`):
  \[
  V_F(1,1,X)=
  [\operatorname{quantizeFrequency}(F(X))]_{\mathbb R}.
  \]
- Original `deformedFermionField_linear_parameters`, `deformedFermionField_bracket` from the same file, and `deformedFermionField_mass` from `FrequencyContraction.lean`.
- Original `quantizeFrequency` on `FrequencyMatrix N`, real 48-index coefficient and true original Fock carrier, and the existing `pairedAlgebraData : AlgebraData 2` on the distinct independent consumer.

## Four small, falsifiable helper claims

1. **`quantizeFrequency_sub`:** `quantizeFrequency(K−L)=quantizeFrequency(K)−quantizeFrequency(L)` from the real matrix `Matrix.sub_apply`, `Complex.ofReal_sub`, `sub_smul` and `Finset.sum_sub_distrib`. The subtraction rewrite sequence is the **working upstream donor**'s sequence, not the R1/R2 negated-sum tactic.
2. **`masslessField_zero`:** the coefficient-linear original `deformedFermionField 1 0` vanishes at bosonic `X=0`. Check via the upstream `deformedFermionField_bracket` and `cubicFermionComponent`.
3. **`massField_constant`:** the already proved exact `deformedFermionField_mass` expression has no bosonic parameter; evaluate at `X` and `0`.
4. **`masslessField_as_difference`:** combine the original source `deformedFermionField_linear_parameters` with helpers (2), (3) and additive group cancellation:
   \[
   V_F(1,0,X)=V_F(1,1,X)-V_F(1,1,0).
   \]

Only after these algebraic helpers, apply the **accepted massive-plus-interaction donor at X and 0**, linear quantization and the previously R1/R2-successful source coefficient identity `masslessFrequency M X=fermionCoefficient X−fermionCoefficient 0`. Finally recover the complex-linear original Fock statement from faithfulness of real scalar restriction using ordinary evaluation-extensionality.

## Qualification and stop rules

Three public original goals are **exactly unchanged**: `masslessFrequency_eq_source_difference`, `quantize_masslessFrequency` and `deformedFermionField_massless_quantized`. Existing original paired-SU2 **independent consumer** and frozen CI workflow are unchanged.

The strict workflow checks the original Core/FermionQuantization/DeformedCharge/PairedTheta blob pins, Lean 4.34.1/Mathlib d13f23b7, source cold compilation, distinct consumer, permitted axioms on the three public roots, exact tested commit and first-causal archived evidence. A RED in one helper means **that helper proof is not qualified**, not that the underlying source theorem or BFSS physics is false. Do not defeat a real mismatch by adding `sorry`, broadening accepted axioms, changing original representation/normalization or inventing a mass term.

No source-derived protected hopfion, physical spectral gap, 3D Dirac index, 4D chiral multiplet or GUT follows from a successful algebraic bridge alone. D0–D1E's geometric and spectrum negative controls remain active. The live RHOPF branch, `main` and previously accepted source snapshots are untouched.
