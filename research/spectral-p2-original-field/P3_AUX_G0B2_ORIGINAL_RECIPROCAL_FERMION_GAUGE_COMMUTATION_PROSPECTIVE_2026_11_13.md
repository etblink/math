# P3-AUX-G0B2 — exact original Fock fiber SU(2) commutation for reciprocal FullL2 bounded operator

**Date:** 2026-11-13 Pacific. **Status:** PROSPECTIVE / UNQUALIFIED, awaiting exact native strict build and independent consumer.

## Scientific target

With true source `pairedGaugeData : pairedAlgebraData.GaugeData`, for all original SU(2) `g`, ε>0, and `f : FullL2 2`, prove `Bε (pairedGaugeData.fiberAction g f) = pairedGaugeData.fiberAction g (Bε f)` with `Bε=originalReciprocalFullL2CLM hε` on the original Fock-valued `Lp` carrier.

This differs from the preceding [G0B1 bosonic pullback strict GREEN #43527998761](https://github.com/etblink/math/actions/runs/43527998761), which used the bosonic measure-preserving pullback and G0A radial symmetry. G0B2 instead uses original `ContinuousLinearMap.coeFn_compLp` for `pairedGaugeData.fermion g` and the exact complex-linearity `map_smul` of the original fermion isometry; no bosonic pullback nor new gauge model is introduced.

## Exact theorem and independent verification

One theorem root: `FCP.BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutation.originalReciprocalFullL2CLM_fiberAction_comm`.

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxG0B2OriginalReciprocalFermionGaugeCommutation.lean` blob `7ca1cb15d094a695b3c1ee707e8835caaf0e847e`.
New consumer `lean/diagnostics/BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutationIndependentConsumer.lean` blob `55fbf74c19b3224faa1db25a956ace44f4aa3a99`.
New strict workflow `.github/workflows/bfss-p3-aux-g0b2-original-reciprocal-fermion-gauge-comm-strict.yml` with source and consumer root audits, full cold build and retained artifact.

## Frozen originals and toolchain

- True original Core `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- Accepted R0A `a67f8740586588c6d4ee9c9148574c81c14d4937` and R0B1 `d1cbb8077799236e5e1b82704270bdb9ab9153b4`.
- Actual gauge assembly G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`.
- Accepted R0B2A `e2a02b551486cfbc2a723f5b5ff0b282177c5e76`.
- Accepted G0A `2e89826685d77551405cb17f707ae3b47ecc80e1`, G0B0 `670cc600fdc42a03d21de759e8b46b6cb1306874`, and G0B1 `28d0ed07d97008b4075b849b7dafd2d837a01423`.
- Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Qualification and exclusions

Accept only exact strict source/consumer GREEN with the sole root's axioms among `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx` or source proxy.

G0B2 does **not** itself establish the combined original SU(2) unitary commutation, physical Gauss-fixed submodule preservation, full Haar projector commutation, infinitesimal Gauss unbounded-generator domain, native sixteen-charge PiLp lift, injectivity or inverse-weighted closed charge, auxiliary Hamiltonian or any gap. After G0B2 GREEN, a separate tiny G0B3 theorem should derive `Bε ∈ End(G.physicalSpace)` using original `GaugeCore.physicalSpace = ⨅ g, ker(bosonPullback g − fiberAction g)` and the two accepted commutations.

Negative knowledge: the preceding G0B1 R1 wrapper/rewrite RED remains as a permanent first-causal record; avoid syntactic rewrite problems by using a source-convertible congruence on the actual Lp value. No changes to original physical P3-M5BF0 or main.
