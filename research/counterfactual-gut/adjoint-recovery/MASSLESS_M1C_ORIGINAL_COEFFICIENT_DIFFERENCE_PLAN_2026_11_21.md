# MASSLESS-M1c — source-exact coefficient subtraction and paired SU(2) consumer

**Date:** 2026-11-21 (America/Los_Angeles). **Status on authoring:** proposed isolated Lean source/consumer gate; not strict qualified.

## Scientific objective and accepted donors

**Original BFSS source** `AlgebraData.fermionCoefficient x` (frozen `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`) includes the **mass-deformation** term `(3/2) massT` and the massless boson-dependent interaction. It is essential not to silently identify the full deformed coefficient with the original massless physical field.

Accepted source chain:
- M0 `sourceBracketCoefficient` exact original real matrix: [GREEN #44988662078](https://github.com/etblink/math/actions/runs/44988662078), blob `948671c8173dd69bba380a1b08fd46c7b63efb57`.
- M1a `masslessSourceFrequency M x` equals the negative source bracket (definition): [GREEN #44990226259](https://github.com/etblink/math/actions/runs/44990226259), blob `93e11616d37a3bfac44320e7518027d8883c6072`.
- M1b exact massless **real-linear field** identity plus literal original paired SU2: [GREEN #44990981706](https://github.com/etblink/math/actions/runs/44990981706), blob `fc2994f932cc13bbade9735f74a97390a4ea224d`; artifact #14742466124 digest `sha256:4d9da83a6155138acf5a1d19401ab7e7c7cf4389e6a61497b94580829ad6269b`.

M1c is **source-bookkeeping** that identifies M1a's real massless interaction coefficient with the existing original source mass-deformed coefficient after **subtracting its value at zero bosons**:

\[
\boxed{K_{1,0}(x)=F(x)-F(0).}
\]

This statement is mathematically elementary but eliminates an ambiguity between `fermionCoefficient` and the true massless interaction. A related statement elaborated as the first theorem of the failed historical D1F source, but D1F's downstream theorems failed and must **never** be imported or retroactively promoted. Re-prove this one exact equality in an isolated accepted-source module, without its failed imports.

## Exact two roots

New `BFSSMasslessM1cOriginalCoefficientDifferenceConsumer.lean` imports only the **accepted** M1b module. It proves

```lean
theorem originalMasslessFrequency_eq_sourceDifference {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    FCP.BFSSMasslessM1a.masslessSourceFrequency M x =
      M.fermionCoefficient x - M.fermionCoefficient (0 : Boson N) := by
  ext r s
  simp [FCP.BFSSMasslessM1a.masslessSourceFrequency,
    FCP.BFSSMasslessM0.sourceBracketCoefficient,
    AlgebraData.fermionCoefficient]
```

Independent literal SU2 paired consumer: same statement specializing to existing `FCP.BFSSSU2GaugeG1A.pairedAlgebraData : AlgebraData 2`; use direct *namespaced theorem* `originalMasslessFrequency_eq_sourceDifference pairedAlgebraData x`. No replacement Fock/matrix carriers, original source edits, new axioms, speculative physical model, physics proof by definitional reduction, `module`, or `ring` tactic. If the original source uses non-definitional coercions, diagnose original compiler's first causal goal before one bounded proof-only correction.

## Strict qualification and stop rules

One path-scoped original source CI workflow freezes original Core/FermionFrequency/FrequencyContraction/FermionQuantization and **exact accepted** M0, M1a, M1b and original paired SU2 blobs; pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, native source build and standalone strict warning-as-error compile, exactly two `#print axioms` roots with allowed `propext/Classical.choice/Quot.sound` only, required `BFSS_MASSLESS_M1C_ORIGINAL_COEFFICIENT_DIFFERENCE_STRICT_GREEN` sentinel and unconditional original artifact (preflight/cache/native/strict/environment/tested-SHA). Download original ZIP, independently recompute SHA-256 and verify all six evidence files + exact tested SHA before promoting.

One source/strict RED: preserve first causal diagnostic and archive; at most **one** justified source-proof-only repair. Second RED: STOP and record as unqualified, not a physical impossibility. Do not edit frozen D1F, D1S4, original BFSS, current accepted source or CI safeguards.

## Physical boundary after M1c

A prospective strict M1c GREEN would close the **identification** `V_F(1,0,x) = [quantizeFrequency (fermionCoefficient x - fermionCoefficient 0)]_ℝ` on original Fock fiber at each bosonic x by substitution in M1b. It does **not** prove a source-typed combined theorem unless a later consumer checks it, and more importantly does not prove the unbounded (x)-dependent multiplication operator has its maximal full bosonic (L²) domain, is self-adjoint there, preserves Gauss-invariant physical states, or yields an energy/spectral gap or normalizable Hopfion. After M1c, **stop algebraic gate proliferation** and prioritize original bosonic `FullL2` multiplier/domain/gauge-form diagnostics using existing M2/M3 and original source rather than another trivial finite-Fock property.


## Original candidate implementation and strict R1 launch

Candidate original source [`cfc0d473285b6af304077c3b55ecb31167e9a4cc`](https://github.com/etblink/math/commit/cfc0d473285b6af304077c3b55ecb31167e9a4cc) directly imports **only accepted M1b**, contains one original generic real `FrequencyMatrix N` coefficient subtraction theorem and its independent literal original paired SU(2) consumer. New strict path-scoped workflow `.github/workflows/bfss-massless-m1c-original-coefficient-difference-strict.yml` committed at exact tested SHA `fde9366580b6beace7c7b80310dadc31b7885706`, original [strict R1 #44991923266](https://github.com/etblink/math/actions/runs/44991923266), **QUEUED/PENDING** at launch. Frozen original BFSS and accepted M0/M1a/M1b/paired SU2 source, pinned Lean 4.34.1/Mathlib, warning-as-error/native build and exactly two original permitted axiom reports, required `BFSS_MASSLESS_M1C_ORIGINAL_COEFFICIENT_DIFFERENCE_STRICT_GREEN` and original archive must be independently verified before M1c acceptance. No mathematical or physical qualification is claimed at launch.


## Original strict R1 independently accepted GREEN

[Run #44991923266](https://github.com/etblink/math/actions/runs/44991923266), exact tested SHA `fde9366580b6beace7c7b80310dadc31b7885706`, job `137114632173`, source blob `749992dec67bf4bca28ab957890191aeb8c78fb8`. Frozen original BFSS Core/FermionFrequency/FrequencyContraction/FermionQuantization, accepted M0/M1a/M1b and paired SU2 exact source pins PASS; pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS; original 8,997 native jobs PASS; strict standalone warning-as-error source recompile PASS; both `FCP.BFSSMasslessM1c.originalMasslessFrequency_eq_sourceDifference` and `FCP.BFSSMasslessM1c.pairedOriginalMasslessFrequency_eq_sourceDifference` depend precisely on `[propext, Classical.choice, Quot.sound]`, no `sorryAx`; sentinel `BFSS_MASSLESS_M1C_ORIGINAL_COEFFICIENT_DIFFERENCE_STRICT_GREEN` PASS. Original [artifact #14742706199](https://github.com/etblink/math/actions/runs/44991923266/artifacts/14742706199), 8,375 bytes and six files, independently recomputed SHA-256 `441c50f313a1c68d3aa846b60fd71aec25a9b5d91f42f15a2dfd984c70b95cdd`, archived tested SHA/preflight/strict reports matched. **M1c accepted**; historical D1F original failures remain frozen, no full physical domain or spectral claim. Next action: source-only operator-domain/gauge audit, not a reflexive new finite-Fock strict gate.
