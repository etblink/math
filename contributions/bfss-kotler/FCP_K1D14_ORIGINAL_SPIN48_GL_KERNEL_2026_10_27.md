# K1D14 — exact kernel of original Spin48 linear representation

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
