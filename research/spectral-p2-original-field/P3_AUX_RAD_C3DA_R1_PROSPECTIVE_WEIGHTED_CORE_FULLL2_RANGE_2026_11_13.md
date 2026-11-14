# P3-AUX-RAD-C3D-A R1 — prospective original compact-core FullL2 reciprocal range

**Date:** 2026-11-13 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Parent:** `025b123ef353a3bcbc65c677b5ea44f5abce90e9`.

## Falsifiable objective

In the genuine BFSS `Boson 2` configuration space with original Fock `Fermion 2` fiber, each original `g:SmoothCore 2` is compactly supported and continuous. The scalar `wε(x)=originalRadialWeight ε x` is continuous. Therefore `x↦(wε(x):ℂ) • g x` has compact support and defines an original `FullL2 2` class, even though the multiplier `wε` is not globally bounded.

For `ε>0`, native R0A `originalRadialWeight_complex_mul_inv` and accepted G0B0 `originalReciprocalFullL2CLM_ae_originalField` identify `Bε[wεg]=coreToL2 g`. Thus `coreToL2 g` is in the precise **range** of original bounded reciprocal `Bε`; this is not surjectivity on all original Fock L².

## Reproducibility

Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.lean`, native independent consumer `lean/diagnostics/BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitnessIndependentConsumer.lean`, strict workflow `.github/workflows/bfss-p3-aux-rad-c3da-original-weighted-core-full-l2-range-strict.yml`. Exact five root order: `originalWeightedCoreField_continuous`, `originalWeightedCoreField_hasCompactSupport`, `originalWeightedCoreFieldL2`, `originalReciprocalFullL2CLM_core_witness`, `originalCoreToL2_mem_reciprocalRange`. Source-aware pins: Core `9882359c...`, R0A `a67f8740...`, G0B0 `670cc600...`, and accepted RAD-C3 `6aff6416...`. Toolchain Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Strict cold compile, native original `FullL2 2` consumer, axiom allowlist `[propext, Classical.choice, Quot.sound]`, archived evidence. See [forward-research plan](P3_AUX_RAD_C3D_FORWARD_RESEARCH_ORIGINAL_WEIGHTED_DOMAIN_DENSITY_2026_11_13.md).

## Next and exclusions

If GREEN, C3D-B builds `B16ε` weighted witness for every original sixteen-charge smooth-core output and proves source invariant smooth-core inclusion in **already accepted** RAD-C3 physical weighted graph. Then C3D-C invokes the already accepted original D2B10C Haar/core density theorem. Each needs a separate Lean qualification. No globally bounded inverse, maximal-weighted domain, zero-regulator claim, auxiliary Hamiltonian, Hardy inequality or spectral gap.
