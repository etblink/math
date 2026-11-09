# BFSS OP3-B1 — original Spin(9) paired-48 action preserves source48Quadratic

**Date:** 2026-11-09  
**Repository / branch:** `etblink/math` / `integration/bfss-unified-research-20261108`  
**Status:** OP3-A2 strictly qualified; OP3-B1 is an **unqualified candidate until its own exact cold strict gate passes**.  
**Methodology:** [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md), [flexible roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md).  
**No replacement model, new axioms, source normalization changes or spectral conclusions.**

## 1. OP3-A2 — exact accepted evidence

[Run #42671945161](https://github.com/etblink/math/actions/runs/42671945161), attempt 1, exact tested commit `b9642018a71ad1f0eed87ea42560a473f2b32036`, job `129348626519`: **SUCCESS**. All 17 exact source/consumer Git blob preflight pins passed; restored Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold built M2/M3I and OP3-A1/OP3-A2 ancestry; separately compiled source and independent consumer; exact two-root axiom audit **passed in both**. Only `propext`, `Classical.choice`, `Quot.sound` were allowed; no `sorryAx`/unexpected compiler errors. Receipt `OP3A2_COMPLEX_CLIFFORD_SOURCE_AXIS_INDEPENDENT_STRICT_PASS`. Artifact [#13698204507](https://github.com/etblink/math/actions/runs/42671945161/artifacts/13698204507), runner-reported ZIP SHA256 `dac90c7cc57fbe3fa83dd06bff6d9dc4e738753d5f54757092ccb8cafb97be6c` (not independently downloaded here).

Exact accepted theorem roots:
- `FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_generator_eq_donor`: on **any original real 48-source vector** `v`, the already accepted M3I complexified Clifford `AlgEquiv` sends `CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (1 ⊗ₜ[ℝ] v)` to the preexisting M2 donor `originalFockGammaRealLinear v`. **This is not a theorem of full active gamma map agreement on arbitrary v.**
- `FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_sourceAxis_eq_activeGamma`: on the **actual** `sourceBlockColorAxis (j,s) A`, that M3I image is the active `sourceNormalizedGamma (sourceBlockColorLabel (j,s) A)`, with exact positive `√2` of the delta-one Majorana and original paired G1A label.

These results close the *bounded OP3-A original generator interface* while leaving OP3-B through E, F1F production equality, star/center/continuity, gauge/physical domain and spectrum open.

## 2. OP3-B read-only source inventory and semantic contract

The intended next transition is **exact original spinGroup source9Quadratic to orthogonal action on source48Vector**, preserving *the same* real quadratic form already used by the M3I complexified Clifford algebra.

| Interface | Exact source module / verified Git blob | What it contains |
| --- | --- | --- |
| Original real vector and quadratic `Source48Label = Fin 24 × Fin 2`, `Source48Vector = Source48Label → ℝ` | `SU2BFSSPhysicalDomainS1V0StandaloneOrthogonalGeometryProbe.lean`, `65db1f822b86bfbf400957a0aaa94784d6cb7a39` | `source48Quadratic := QuadraticMap.weightedSumSquares ℝ (fun _ => 1)`. No new quadratic form is needed. |
| Exact identity to Euclidean dot product | `SU2BFSSSource48QuadraticUnitAxesProbe.lean`, `de7cf67d2945718a1da98d05a14e1b0d7edcff4a` | `FCP.BFSSSource48QuadraticUnitAxes.source48Quadratic_eq_dot`: `source48Quadratic v = dotProduct v v` on all original source vectors. |
| Historical 48-indexed orthogonal map | `SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean`, `9dc5713dfea7c40d8c9f58088392e144c3c28517` | `source9SpinOriginalPaired48OrthogonalHom : spinGroup source9Quadratic →* Matrix.orthogonalGroup Source48Label ℝ` — exact original G1A paired-index action, identity on color and 16-spin gamma action. |
| Proven determinant-one original source action | `SU2BFSSPairedSpin9V10HF10QSourceSpinOrientationDetOneProbe.lean`, `948712b83647829ab5902dfa88979f44747af1f3`; `SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean`, `75a679f2a1435d747e219617feea266b4508c53d` | `source9SpinOriginalPaired48SpecialOrthogonalHom : spinGroup source9Quadratic →* Matrix.specialOrthogonalGroup Source48Label ℝ` and its exact underlying original O(48)-matrix identity. Reuse; no group map reconstruction. |
| Qualified original complex Clifford/Fock axis interface | `OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean`, `a9db27fc28379b35ca85515d733cc0bc43376592` | Already green #42671945161; use in later Clifford automorphism generator covariance. Do not infer continuity/star from M3I `AlgEquiv`. |

**Source-contract caution:** Existing F10BQ `source9SpinVectorQuadraticIsometryEquiv` proves the **nine-vector** `source9Quadratic` isometry. This is a different carrier from the **paired 48-vector** `source48Quadratic` needed by the complex Clifford/Fock algebra. Do not conflate the two. The OP3-B1 target uses the original **48-label** source exact matrix.

## 3. Two sharply bounded new declarations

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3BOriginalSource48QuadraticIsometryBridge.lean`:

1. **Small original-carrier matrix identity** `FCP.BFSSOP3BOriginalSource48Quadratic.orthogonal_matrix_preserves_source48Quadratic`: for `A : Matrix Source48Label Source48Label ℝ` satisfying `A ∈ Matrix.orthogonalGroup Source48Label ℝ` and every `v : Source48Vector`, prove `source48Quadratic (A.mulVec v) = source48Quadratic v`. Use the imported `source48Quadratic_eq_dot` and Mathlib `Matrix.mem_orthogonalGroup_iff'` (`Aᵀ A=I`), `Matrix.dotProduct_transpose_mulVec`, `Matrix.mulVec_mulVec`, `Matrix.one_mulVec`. Work only in the 48-real matrix carrier, not inside original Fock operator equalities.
2. **Exact original Spin action** `FCP.BFSSOP3BOriginalSource48Quadratic.source9SpinOriginalPaired48_preserves_source48Quadratic`: specialize theorem 1 to the *existing* F10R SO(48) homomorphism, use its exact `source9SpinOriginalPaired48SpecialOrthogonalHom_apply` to identify the original V10F O(48) matrix, and use the actual V10F group membership proof. Preserve group orientation and source label packing.

Separate independent consumer `lean/diagnostics/BFSSOP3BOriginalSource48QuadraticIndependentAudit.lean` checks both theorem statements at the original `Source48Label` and `Source48Vector`, and original `spinGroup source9Quadratic`.

**Scope strictly limited:** This is source-48 **quadratic preservation**. It does not itself package a source `QuadraticForm.IsometryEquiv` group homomorphism, supply Clifford universal automorphisms, transport through M3I, implement the original Fock/unitary Spin action, check star/center/continuity/gauge, or prove positive point spectrum.

## 4. Strict gate and alternatives

Workflow `.github/workflows/bfss-op3b-original-source48-quadratic-strict.yml` pins **11 exact source/consumer Git blobs**, original core and exact original source-48 F10R and source48Quadratic_eq_dot parents, plus accepted OP3-A2; Lean 4.34.1 and original Mathlib revision unchanged. Cold source builds, distinct exact source and independent `#print axioms` checks of two theorem roots, fail closed on `sorryAx`, compiler errors, unexpected warnings or axioms outside `propext`, `Classical.choice`, `Quot.sound`; retain tested commit, logs, source pins and evidence receipt. Any CI red is NOT mathematically accepted.

If the source exact matrix lemma fails on a Mathlib lemma/API mismatch, inspect the exact pinned signatures and preserve its first causal compiler error; try one smaller lemma using `dotProduct` and `Aᵀ A = I`, **not** a new 48D orthogonal source or alternative quadratic. If the matrix lemma passes and specialization fails, isolate F10R SO-to-V10F O matrix coercion only. After two same-mechanism failures, **STOP** and redesign based on actual evidence. No increase in recursion/heartbeat or weakening of source normalization.

**Next accepted milestone if green:** Evaluate and package the exact original quadratic isometry for the source action, as required by the Clifford functorial automorphism in OP3-C. Before transport through M3I, independently prove source generator covariance and later **star preservation, central parity and continuity**; no automatic conclusion from bare `AlgEquiv`.

## 5. Summary of value

The first strict source-compatibility gates OP3-A1/OP3-A2 are now green. OP3-B1 would establish that the **same original source 48-dimensional quadratic form** used in the complexified Clifford/Fock generator construction is preserved by the existing original paired-label Spin(9) action. This is the precise mathematical precondition for mapping the original source Clifford generators by a legitimate quadratic isometry instead of inventing a replacement operator action.

## OP3-B1 strict GREEN #42675821883 — exact original source48 quadratic action qualified

[Run #42675821883](https://github.com/etblink/math/actions/runs/42675821883), attempt 1, tested exact commit `3d2566d472ce4132596bba7f434624da31977707`, job `129356778804`: terminal **SUCCESS**. 11 pinned source/consumer Git blobs, Lean `4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold F10R/OP3-B1 build, separately compiled source and independent consumer **all passed**, with exactly two declaration roots in each of the two axiom audits. Allowed axiom set only `propext`, `Classical.choice`, `Quot.sound`. Exact receipt `OP3B_ORIGINAL_PAIRED_SOURCE48_QUADRATIC_INDEPENDENT_STRICT_PASS`; artifact [#13700432984](https://github.com/etblink/math/actions/runs/42675821883/artifacts/13700432984), runner ZIP SHA256 `96142b9a81d2d52a8b792c43a1678ea289ef157a3509a1697e1c6116091e5450` (not independently downloaded).

Accepted original-source `FCP.BFSSOP3BOriginalSource48Quadratic.orthogonal_matrix_preserves_source48Quadratic` and `FCP.BFSSOP3BOriginalSource48Quadratic.source9SpinOriginalPaired48_preserves_source48Quadratic`: any orthogonal 48-real matrix and the *existing* original paired-label Spin(9) SO(48) representation preserve the **same** source `source48Quadratic` used by M2/M3I. This does not prove a `QuadraticForm.IsometryEquiv` value, Clifford automorphism, operator Spin(9) action, star/topology/center/gauge interface or spectral theorem. Next bounded interface: [OP3-B2 isometry packaging and OP3-C API audit](BFSS_OP3B2_SOURCE48_ISOMETRY_PACKAGING_AND_OP3C_INTERFACE_AUDIT_2026_11_09.md).
