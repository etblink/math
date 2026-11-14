# P3-AUX-G0B3 R1 — prospective original Gauss physical-space preservation

**Date:** 2026-11-13 Pacific. **Stage:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Branch:** `integration/bfss-unified-research-20261108`. **Frozen parent:** `1255a687c6914a82f1b8c8a11db3a1ca45c4e7c4`. No green is inferred from staging.

## Original source and accepted prerequisites

The literal original `GaugeCore.lean` `pairedGaugeData.physicalSpace` is `⨅ g, ker (bosonPullback g - fiberAction g)` (blob `e4990dad`). The separately accepted source theorems are G0B1 `originalReciprocalFullL2CLM_bosonPullback_comm`, [#43527998761](https://github.com/etblink/math/actions/runs/43527998761), source blob `28d0ed07`, and G0B2 `originalReciprocalFullL2CLM_fiberAction_comm`, [#43532571952](https://github.com/etblink/math/actions/runs/43532571952), source blob `0df4f07a`. These are exact original `FullL2 2` theorems, not surrogates.

## Single preregistered root

For `ε>0` and `f∈pairedGaugeData.physicalSpace`, prove `originalReciprocalFullL2CLM hε f ∈ pairedGaugeData.physicalSpace`. Extract the same-`g` equation `P_g f=F_g f` from `Submodule.mem_iInf` and `sub_eq_zero`; apply G0B1 reversed, congruence under original `Bε`, then G0B2. Reassemble the literal kernel intersection.

The original source and independent consumer are `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxG0B3OriginalReciprocalPhysicalSpacePreservation.lean` and `lean/diagnostics/BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservationIndependentConsumer.lean`; strict workflow `.github/workflows/bfss-p3-aux-g0b3-original-reciprocal-physical-space-strict.yml`. Required: original source hash pins, Lean 4.34.1, Mathlib d13f23b7, cold rebuild, consumer, one-root allowed-axiom audit `[propext, Classical.choice, Quot.sound]`, artifact receipt. No `sorryAx`, no compiler errors or nonstandard axioms.

## Scope and stop rules

Success proves **invariance** of the original gauge-fixed input physicalSpace, not orthogonal projection commutation or reduction, bounded inverse, original sixteen-output `PiLp` action, injectivity, weighted supercharge, spectrum, Hardy bound or physical gap. In particular the output graph's actual carrier is `K=PiLp 2 (SpinIndex→FullL2 2)`; G0B3 is a compatibility result, **not a dependency** of the B16 closed inverse-image construction. If RED, capture first causal Lean/preflight/consumer error and do not silently repair or promote. The genuine original M5BF0 remains last accepted physical Hamiltonian.
