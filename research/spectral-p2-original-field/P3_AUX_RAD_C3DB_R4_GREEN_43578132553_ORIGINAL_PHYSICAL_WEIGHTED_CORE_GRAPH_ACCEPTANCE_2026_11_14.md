# P3-AUX-RAD-C3D-B R4 — strict GREEN accepted original physical weighted sixteen-charge core

**Date:** 2026-11-14 Pacific. **Classification:** LEAN_QUALIFIED EXACT SOURCE ORIGINAL SU2 PHYSICAL CORE WEIGHTED GRAPH. **Tested SHA:** `d39f29b979276c7018a2abe0f4c2a78abfd3d437`.

## Verified strict evidence

- [Strict #43578132553](https://github.com/etblink/math/actions/runs/43578132553), attempt 1, completed **success** 2026-11-14T09:13:03Z, job `132396793224`, tested commit `d39f29b979276c7018a2abe0f4c2a78abfd3d437`. No conclusions inferred from branch HEAD or administrative check.
- Native source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.lean` pinned blob `623035a7bfd1578b52e7f9364bfd1cd8133f1cbb`; independent original `pairedAlgebraData/pairedGaugeData` source consumer `lean/diagnostics/BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraphIndependentConsumer.lean` pinned blob `f85bddd055a5e6b34a95833749a3e3f900e8029f`; workflow `.github/workflows/bfss-p3-aux-rad-c3db-original-physical-weighted-core-graph-strict.yml` pinned blob `60fce3dbc09aecf1d4b45f86e37033c5cc075e04`.
- Frozen original source donor/toolchain preflight: PASS (`BFSS_P3_AUX_RAD_C3DB_PREFLIGHT_PASS`). Lean **4.34.1**, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, true cold source build PASS, independent original paired SU2 consumer PASS.
- Source and independent consumer exactly four named public roots: `FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCoreOutput`, `FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCoreOutput_reciprocal`, `FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCoreGraph_mem`, `FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCore_mem_domain`.
- Every root `#print axioms` showed **only** `propext`, `Classical.choice`, `Quot.sound`, without `sorryAx`. Strict terminal marker `BFSS_P3_AUX_RAD_C3DB_ORIGINAL_WEIGHTED_CORE_GRAPH_STRICT_GREEN`.
- [Artifact #14107950306](https://github.com/etblink/math/actions/runs/43578132553/artifacts/14107950306), 10,143 bytes; published digest `sha256:97c99a3c0cfb334e362489c4e67e41d2cd02c78f3500468d86c895053adc5fd9` (GitHub-reported, ZIP not independently rehashed).
- [Roadmap consistency #43578132550](https://github.com/etblink/math/actions/runs/43578132550) independently GREEN at same exact candidate SHA (not a mathematical proof receipt).

## Precisely proved

For arbitrary literal `M:AlgebraData 2`, `G:M.GaugeData`, parameter `ε>0`, and original `f:G.invariantCore`, define the genuine original 16-column Hilbert output
`z_{f,ε} = originalMinimalHilbertOutputEquiv.symm (fun α => originalWeightedCoreFieldL2 ε (M.charge α f.val))`.
Then the accepted original `B16ε` satisfies `B16ε z_{f,ε} = WithLp.toLp 2 (M.chargeVector f.val)`, and
`(⟨coreToL2 f.val,f.property⟩, z_{f,ε}) ∈ (originalWeightedPhysicalChargeColumn M G hε).graph`.
Thus the literal original gauge-invariant `SmoothCore` physical input lies in `(originalWeightedPhysicalChargeColumn M G hε).domain`, for all `ε>0`. This is not yet a density claim or maximal weighted field-domain equality.

## Historical R1–R3 REDs preserved, key cause-of-success

- [R1 #43573922855](https://github.com/etblink/math/actions/runs/43573922855) RED unresolved namespace Bε and later `whnf` on source AU core witness; [R2 #43575336639](https://github.com/etblink/math/actions/runs/43575336639) RED `whnf` in typed `hcore := ⟨f,rfl⟩`; [R3 #43576822333](https://github.com/etblink/math/actions/runs/43576822333) RED `whnf` in a **separate helper** still fixed at `AlgebraData 2`.
- The **one-variable R4 change** retained the same helper and `exact ⟨f,rfl⟩`, but used a **symbolic `{N:ℕ} (M:AlgebraData N)`**, as in historically accepted H5E8AZ before applying to original SU2 N=2. The strict green confirms this repair works at current source/toolchain pins. It strongly suggests premature specialization drives the old `whnf` elaboration budget, but no claim of a proven general Lean performance theorem.
- All three RED receipts, exact tested SHAs and raw evidence artifacts remain in the registry. No main modifications, source-model surrogates, changed original charge or extra axiom.

## Successor

`RAD-C3D-C` should now instantiate already accepted original Haar `sourceCoreNormClosure_eq_physical_unconditional M G` and copy accepted H5E8AZ `Subtype.dense_iff`/`closure_mono` proof form, substituting the R4-proved `originalWeightedChargeCore_mem_domain`. This should establish unconditional **Hilbert input-norm** dense `D(Sε)` at N=2, for ε>0. It does not imply smooth core is dense in **Sε graph norm**, or prove spectral Hardy inequality, auxiliary gap, or original BFSS mass gap.
