# P3-AUX-RAD-C3D-A R1 — original compact-core reciprocal range STRICT GREEN ACCEPTANCE

**Date:** 2026-11-13 Pacific (run finished 2026-11-14T07:58:01Z). **Classification:** LEAN_QUALIFIED ORIGINAL CORE FullL2 RANGE ONLY.

## Strict qualification receipt

- [Run #43572123886](https://github.com/etblink/math/actions/runs/43572123886) attempt 1, exact tested commit `1166eb9f65ec7e23aea702011c99ea9d83871f35`, completed success, job `132378569838`.
- Native source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.lean` blob `16be28f3b526fc08759980bd1dbffba6522e2279`.
- Independent genuine `Boson 2`, `Fermion 2`, `SmoothCore 2`, `FullL2 2` consumer `lean/diagnostics/BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitnessIndependentConsumer.lean` blob `21a9af38548c4ed2265e8922598124b3a781f9bf`.
- Strict workflow `.github/workflows/bfss-p3-aux-rad-c3da-original-weighted-core-full-l2-range-strict.yml` blob `51f365ae916a1245aa0a5fd87be2b2678894a419`.
- Preflight of immutable original Core, R0A and G0B0 donor bytes, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS. Cold source compile: PASS. Independent original Fock consumer: PASS. Five-root standard allowed-axiom audit: PASS.
- Exact roots: `FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalWeightedCoreField_continuous`, `FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalWeightedCoreField_hasCompactSupport`, `FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalWeightedCoreFieldL2`, `FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalReciprocalFullL2CLM_core_witness`, `FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalCoreToL2_mem_reciprocalRange`. Source and consumer roots require only `[propext, Classical.choice, Quot.sound]`, and no `sorryAx`.
- Strict marker `BFSS_P3_AUX_RAD_C3DA_ORIGINAL_WEIGHTED_CORE_RANGE_STRICT_GREEN`.
- [Evidence artifact #14105123313](https://github.com/etblink/math/actions/runs/43572123886/artifacts/14105123313), 7,674 bytes, published digest `sha256:8787c7a2deea45391211c1f50ae907c652b686daa7ef40bc0128a3344c9194ec`; job logs/metadata inspected, ZIP not independently downloaded/rehashed.
- [Roadmap consistency #43572123848](https://github.com/etblink/math/actions/runs/43572123848) passed at same tested commit.

## Precisely proved

For each `ε>0` and genuine original compactly supported Fock-valued `g:SmoothCore 2`, define `vε=[x↦(originalRadialWeight ε x:ℂ)•g x] : FullL2 2`. The source proves continuity and compact support of this field, hence actual original `FullL2 2` membership, and cancellation

`originalReciprocalFullL2CLM hε (originalWeightedCoreFieldL2 ε g) = coreToL2 g`.

The range conclusion `coreToL2 g ∈ LinearMap.range Bε.toLinearMap` is exact. It is not a global bounded inverse or full-range surjectivity.

## Next/source safety

The accepted original RAD-C3 `Sε` graph is closed on the true original physical input and genuine AY sixteen-output `PiLp`, but density is separate. The next **RAD-C3D-B** needs to instantiate this witness on all sixteen genuine `M.charge α f.val : SmoothCore 2`, assemble `zε : PiLp 2 (fun _ : SpinIndex => FullL2 2)` via original AY `J`, prove `B16ε zε=J.symm(M.chargeVector f.val)`, and show the exact original invariant smooth-core input lies in `Sε.domain` by original AY and RAD-C3 graph membership. Then **RAD-C3D-C** can use already proved original D2B10C Haar density; no stronger conclusion is imported.

Not proved by this gate: actual physical weighted-domain inclusion, its density, global weighted multiplication on all original `FullL2`, maximal domain equality, regulator limit, Hamiltonian quadratic form, spectral Hardy inequality, auxiliary gap, or BFSS mass gap. TD-C1A full48 remains RED_UNQUALIFIED and original M5BF0 remains accepted.
