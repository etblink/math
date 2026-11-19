# RHOPF-P9C1C0 R1 — native RED whnf timeout, R2 bounded proof-architecture recovery

**Date:** November 19, 2026.
**Original strict R1:** [run #44528603322](https://github.com/etblink/math/actions/runs/44528603322); conclusion **FAILURE**.
**Exact R1 tested SHA:** `5bfabdbde8ae373963a20765150e76c6ce751cfc`.
**Original artifact:** [#14532879531](https://github.com/etblink/math/actions/runs/44528603322/artifacts/14532879531). Downloaded ZIP SHA-256 `ff183d0460eb39b1a709ab74413d461de287f46fb8cfbc27ea185ea3bca85fb8` matches GitHub's digest, and its archived exact-tested-commit matches the source SHA.

## Native RED classification

Exact original source hash/declaration preflight PASS, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS, original qualified Gamma9/P9C1B1 dependency build PASS, and independent original integer fixture PASS.

The native source `RHOPFP9C1C0OriginalGammaCoordinateRankBridge.lean` fails **at line 51:4** with deterministic Lean `whnf` 200000-heartbeat timeout. The immediate expression applies `(Pi.linearIndependent_single_one SpinIndex ℝ).comp selectedIndex selectedIndex_injective` to the original selected 4-vector family. This is elaboration/normalization/resource failure, **not an algebraic counterexample**. There is no reason to increase global heartbeat budgets or copy private original gamma entries.

Native `selectedIndex_injective` and conditional `selectedCoordinatePlane_le_projector_range` compiled with axiom reports containing only `propext`, `Classical.choice`, `Quot.sound`. The plane-finrank and conditional equality declarations had `sorryAx` in the R1 diagnostic, so neither is accepted. Independent Lean consumer was correctly skipped.

## R2 source-only recovery

Keep exact same four theorem statements, the original `selectedIndex` (0,1,8,9), `selectedCoordinatePlane`, fixed-basis predicate, original source gamma matrices, accepted projector/rank theorems, and independent consumer byte-for-byte.

In the ONE timed-out proof, isolate `basisFamily : SpinIndex → (SpinIndex → ℝ)` as a local `let`, first bind `hbase : LinearIndependent ℝ basisFamily`, then bind `hcomp : LinearIndependent ℝ (basisFamily ∘ selectedIndex)`, then derive `hspan := finrank_span_eq_card hcomp`. Convert the final statement with a *single explicit `change`* and `exact hspan.trans (by decide)`, instead of implicit normalization within a large `simpa only` over the original source expression. This might avoid the R1 elaboration choke point, but is unqualified until strict R2 runs.

The workflow changes only the new native candidate's exact Git blob pin. No new axioms, sorry, private imports, heartbeat/recursion overrides, original BFSS Core, Hamiltonian or Fock changes, or claimed particle physics result.

## Stop rule and future work

Preserve the R1 diagnostic even if R2 succeeds. If R2 is RED, inspect its precise new native log before modifying. Qualify only on complete strict-green original-source and independently imported Lean consumer, eight standard-axiom reports without `sorryAx`, artifact digest and exact SHA match. P9C1C0 is a CONDITIONAL rank-saturation bridge, not a source-exact witness that the original projector fixes e0,e1,e8,e9. The latter is a distinct P9C1C1 obligation.
