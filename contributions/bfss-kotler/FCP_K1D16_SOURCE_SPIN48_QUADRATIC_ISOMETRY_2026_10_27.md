# K1D16 — original-source Spin(48) quadratic isometry packaging

## Gate 1 red — elaboration-depth qualification boundary — 2026-10-28 UTC

**K1D16 NOT ACCEPTED. The frozen accepted baseline remains 62 scoped modules / 75 selected declaration roots.** [Original strict run #40646507049](https://github.com/etblink/math/actions/runs/40646507049), job `122676448850`, terminal `completed/failure`, source-tested exact SHA [`0ffc3ed4fb3a63dfe1bf200d234f20b24d17b8d5`](https://github.com/etblink/math/commit/0ffc3ed4fb3a63dfe1bf200d234f20b24d17b8d5). Checkout and exact source/verifier hash checks passed, pinned Lean/Mathlib restoration passed, and **all 75 accepted ancestor declaration roots independently recompiled and qualified**.

**Original compiler failure:** In the new K1D16 module, errors at line 28:18 (constructing the `Q.IsometryEquiv Q` definition) and line 33:10 (its `map_app'` field) reported `maximum recursion depth has been reached`. This blocked creating the new isometry definition. Dependent uses at lines 39, 48, and 52 consequently reported `unknownIdentifier` or `unknown constant`. Both theorem axiom reports subsequently contained `sorryAx` and are rejected; no new mathematical root is qualified. [Preserved failed-run artifact #12798188055](https://github.com/etblink/math/actions/runs/40646507049/artifacts/12798188055) and original job/compiler logs are the authoritative negative evidence.

**Bounded Gate 2 candidate, unqualified:** Pinned Mathlib's actual `QuadraticMap.IsometryEquiv` is a structure extending `LinearEquiv` with `map_app'`; accepted K1D13 supplies the exact underlying real-linear equivalence and accepted K1D15 supplies the source quadratic preservation. To test whether the failure is only the *elaborator's finite recursion budget* traversing these large typeclass/48-label source structures, retain **all three K1D16 definition/theorem declarations and proofs literally unchanged**, adding only local file `set_option maxRecDepth 4096` with an explanatory comment. Do not alter source action, original quadratic form, use a surrogate orthogonal map, increase permitted axioms, or disable warning-as-error.

Gate 2 source Git blob `6367c33e426cfda4269a34bf1fb8a71dec7fb8bc`; repinned qualifier Git blob `7ead29ed11970cde3eb1a30de1830319a49f4fd5`. The strict workflow pins both and still freshly requalifies all **75 accepted ancestors** then all three K1D16 roots, requires nonempty olean and exact root-type/axiom results, and preserves compiler and failure artifacts. If Gate 2 fails again, classify the *new* compiler diagnostics and prefer explicit field/type bridges over unbounded recursion-limit escalation. Do not mark K1D16 accepted until an independently verified completed green.

**Mathematical scope unchanged:** This is original Spin48 *quadratic isometry bundling*, not determinant +1, SO48 representation, surjectivity, a covering map, global Spin9 invariance or BFSS spectral existence.

### Archived original candidate charter


**STATUS: CANDIDATE — NO INDEPENDENT NEW STRICT COMPILER QUALIFICATION YET.** Owner research branch `research/fcp-k1d16-source-isometry-20261027` is a single-commit descendant of the accepted K1D15 checkpoint `research/fcp-k1d15-source-quadratic-20261027@736397c5ff5fa24140a0e45410c3e36d91716945`.

## Accepted mathematical baseline

[Strict K1D15 run #40644331895](https://github.com/etblink/math/actions/runs/40644331895), job `122669506115`, succeeded on mathematical SHA `b2d10d61420110341a640badf2f1c9543577d264`. It freshly requalified all 73 accepted ancestors and both new K1D15 roots, with no Lean source warnings/errors or `sorryAx`, only `propext`, `Classical.choice`, `Quot.sound`. [Immutable evidence artifact #12797855045](https://github.com/etblink/math/actions/runs/40644331895/artifacts/12797855045) holds compiler/root-type logs. **Accepted baseline: 62 scoped contributor modules, 75 qualified declaration roots.**

K1D13 already provides the genuine source-defined `spinGroup source48Quadratic →* (Source48Vector ≃ₗ[ℝ] Source48Vector)`, directly induced by S1V31's original Clifford-conjugation source action. K1D14 independently proves exact kernel `{1, originalSourceNegativeCentral}` for that actual GL homomorphism. K1D15 now proves `source48Quadratic (sourceSpin48VectorAction s v) = source48Quadratic v` for every genuine Spin48 member and every vector of the exact source real 48-label type `Source48Vector := (Fin 24 × Fin 2) → ℝ`. No surrogate quadratic form or action is permitted.

## Candidate exact-source closure

New file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D16OriginalSpin48QuadraticIsometryProbe.lean`, Git blob `0efd0562bbb22ac1b137b104a4de186b8433fd7f`. Explicitly imports pinned `Mathlib.LinearAlgebra.QuadraticForm.IsometryEquiv` from exact Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`, where `QuadraticMap.IsometryEquiv` extends `LinearEquiv` with the actual `map_app'` quadratic preservation field.

1. `FCP.BFSSS1V52K1D16.originalSourceSpin48QuadraticIsometry`: a genuinely bundled `source48Quadratic.IsometryEquiv source48Quadratic`, whose `toLinearEquiv` is the exact accepted K1D13 original source linear equivalence, and whose `map_app'` is exactly K1D15 original-source quadratic preservation.
2. `originalSourceSpin48QuadraticIsometry_underlyingLinearEquiv`: proves the bundled isometry's underlying linear equivalence equals the exact accepted K1D13 action; no new GL map.
3. `originalSourceSpin48QuadraticIsometry_apply`: confirms pointwise that this isometry acts on every original 48-real source vector as S1V31 original source Clifford-conjugation action.

**These statements do not define or prove a group structure on `Q.IsometryEquiv Q`, nor an SO48-valued group homomorphism, determinant +1, surjectivity, a topological two-sheeted cover, global Spin9 lift, or BFSS spectral existence.** Preserve exact terminology; this is *isometry bundling*, not an orthogonal/special orthogonal covering theorem.

## Strict source and axiom acceptance contract

Workflow `.github/workflows/bfss-kotler-k1d16-source-spin48-isometry-owner-strict.yml`; qualifier `contributions/bfss-kotler/tools/qualify_fcp_k1d16.py` Git blob `6f403d57438d779d319a11ef16b48505d9bc0ee5`. Freeze Lean 4.34.1, Mathlib exact SHA, accepted immutable source/qualifier hashes, root declaration names/types, exact three declaration-level axiom reports and only `propext`, `Classical.choice`, `Quot.sound`. Must requalify **all 75 accepted declaration roots** independently, then compile fresh K1D16 with warning-as-error into nonempty `.olean`, no `sorryAx`, capture compiler and root-type logs with CI success/failure artifact preservation.

**Fail closed:** no new declaration admitted on red/incomplete status, even if other root axioms print correctly. Only an independently verified terminal green on the exact tested SHA permits promotion to **63 modules and 78 roots**. All failed and positive compiler evidence remains retained as negative/positive knowledge.

## Forward proof order

After a verified green, investigate exact source **determinant +1** using existing qualified orientation/determinant ancestors only where applicable, before asserting an SO48 codomain. Then prove image/surjectivity and covering hypotheses as separate source-exact obligations. Kernel equality alone does not justify any of them. Upstream `mathcommunity/oai-math-revised` PR, owner `main`, and prior acceptance branches remain untouched; upstream publication requires a separate explicit owner authorization and independent requalification.
