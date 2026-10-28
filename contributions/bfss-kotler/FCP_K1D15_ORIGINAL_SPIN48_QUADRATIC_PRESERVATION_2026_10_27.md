# K1D15 — preservation of the exact original source Spin48 quadratic form

**STATUS: RESEARCH CANDIDATE; NOT STRICT QUALIFIED.** Owner research branch `research/fcp-k1d15-source-quadratic-20261027`, created as a single-commit descendant of the qualified owner `research/fcp-k1d14-gl-kernel-20261027@b29f97c5c499924a3d8674e38042570efd1b0756` acceptance checkpoint.

## Accepted proof ancestry and scope

The independent [K1D14 strict run #40639080529](https://github.com/etblink/math/actions/runs/40639080529), job `122652742710`, tested exact mathematical SHA `82ee5ab336bb95dc423265d704c535cac37500fd`. All 70 antecedent roots and three K1D14 roots passed warning-as-error, source hash validation, verified theorem types, no new axioms beyond `propext`, `Classical.choice`, `Quot.sound`; the immutable result artifact is #12795595612. **Current accepted baseline: 61 contributor modules / 73 declaration roots.**

K1D13 establishes a source-defined real-linear group representation `spinGroup source48Quadratic →* (Source48Vector ≃ₗ[ℝ] Source48Vector)`. K1D14 identifies its **actual Mathlib MonoidHom kernel** as two genuine distinct Spin elements `{1, originalSourceNegativeCentral}`. Neither statement proves that the representation preserves the source quadratic form. We do not treat the GL-level result as an SO48 theorem.

## Next exact-source quadratic theorem

Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D15OriginalSpin48QuadraticPreservationProbe.lean`; pinned Git blob `4f05e3839c2d83a986f6c40f0c6f34813478aa45`.

1. `originalSourceSpin48_scalar_conjugation_fixed`: for every element of the actual original Spin48 subgroup and any real scalar `r`, `(s : CliffordAlgebra Q) * algebraMap ℝ C r * star(s : C) = algebraMap ℝ C r`. Uses pinned Mathlib's `Algebra.commutes` centrality and actual `spinGroup.mul_star_self_of_mem`. This is not a scalar restriction on the Spin element itself.
2. `originalSourceSpin48VectorAction_preserves_sourceQuadratic`: for all genuine source Spin48 elements and source vectors `v`, `source48Quadratic (FCP.BFSSS1V31.sourceSpin48VectorAction s v) = source48Quadratic v`. The proof transports K1D10/S1V31's source-exact Clifford generator conjugation through Mathlib's genuine `ConjAct` multiplication law, `CliffordAlgebra.ι_sq_scalar`, and K1D7's previously qualified faithful original real scalar embedding. The original `Source48Vector := (Fin 24 × Fin 2) → ℝ` and `source48Quadratic` remain unmodified.

**New candidate only.** The proof needs independent compiler confirmation that the actual pinned Mathlib `smul_mul` and `ConjAct` coercion/Clifford star formulas elaborate as expected. A failure is evidence for repair, not evidence of theorem acceptance or mathematical falsehood.

## Strict qualification contract

Owner workflow `.github/workflows/bfss-kotler-k1d15-source-spin48-quadratic-owner-strict.yml` and verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d15.py` (Git blob `79207d6495e918bdebbf7dfad99195437c93c7ba`) pin Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and all accepted original-source and verifier identities. Must independently requalify **all 73 previously accepted declaration roots**, then compile K1D15 with warning-as-error and a nonempty `.olean`, exact two new declaration axiom reports/root types and the permitted axiom list only. Preserve original compiler logs and success/failure evidence.

**Fail closed:** A red/incomplete source-run does not promote any K1D15 theorem; the accepted baseline remains 61 modules / 73 roots until an independent completed green at the exact new source SHA. A full pass would qualify 62 modules / 75 selected roots.

## Exclusions and priorities

No SO48-valued homomorphism, determinant +1, image surjectivity, covering, global Spin9 lift, Fock/index permutation alignment, or BFSS spectral existence follows merely from this quadratic identity. The next priorities after an actual green are to package the source action as a quadratic-form-preserving `LinearEquiv` and separately establish orientation/determinant +1, only then move to SO48. Do not change owner `main`, historical acceptance branches, or open an upstream PR to `mathcommunity/oai-math-revised` without explicit authorization.
