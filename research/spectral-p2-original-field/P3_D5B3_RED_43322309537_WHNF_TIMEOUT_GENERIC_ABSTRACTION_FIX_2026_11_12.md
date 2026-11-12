# D5B3 strict RED #43322309537 — deterministic whnf timeout at the isometry constructor

**Date:** 2026-11-12 Pacific. **Branch:** `integration/bfss-unified-research-20261108`.
**Initial candidate commit:** `835c86014324f022fb149e1117710f9a85005789`. **Initial result:** RED, not qualified.
**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D5B3OriginalFockL2ColumnIsometry.lean`. **Original blob:** `1cd5d7a9a0d0ab47f9548fe79dda84c095095bd3`.
**Independent consumer blob (unchanged):** `ca560ddfe3b5494dcad5560f9c7fa715a5ab918a`.

## First causal error from actual cold CI
- Run: https://github.com/etblink/math/actions/runs/43322309537
- Preflight all **75** pinned blobs PASSED, and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` environment PASSED.
- Cold Lake source built all 9180 preceding jobs, including accepted D5B2, before the newly introduced D5B3 declaration failed.
- **First causal error:** `P3D5B3OriginalFockL2ColumnIsometry.lean:65:5` (deterministic) timeout at `whnf` (200000 heartbeats), during `(originalFockL2ColumnsLinear μ).isometryOfInner (originalFockL2ColumnsLinear_inner μ)`.
- Cascading errors: unknown new isometry identifier, then `sorryAx` in a downstream theorem. These are artifacts of missing declaration, not separate mathematical inconsistencies.
- D5B3 `originalFockL2ColumnsLinear`, `originalFockL2ColumnsLinear_apply` and `originalFockL2ColumnsLinear_inner` compiled and printed only `propext`, `Classical.choice`, `Quot.sound`. **No mathematical counterexample.**
- Original red evidence artifact: `13992881085`, run URL https://github.com/etblink/math/actions/runs/43322309537/artifacts/13992881085.

## Bounded repair: abstraction barrier, not resource escalation
- Leave the exact approved original-Fock L² types, the linear columns map, the qualified D5B2 premise, and the successful D5B3 inner equality unchanged.
- Insert a **private generic** `generic_isometry_from_inner` at abstract complex inner-product-space variables `E,F`; its complete implementation is pinned Mathlib `LinearMap.isometryOfInner`, the exact theorem whose proof was already inspected in the pinned upstream source.
- Apply the generic constructor to original-Fock `originalFockL2ColumnsLinear μ` plus `originalFockL2ColumnsLinear_inner μ`; this avoids reducing the enormous concrete source carrier during the *constructor proof* itself.
- Keep the public original `originalFockL2ColumnsIsometry` name and statement, and independent consumer bytes identical. **No extra axioms, no sorry, no unsafe, no autoImplicit, no heartbeat or recursion increases.**
- Update **only** the new D5B3 source blob pin in the existing D5B3 workflow; the other 74 source+consumer pins remain exact and unchanged.
- Retain the same cold Lake target, output `.olean`, and independent consumer module paths. The strict gate still requires independent consumer, no warnings, and only foundational axioms.

## Unchanged proof scope
An isometric embedding only, **not surjectivity** or isometric equivalence, not replacement of operator norm by HS norm, not gauge-physical intertwining, original BFSS Hamiltonian graph/domain, eigenpairs, or mass gap.

## Methodological lesson
At a large source-dependent type, first-elaboration failure in `whnf` is distinct from a false equality. Prove the generic functional-analytic constructor on abstract carrier types before source-exact specialization. Preserve all first causal diagnostics and exact source/consumer pins; never raise budgets without a separate justification.

**Status:** repaired candidate only until new strict-green verification; original RED is retained as negative knowledge.
