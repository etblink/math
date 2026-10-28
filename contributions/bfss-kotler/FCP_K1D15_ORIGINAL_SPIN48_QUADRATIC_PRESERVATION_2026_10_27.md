# K1D15 — preservation of the exact original source Spin48 quadratic form

## Gate 2 attempt 2 red — explicitly typed original scalar-equality bridge

**Current research state: K1D15 UNQUALIFIED. Accepted baseline remains 61 modules / 73 declaration roots.**

The unchanged research candidate at [commit `4a2a503f50f1c935dbabb6aa89119be130952508`](https://github.com/etblink/math/commit/4a2a503f50f1c935dbabb6aa89119be130952508) was tested twice in [run #40642452550](https://github.com/etblink/math/actions/runs/40642452550):

- **Attempt 1 red (job `122663475696`)**: source and verifier identity checks passed, pinned Lean 4.34.1 install failed at the distribution TLS endpoint with `[35] SSL connect error`. No ancestor or new K1D15 compilation executed; no compiler artifacts existed.
- **Attempt 2 red (job `122664837060`)**: dependency installation, verified original source pins, and **all 73 accepted ancestor declaration roots passed**. Pinned `smul_mul'` successfully eliminated the first Gate 1 unknown-name error. One exact new compiler error remained at source line 63:8: `maximum recursion depth has been reached` while comparing the local abbreviation `w := sourceSpin48VectorAction s v` with the expanded source action at the terminal `exact hscalar`. The first new scalar-conjugation root emitted only `propext`, `Classical.choice`, `Quot.sound`; the quadratic-preservation root emitted `sorryAx` due to uncompiled proof and **is rejected**. Preserve original immutable artifact [#12796208390](https://github.com/etblink/math/actions/runs/40642452550/artifacts/12796208390), original compiler output and job logs.

**Next candidate Gate 3, still unaccepted:** Refactor only the proof's terminal scalar-injectivity bridge to an explicitly typed intermediate `have hquad : Q w = Q v := by ...` and then `simpa only [w] using hquad`. This isolates `originalSourceClifford_algebraMap_injective` against syntactically matching original-source quadratic terms, and only afterward unfolds the *named local abbreviation*, without unfolding or replacing the source action. Both theorem statements and all original source definitions remain byte-identical. No increase to `maxRecDepth`, weakened warnings, stronger axioms, fake scalar map, or altered quadratic form.

Candidate source Git blob `43d0e626fb4180b78cda93744fd94ca8343189a6`; strict verifier Git blob `b214934433b196dcab632fbb8becd02c8f61e111`. The workflow must requalify 73 independently accepted roots and freshly compile both candidate roots with warning-as-error and exact declaration-level axiom reports, preserving success and failure logs. A new red is data; only a completed green at an exact tested SHA qualifies K1D15. The SO(48) image, determinant, covering, global Spin9, and BFSS spectral claims remain separate obligations.

### Archived earlier Gate 1 and Gate 2 proposal


## Gate 1 red, pinned Mathlib diagnosis, and Gate 2 research repair — 2026-10-28 UTC

**CURRENT STATUS: CANDIDATE — NO K1D15 ACCEPTANCE.** [Owner strict run #40640757502](https://github.com/etblink/math/actions/runs/40640757502), job `122658082345`, tested exact SHA [`1a77ca7b4a859bbb455e2d5df90534f4433eacec`](https://github.com/etblink/math/commit/1a77ca7b4a859bbb455e2d5df90534f4433eacec), concluded `completed/failure`. All **73 previously accepted ancestry declarations recompiled successfully** after exact hash and pinned Lean/Mathlib restore. New module failed the compiler at **line 53:15** (`Unknown identifier smul_mul`) and **line 62:8** (`maximum recursion depth has been reached`). The scalar Clifford conjugation fixedness theorem printed only `propext`, `Classical.choice`, `Quot.sound`; the source quadratic preservation theorem emitted `sorryAx` due to failed elaboration and is NOT accepted. The red evidence artifact [#12795399111](https://github.com/etblink/math/actions/runs/40640757502/artifacts/12795399111) and full job logs are immutable negative knowledge.

**Pinned-source diagnosis:** Mathlib `Mathlib/Algebra/Group/Action/Defs.lean` at exact pinned dependency SHA `d13f23b723b8a846827a245b89c10fc7d3f11612` exports the multiplicative-distributive action lemma as `smul_mul'` (primed). The `ConjAct` action of Clifford units has `MulDistribMulAction`; no unproved algebra-map or pseudo-action is needed.

**Gate 2 candidate repair, not yet qualified:** Replace only `smul_mul` with the pinned `smul_mul'`, and reformulate the *last step* as a tactic-level `apply FCP.BFSSS1V52K1D7.originalSourceClifford_algebraMap_injective` followed by `exact hscalar`, so the accepted exact real scalar injectivity theorem can infer its inputs from the target without first elaborating a very large application. New Lean Git blob `d58f9de2ca5d104940cf887376caeb96acd03b0f`; new strict verifier blob `e725a348b6535f48462c251b6c829aba56f2759b`. **The two theorem statements and exact original source quadratic form are unchanged**, all accepted source identities and allowed axioms remain pinned, and the proof has no new assumptions or increased recursion limits.

**Fail closed:** Fresh independent strict CI must repeat all 73 accepted roots and check both new K1D15 roots before any increase above the current **61 modules / 73 selected roots**. If the recursion failure remains, preserve the new compiler trace and move to a more explicit type bridge; do not disguise it with a `sorry`, postulate, or changed statement. Quadratic preservation, SO48, surjectivity, covering, global Spin9 and BFSS spectra remain unaccepted.

### Archived original charter


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
