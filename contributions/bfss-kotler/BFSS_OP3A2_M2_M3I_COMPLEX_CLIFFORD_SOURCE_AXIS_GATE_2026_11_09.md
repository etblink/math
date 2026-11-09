# BFSS OP3-A2 — original complex Clifford/Fock generator source-axis gate

**Date:** 2026-11-09  
**Repository / branch:** `etblink/math`, `integration/bfss-unified-research-20261108`  
**Status:** PROPOSED CANDIDATE, **not mathematically accepted until a new strict CI run qualifies**.  
**Starting repository head:** `7b21188f1ca57fd55a326e74add9a0419a8c65c0`  
**Methodology:** [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md) and [living roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md). No original BFSS sources altered.

## 1. Exact predecessor qualification

**OP3-A1 strictly accepted:** [run #42668302044](https://github.com/etblink/math/actions/runs/42668302044) at exact tested commit `94fb83a1d4273a15097653039a4550839a248b0e`, job `129337765937`, terminal **SUCCESS**. Exact 13-file SHA preflight, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold donor/active source, separately compiled independent consumer and all **six axiom reports for three exact theorem roots** passed. Allowed axioms only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` or source compiler errors. Artifact [#13697888809](https://github.com/etblink/math/actions/runs/42668302044/artifacts/13697888809), ZIP SHA256 `8c1c57267dbc52a42052ca68c68412b66bf79cc5e85ac0bd3ec30518411425f5` reported by GitHub runner (not independently downloaded here).

The qualified original-source declarations are:
- `FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_paired_label_eq_active_source_axis`
- `FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_normalized_eq_active_source_axis`
- `FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_real_gamma_eq_active_on_source_axis`

They establish explicit historical-to-active G1A source-label identification, exact original `Fermion 2` gamma normalization (`√2` of the delta-one Majorana) and source-axis evaluations. The prior two reds [#42661987249](https://github.com/etblink/math/actions/runs/42661987249) and [#42665490584](https://github.com/etblink/math/actions/runs/42665490584) remain append-only proof-interface negative knowledge; the eventual green does **not** negate those historical errors.

**M2 source theorem:** `FCP.BFSSS1V52M2.originalComplexCliffordFockAlgHom_generator (v : Source48Vector)`: the actual original complexified Clifford `AlgHom` sends `CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (1 ⊗ₜ[ℝ] v)` to `originalFockGammaRealLinear v`. Existing source Git blob `a5e2f46797b60f196423086a0d52aa7f1f2a14f2`.

**M3I source theorem:** `FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv_apply` identifies the accepted `AlgEquiv` pointwise with that exact M2 `AlgHom`. Existing source Git blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b`. M3H/M3I strict accepted [#42547700192](https://github.com/etblink/math/actions/runs/42547700192), including independently checked original 24-mode Fock algebra equivalence.

**Do not reinvent either theorem.** Stale “unqualified” comments in old source headers are not stronger evidence than their exact successfully qualified declarations. But no imported `AlgEquiv` alone proves that it preserves adjoints/star, continuity, Spin action, center parity, original gauge group or the original Hamiltonian domain.

## 2. Explicit interface ladder and smallest viable statements

Exact carriers:
- `Source48Vector := (Fin 24 × Fin 2) → ℝ`, `source48Quadratic : QuadraticForm ℝ Source48Vector`.
- `CliffordAlgebra (source48Quadratic.baseChange ℂ)` with generator input `1 ⊗ₜ[ℝ] v`.
- Real-linear donor `originalFockGammaRealLinear : Source48Vector →ₗ[ℝ] (Fermion 2 →L[ℂ] Fermion 2)`.
- Active `sourceGammaRealLinear`, `sourceNormalizedGamma`, original `sourceBlockColorAxis`, `sourceBlockColorLabel`, with positive `√2` and exact G1A paired labeling.

Two independently named candidate declarations in `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean`:

1. **General M3I-to-M2 donor generator**, `originalComplexEquiv_generator_eq_donor (v : Source48Vector)`:
   `originalComplexCliffordFockAlgEquiv (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (1 ⊗ₜ[ℝ] v)) = originalFockGammaRealLinear v`.
   Its entire proof is the two already accepted `originalComplexCliffordFockAlgEquiv_apply` and `originalComplexCliffordFockAlgHom_generator` equations in a small `calc` chain. **It makes no assertion about equality with the active gamma map for arbitrary v.**
2. **Actual original source-axis generator**, `originalComplexEquiv_sourceAxis_eq_activeGamma (j : Fin 8) (s : Fin 2) (A : ColorIndex 2)`: the preceding complex Clifford image at `sourceBlockColorAxis (j,s) A` equals precisely `sourceNormalizedGamma (sourceBlockColorLabel (j,s) A)`, with no replacement representation. It combines theorem 1, the accepted OP3-A1 source-axis donor/active gamma map equation and the previously accepted active `sourceGammaRealLinear_axis` identity.

This carefully separates three interfaces: source complex Clifford `AlgEquiv` to original M2 generator, source M2 generator to donor real gamma, and qualified OP3-A1 donor gamma to active source-normalized operator **on the actual axis**. No huge Fock finite sum is unfolded.

## 3. Strict qualification contract and stop rules

The dedicated workflow `.github/workflows/bfss-op3a2-original-complex-clifford-axis-strict.yml` must pin **17 exact original/provenance/new-source Git blobs** (Core; source index; original normalized Fock Majorana; original M2 and M3H/M3I; qualified OP3-A1; new OP3-A2 source and independent consumer). It must verify exact Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold build M3I, OP3-A1 and OP3-A2; separately compile exact source and independent consumer; fail closed on unknown errors, `sorryAx`, source warnings, and any axiom outside `propext`, `Classical.choice`, `Quot.sound`. Require exactly two declaration-root reports in **each** source and independent consumer log; retain tested commit, build diagnostics and receipt, including `global_Spin9_operator_action_qualified=false`.

**On a green:** Admit only the two OP3-A2 statements: on original Clifford source generators the M3I complex algebra equivalence matches M2 donor action, and on actual 48-real source axes that image matches the active normalized Majorana. Move to OP3-B (source Spin(9) action preserving the **actual** source quadratic form) after a fresh interface audit. An all-vector equality of **active gamma maps**, star-preserving operator action, source central parity and gauge-physical spectral results remain separate theorems.

**On a red:** Inspect the first causal error. If base-change tensor elaboration or source Clifford `Q` abbreviation does not match, test only the small M3I-to-M2 root before changing the axis theorem. Do not replace the original Clifford generator, alter positive `√2`, hide differences by `sorry`, increase Lean recursion budgets, or try full-map `simpa` after repeated reduction failures. Preserve the red with exact goal and qualified-parent boundary.

## 4. Project value

This is a **named critical dependency** of the eventual original `Spin(9)` operator action, not another F1F coefficient gadget. If accepted, it supplies an independently checked, source-faithful `M3I → original normalized Majorana` generator interface that a future Clifford automorphism transport can directly consume. It does **not** manufacture the required action or an eigenvalue theorem.
