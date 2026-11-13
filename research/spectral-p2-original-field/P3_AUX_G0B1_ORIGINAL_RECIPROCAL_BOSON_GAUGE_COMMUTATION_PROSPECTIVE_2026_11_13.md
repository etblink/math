# P3-AUX-G0B1 — native reciprocal bounded operator bosonic gauge pullback commutation

**Date:** 2026-11-13 Pacific. **Status:** STAGED / NOT QUALIFIED until exact strict Lean and independent consumer GREEN.

## Goal

Use the exact source original `pairedGaugeData.bosonPullback g : FullL2 2 →ₗ[ℂ] FullL2 2` and accepted original `Bε = originalReciprocalFullL2CLM hε : FullL2 2 →L[ℂ] FullL2 2`, prove `Bε (pairedGaugeData.bosonPullback g f) = pairedGaugeData.bosonPullback g (Bε f)` for every g in the true original SU(2) group, ε>0 and Fock-valued original L² input f.

Proof via exact `Lp.ext`, `Lp.coeFn_compMeasurePreserving`, original G0A pointwise invariance, and **G0B0 accepted** original reciprocal CLM AE multiplication. No replacement boson or Fock carriers. The inverse-gauge convention belongs to the existing source and is not to be reversed by a new convention.

## Exact root

`FCP.BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutation.originalReciprocalFullL2CLM_bosonPullback_comm`.

One original source proof and one independent consumer with exactly that `#print axioms` fully-qualified root. Standard permitted axioms only; compile in cold Lean 4.34.1 with pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.

## Frozen source pins

- Original Core `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- Qualified R0A `a67f8740586588c6d4ee9c9148574c81c14d4937`.
- Qualified R0B1 `d1cbb8077799236e5e1b82704270bdb9ab9153b4`.
- True six-field SU(2) G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`.
- Qualified R0B2A `e2a02b551486cfbc2a723f5b5ff0b282177c5e76`.
- Qualified G0A `2e89826685d77551405cb17f707ae3b47ecc80e1`.
- Qualified G0B0 `670cc600fdc42a03d21de759e8b46b6cb1306874`; strict run [#43523896876](https://github.com/etblink/math/actions/runs/43523896876).
- New original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxG0B1OriginalReciprocalBosonGaugeCommutation.lean`, blob `18ec705a7a67370c79d6010657d367dc4448d653`.
- New independent consumer `lean/diagnostics/BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutationIndependentConsumer.lean`, blob `f45d0a97cc475b04205aeddfd290248f7e3b529f`.

## Boundaries

Even if strict GREEN, this proves only commutation with the original **bosonic** gauge pullback. It does not prove commutation with the original fermion fiberAction, combined gauge unitary, preservation of exact `pairedGaugeData.physicalSpace`, Haar projection commutation, infinitesimal Gauss generator domain theorem, injectivity, finite sixteen-charge PiLp lift, closed weighted physical charge graph, auxiliary H, Hardy estimate or spectral gap.

Next separately bound the complex-linear scalar multiplication's commutation with the native fermion `fiberAction`, then derive original physical-subspace preservation from existing `GaugeCore.physicalSpace = iInf ker(bosonPullback-fiberAction)`. Preserve original physical M5BF0; no source physics edits.
