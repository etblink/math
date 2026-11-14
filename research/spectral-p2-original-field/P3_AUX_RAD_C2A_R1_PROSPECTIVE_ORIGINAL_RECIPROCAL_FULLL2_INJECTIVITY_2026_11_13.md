# P3-AUX-RAD-C2A R1 — prospective true original reciprocal L² injectivity

**Date:** 2026-11-13 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Baseline SHA:** `fb8093b2145d0467782ce2f055f350d91805fe67`. **Branch:** `integration/bfss-unified-research-20261108`.

## Falsifiable exact theorem

For every positive `ε`, prove `Function.Injective (originalReciprocalFullL2CLM hε)` on the exact original `FullL2 2`. Accepted source R0A `originalRadialWeight_complex_mul_inv` provides pointwise cancellation; R0B1 defines `originalReciprocalField ε x`; accepted G0B0 provides the actual a.e. operator representative. The original R0B2A CLM is bounded; its pointwise inverse need not be bounded on all L².

## Prespecified test

Cold compile `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC2AOriginalReciprocalFullL2Injectivity.lean` and independent original Fock consumer `lean/diagnostics/BFSSP3AuxRADC2AOriginalReciprocalFullL2InjectivityIndependentConsumer.lean` with pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` and frozen original sources via `.github/workflows/bfss-p3-aux-rad-c2a-original-reciprocal-full-l2-injectivity-strict.yml`. The only root is `FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity.originalReciprocalFullL2CLM_injective`; allow `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`. Obtain first causal failure if red, or exact tested SHA and artifact receipt if green.

## Scope and next gate

No proof of surjectivity, bounded inverse, sixteen-output `PiLp` action, weighted charge, zero regulator or any spectral bound. If R1 succeeds, construct RAD-C2B by `ContinuousLinearMap.piMap` conjugated with the original AY `originalMinimalHilbertOutputEquiv` and separately verify its coordinate action and injectivity. Original M5BF0 physical Hamiltonian unchanged; G0B3 remains accepted independently.
