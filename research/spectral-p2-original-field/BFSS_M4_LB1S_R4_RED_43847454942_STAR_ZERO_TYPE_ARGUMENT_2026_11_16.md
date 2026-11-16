# BFSS M4-LB1S R4 RED — sole missing explicit star_zero carrier argument

**Local date:** 2026-11-16 Pacific. **Canonical owner-directed branch:** `integration/bfss-unified-research-20261108` ONLY; no side branch or `main` edits.

**Status:** R4 RED (NOT LB1S qualified), yet the generic finite-sum source architecture now compiles through its concrete original 48×48 K(A) application.

## Immutable strict CI evidence

- [R4 strict #43847454942](https://github.com/etblink/math/actions/runs/43847454942), completed/failure, attempt 1, tested exact SHA **`64507e11ab8076df13dfbcb7d3a6a418a85facf0`**, failed job `133231115312`.
- Exact source and donor/consumer pin preflight, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS. Actual native 48×48 LB1S cold source build RED before any independent consumer compilation.
- [R4 original logs artifact #14217135273](https://github.com/etblink/math/actions/runs/43847454942/artifacts/14217135273), ZIP size 2,988 bytes; GitHub-reported SHA-256 `9eceed823844b3d3aa5127552b317e910b821bc5407c05978d6c1bca59e1fb77`; provider-reported, not independently rehashed locally.
- Exact tested source Git blob `b5494b0eb84d7d43174403e472021d973ddf777f`, independent original-Fock consumer blob `b66be3f0097dbb0a2747e58f7ff21b1bf1d7a1d8` unchanged through R1–R4; frozen accepted LB0 donor `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`.
- **Only one Lean compiler error**: source line `138:6`, `exact star_zero` is a polymorphic theorem `∀ (R : Type u) [AddMonoid R] [StarAddMonoid R], star (0:R)=0`, while target is `star (0:Op)=(0:Op)`. Explicitly supply the true original operator carrier `Fermion 2 →L[ℂ] Fermion 2` (or its private abbreviation `Op`). No unresolved generic finite sum, no recursion depth error, and no warning-as-error issue was reported in R4.
- Source `originalSource48BivectorK` and `originalSource48_matrixSkew_entries` reported ONLY standard axioms `propext`, `Classical.choice`, `Quot.sound`. The diagonal proof error produced `sorryAx` in `originalSource48BivectorK_skewAdjoint` and its transpose consequence. **`originalSource48BivectorK_zero` now reported standard-only axioms**, demonstrating progress; however, source failed before independent consumer and overall gate remains R4 RED.
- Prior negative evidence remains preserved in [R1](BFSS_M4_LB1S_R1_RED_43840918666_SCALAR_STAR_SUM_BOUNDARY_2026_11_16.md), [R2](BFSS_M4_LB1S_R2_RED_43843745397_DIAGONAL_AND_DOUBLE_SUM_2026_11_16.md), [R3](BFSS_M4_LB1S_R3_RED_43845733042_STAR_ZERO_UNIFICATION_BOUNDARY_2026_11_16.md).

## Decision: keep successful new proof architecture; one-line type correction only

R4 established that the **new typed zero scalar bridge**, **abstract two-index finite-sum star-neg lemma**, **local named original Fock f**, and **definitional K(A)-to-double-sum bridge** can be compiled in the actual source at frozen recursion/heartbeat/resource limits. The R3 stopping-rule contingency (change proof architecture if the concrete sum recursion persists) has **NOT** triggered. Avoid another wholesale rewrite, no resource cap changes, no invented star-instance, no operator commutativity assumption.

R5 bounded repair: Replace **only** `exact star_zero` at line 138 by `exact star_zero (Fermion 2 →L[ℂ] Fermion 2)` or `exact star_zero Op`; preserve exact original K(A) definition `∑p,q (A p q / 4 : ℝ) • (Γ_p Γ_q)`, all five theorem statements, the generic proof lemmas, all four independent consumer statements and bodies, frozen donors/toolchain, and all nine restricted-axiom/warning-as-error controls. Commit the source and update its SHA pin in same single unified branch; run a genuinely cold source + consumer independent strict CI. Never reclassify a historical RED as GREEN.

Even a future full GREEN would qualify only the **skew-adjoint original Fock-vector infinitesimal K(A)**, not its complete commutator action, an original Spin(9) Fock-vector group representation, original SU2/16-charge common domains or spectral conclusions.
