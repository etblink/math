# K1D14 — exact kernel of original Spin48 linear representation

## Independent owner acceptance — 2026-10-28 UTC

**CURRENT STATUS: ACCEPTED — 61 scoped contributor modules / 73 selected declaration roots.** [Strict run #40639080529](https://github.com/etblink/math/actions/runs/40639080529), job `122652742710`, attempt 1, terminal `completed/success`, exact tested SHA [`82ee5ab336bb95dc423265d704c535cac37500fd`](https://github.com/etblink/math/commit/82ee5ab336bb95dc423265d704c535cac37500fd). All **70 accepted ancestor roots** independently recompiled, followed by three K1D14 roots. Terminal marker: `FCP_K1D14_SOURCE_SPIN48_GL_KERNEL_STRICT_PASS modules=1 roots=3`. All new theorem axiom reports contain only `propext`, `Classical.choice`, `Quot.sound`; no Lean source warnings/errors or `sorryAx`. [Immutable compiler/root-type artifact #12795595612](https://github.com/etblink/math/actions/runs/40639080529/artifacts/12795595612) preserves evidence.

**Precisely proved:** the actual Mathlib `MonoidHom.ker` of the accepted source-defined `spinGroup source48Quadratic →* (Source48Vector ≃ₗ[ℝ] Source48Vector)` homomorphism equals the two-element set `{1, originalSourceNegativeCentral}` *in the genuine source Spin group*. Both elements are distinct, and the homomorphism is not injective. This upgrades K1D11 pointwise-fixer equality to the exact group-homomorphism kernel, without changing the representation.

**Not yet qualified:** source quadratic-form preservation, orthogonal or special-orthogonal target construction, image surjectivity, a topological covering, global Spin(9) lift, and BFSS spectral claims. An exact two-sign kernel by itself is not proof of surjectivity or covering.

**Negative evidence preserved:** Original [Gate 1 red #40637439516](https://github.com/etblink/math/actions/runs/40637439516), job `122647544839`, passed the 70 ancestors but could not simplify `s ∈ (↑ρ.ker : Set _)` to `ρ s = 1`; it emitted `sorryAx` for the second new root. The pinned Mathlib `SetLike.mem_coe` correction preserved theorem statements, the old failure and compiler logs are retained as evidence. The historical candidate and red sections below are archived status.

### Archived candidate and failure record


## Gate 1 failure, negative knowledge, and candidate repair (2026-10-28 UTC)

**Gate 1 RED, no new roots accepted.** [GitHub Actions run #40637439516](https://github.com/etblink/math/actions/runs/40637439516), job `122647544839`, tested exact SHA `829a5a05b70b89c5d6e7d3d38436eb313305596f`. Exact source and verifier hashes, Lean/Mathlib restoration, and **all 70 accepted ancestor declaration roots** passed. The new K1D14 module failed at original line 56, column 2: the first theorem proves `ρ s = 1 ↔ s = 1 ∨ s = originalSourceNegativeCentral`, but the equality of sets expects `s ∈ (↑ρ.ker : Set _) ↔ s = 1 ∨ s = originalSourceNegativeCentral`. The attempted `simpa only [MonoidHom.mem_ker, ...]` did not discharge the additional `SetLike.mem_coe` wrapper. The second theorem emitted `sorryAx` and must not be accepted; first and third root axiom reports alone are not acceptance. [Failed-run artifact #12794353662](https://github.com/etblink/math/actions/runs/40637439516/artifacts/12794353662) and complete original compiler/job logs are preserved.

**Bounded Gate 2 candidate repair (not accepted):** Insert `SetLike.mem_coe` into the existing `simpa only` simplifier list before `MonoidHom.mem_ker`. Pinned Mathlib at `d13f23b723b8a846827a245b89c10fc7d3f11612` uses `SetLike.mem_coe` for exact set-level/coerced subgroup membership. This is the sole source change; all three mathematical statements, genuine Spin48→GL48 homomorphism, accepted antecedent source files, axiom policy, and proof architecture remain unchanged. Re-pinned K1D14 Lean source Git blob `3bdca4594e8a00d6597aadad61997af68209f46f`; strict verifier Git blob `9a2ab70de5359e0364d72bc3cb16c291de7fbb81`.

**Fail closed:** The repair requires a *new* completed strict run at its exact new commit with fresh ancestry recompilation, nonempty `.olean`, three exact declaration-level allowed-axiom results, root types and no Lean source warnings/errors. Until then the accepted baseline is frozen at **60 modules / 70 roots**. The broader SO48/surjectivity/covering/Spin9/spectral claims remain unproved.

### Archived initial candidate charter


**STATUS: CANDIDATE, not independent strict qualified.** New owner research branch `research/fcp-k1d14-gl-kernel-20261027` descends from the accepted `research/fcp-k1d13-linear-representation-20261027@ee4bce66dca3a018383b59cb04cd7949fa5d7fcb` documentation checkpoint.

## Accepted mathematical baseline

The qualified source-defined source-vector action is `FCP.BFSSS1V31.sourceSpin48VectorAction` on the exact `Source48Vector := (Fin 24 × Fin 2) → ℝ`, with source form `source48Quadratic`. K1D11 [strict run #40631762187](https://github.com/etblink/math/actions/runs/40631762187) proves pointwise stabilizer exactly `{1, originalSourceNegativeCentral}` and the two elements are genuinely distinct. K1D12 supplies real scalar-linearity and Spin multiplication compatibility. K1D13 [strict run #40636013385](https://github.com/etblink/math/actions/runs/40636013385), job `122643034366`, source-tested SHA `4a401dd606e9cb5a6dc961dd3392610d4a4dde2e`, newly qualifies the **actual homomorphism** `originalSourceSpin48LinearRepresentation : spinGroup source48Quadratic →* (Source48Vector ≃ₗ[ℝ] Source48Vector)`.

**Frozen accepted scope: 60 owner contributor modules and 70 declaration roots**, all with only the permitted `propext`, `Classical.choice`, `Quot.sound` axioms. The K1D13 strict gate preserved compiler/theorem-type evidence as artifact #12793648936.

## Three new proof roots

Candidate module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D14OriginalSpin48LinearRepresentationKernelProbe.lean`, Git blob `de698a90157bcb457dd870d3c1defb90571f49c0`.

1. `originalSourceSpin48LinearRepresentation_eq_one_iff_two_signs`: a genuine Spin48 element maps to the **identity linear equivalence** exactly when it is one of the two genuine elements from K1D11. Prove via equality of the action at each original source real vector, then K1D11's accepted iff, and via `LinearEquiv.ext` for the converse.
2. `originalSourceSpin48LinearRepresentation_ker_eq_two_sign_set`: the *real Mathlib `MonoidHom.ker` subgroup* of this **now constructed** GL-valued homomorphism, viewed as a set, equals `{1, originalSourceNegativeCentral}`. No unconstructed map-kernel proxy.
3. `originalSourceSpin48LinearRepresentation_not_injective`: the map is noninjective since its two distinct kernel elements have the same image. Uses the accepted K1D11 genuine sign-distinctness root.

This is a group-homomorphism kernel theorem, strictly more directly bundled than K1D11's pointwise-fixer statement. It is **not** proof of quadratic preservation, determinant, an SO48 codomain, image surjectivity, double covering, global Spin9 action, or BFSS spectral claims.

## Strict qualification

New workflow `.github/workflows/bfss-kotler-k1d14-source-spin48-gl-kernel-owner-strict.yml`, verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d14.py` (Git blob `3e6aaa0d92c1c6ca1acb7d42eae3d9f7079eff3a`), Lean 4.34.1, exact Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Must independently recompile **70 accepted ancestor declaration roots** and then compile K1D14 warning-as-error, nonempty `.olean`, exact **three** root axiom reports and root types, and preserve all original compiler/verifier logs on success/failure. No source `sorry`, `admit`, unreviewed `axiom`, or `sorryAx`; allowed root axioms only `propext`, `Classical.choice`, and `Quot.sound`. The CI must fail closed on any mismatch.

**New result remains a candidate until independent completed green and full source/axiom inspection.** Only then would the scoped count become **61 modules / 73 declaration roots**. Failed runs and negative knowledge remain part of the authoritative handoff.

## Scope and publication

Source exactness and narrow independent mathematical obligations override a desire for CI greens. Keep owner `main` and all accepted research checkpoints unchanged. No upstream PR to `mathcommunity/oai-math-revised` is authorized: a future PR needs separate explicit permission, minimal reviewable dependency bundle from current upstream `main`, requalification, and appropriate automated-assistance disclosure.

**After independent qualification:** investigate source quadratic preservation via Clifford generator squares and the accepted K1D10 Clifford-star conjugation. Then prove determinant +1 separately before introducing an SO48-valued action. The existing kernel does not establish surjectivity or a topological covering.
