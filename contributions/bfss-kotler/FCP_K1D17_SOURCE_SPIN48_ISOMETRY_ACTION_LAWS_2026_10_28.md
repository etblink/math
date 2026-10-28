# K1D17 — actual original Spin48 quadratic-isometry action laws

## Independent owner acceptance — 2026-10-28 UTC

**ACCEPTED: 64 cumulative scoped contributor modules / 81 selected declaration roots.** Independently reviewed [strict run #40649929983](https://github.com/etblink/math/actions/runs/40649929983), job `122687372133`, attempt 1, terminal `completed/success`, exact source-tested SHA [`389ecdcc5a325905d656a36fb961fa949ab03f67`](https://github.com/etblink/math/commit/389ecdcc5a325905d656a36fb961fa949ab03f67). The job passed source-hash/qualifier pin checks, Lean 4.34.1 with Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, all **78 original accepted declaration roots**, and three new K1D17 identity, source multiplication and inverse isometry laws with zero Lean source diagnostics, no `sorryAx`, and only `propext`, `Classical.choice`, `Quot.sound`. Terminal marker: `FCP_K1D17_SOURCE_SPIN48_ISOMETRY_ACTION_LAWS_STRICT_PASS modules=1 roots=3`; full immutable compiler and theorem-type evidence: [artifact #12799875789](https://github.com/etblink/math/actions/runs/40649929983/artifacts/12799875789).

**Precisely accepted:** K1D16's genuine original-source `source48Quadratic.IsometryEquiv source48Quadratic` obeys the identity, composition and inverse laws of the actual `spinGroup source48Quadratic` action, in exact source `Fin 24 × Fin 2 → ℝ` coordinates. No new surrogate action is introduced. Still unproved: determinant +1, an SO48-valued homomorphism, orthogonal image surjectivity, topological cover, global Spin9 lift and BFSS spectra.

**Performance observation:** the green run took approximately **13m58s** elapsed (GitHub timestamps 07:25:01–07:38:59 UTC). The strict work includes fresh Lean/Mathlib restoration, 22 original ancestry files/47 roots, K1D3–K1D4 files/2 roots, K1D5–K1D16 files/29 roots, and K1D17/3 roots. Thus the 81 selected declarations are distributed over **37 distinct compiler-verified source modules**, not 64 modules in this exact gate. The 64-module figure is the broader cumulative qualified-contributor tally and must not be confused with the exact cache closure.

**Owner-directed optimization constraint:** reuse the historical FCP proof cache principles without changing mathematical claims. Cache keys must pin compiler/dependencies, exact original source ancestry, OS and architecture. Restore only source-qualified `.olean` files and verify full root names/types/axioms and provenance before using them. On miss build cold, on invalid receipt fail closed. Fresh future candidate theorem modules must still compile with `-DwarningAsError=true` into nonempty new `.olean`. Distinguish **fresh recompilation** from **cached ancestor audit** honestly. GitHub Actions cache scope is branch-dependent; a sibling research branch is not automatically entitled to another branch's cache. Do not weaken accepted root checks, original source constraints, or axiom whitelist.

### Archived pre-acceptance candidate charter


**STATUS: RESEARCH CANDIDATE — NOT INDEPENDENTLY STRICT QUALIFIED.**

New owner-only research branch `research/fcp-k1d17-isometry-laws-20261028` descends from K1D16 accepted checkpoint `research/fcp-k1d16-source-isometry-20261027@000d7e2a7bfa375081b9b2166ccf5d2ed3d0f010`.

## Accepted ancestry and exact meanings

K1D16 [strict run #40648129024](https://github.com/etblink/math/actions/runs/40648129024), job `122681620228`, exact source-tested SHA `9af0a76360b92ff11c3d4873f863097e72502d76`, independently passed full strict warnings-as-errors and axiom checks for 75 ancestor roots and three new roots. Evidence artifact #12798846858. **Accepted total: 63 scoped contributor modules / 78 declaration roots.** K1D16 constructs a genuine `source48Quadratic.IsometryEquiv source48Quadratic` of the exact original source `Source48Vector := (Fin 24 × Fin 2) → ℝ`, preserving the K1D13 real-linear map and original S1V31 Clifford-conjugation vector action. K1D12 proves the actual source Spin48 group action multiplication; K1D11 proves the identity action; K1D13 makes the source inverse-action relation exact.

## Candidate declarations

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D17OriginalSpin48IsometryActionLawsProbe.lean`; exact Git blob `610325c863e509304b31d8914d9652971cddcd3f`. **No new heartbeat or recursion limit changes.** The proofs use direct `DFunLike.ext` and deliberate field/action-level goal conversions to the *already accepted exact original source* action:

1. `originalSourceSpin48QuadraticIsometry_one`: `originalSourceSpin48QuadraticIsometry 1 = QuadraticMap.IsometryEquiv.refl source48Quadratic`, with the actual Spin identity from K1D11.
2. `originalSourceSpin48QuadraticIsometry_mul`: `isometry(s*t) = (isometry t).trans (isometry s)` with composition explicitly in right-to-left function order, matching accepted K1D12 multiplication.
3. `originalSourceSpin48QuadraticIsometry_inv`: the source isometry induced by `s⁻¹` equals the inverse `IsometryEquiv.symm` of the actual isometry induced by `s`, using K1D13's source inverse map.

The first two proofs reduce only the isometry structure-field wrappers to exact source-action laws. The third tests definitional preservation of K1D13's source inverse action. This stage does **not** introduce a guessed orthogonal representation, an SO48 map, or an unconditional isometry-group surjectivity theorem; even if all pass, the next mathematically independent target is source determinant/orientation +1.

## Updated Project Lead mandatory elaboration procedure

Owner direction on 2026-10-28: **explicit source-exact typed intermediate terms and structure-field bridges FIRST**, then direct pinned declaration/source inspection and narrow local proof refactoring. Raise `maxRecDepth`, `maxHeartbeats`, or tactic budgets **only after demonstrable failure of bridges**, with a bounded module-local limit, recorded evidence, and no theorem/axiom weakening. Explicit `change` tactics should only be used where they genuinely expose a different definitional expression; a no-op `change` was previously rejected by the strict unused-tactic linter in K1D13. K1D16 Gate 2's earlier local `maxRecDepth 4096` is accepted historical proof evidence, **not** a template for the default future repair order.

This new K1D17 source starts with no raised elaboration limits. If any `change` turns out to be a no-op, respect the original strict warning-as-error and replace it with an actual typed bridge or direct accepted theorem application; never suppress linter diagnostics.

## Reproducibility and acceptance boundary

Owner strict qualifier `contributions/bfss-kotler/tools/qualify_fcp_k1d17.py`, Git blob `b33dc482e60ad8e188645969aac27da534df4c1c`, and workflow `.github/workflows/bfss-kotler-k1d17-source-spin48-isometry-laws-owner-strict.yml`. Require Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact immutable ancestor/candidate source hashes, no source sorry/admit/axiom, nonempty `.olean`, strict warnings-as-errors, exact three selected root types and declaration-level `#print axioms` limited to `propext`, `Classical.choice`, `Quot.sound`. Run all **78 previously accepted roots** freshly before K1D17 and preserve success/failure compiler evidence and root type logs.

Until an independently checked green at the exact SHA, **accepted baseline remains 63 modules / 78 selected roots**. Only then could K1D17 qualify 64 modules and 81 selected roots.

Do not change owner `main` or historical accepted research branches. No upstream PR to `mathcommunity/oai-math-revised` without separate explicit authorization. Keep determinant, SO48 target, surjectivity, topological covering, global Spin9 action, and BFSS spectral existence separately unproved.
