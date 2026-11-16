# BFSS M4-LB1P0A R2 RED — dependent-if proposition rewrite motive is ill-typed

**Date:** 2026-11-16 (Pacific). **Authorized branch:** `integration/bfss-unified-research-20261108`, `main` unchanged. **Outcome:** mathematically unqualified P0A RED; no independent P0A consumer compiled.

## Exact run, immutable evidence

- [Strict P0A R2 #43943783442](https://github.com/etblink/math/actions/runs/43943783442): completed/failure attempt 1, tested Git commit **`f280fc1c133ee914f10e0da1c998e3c72b79e48f`**, job **`133567900999`**.
- New P0A source original blob **`91fc78f9b47e7f7016aab45fa1b2d4ce8dc7ccf2`**, consumer blob **`53da0ec8242c49cfb062257d71d5a22bd4c35500`**, workflow blob **`a77575e476ee9e9457fb2fe8718060ac0f8ba904`**. Source/theorem signatures and sparse original Source48 matrix definition remain fixed.
- [Artifact #14264927130](https://github.com/etblink/math/actions/runs/43943783442/artifacts/14264927130) size **3,910 bytes**, GitHub-reported archive SHA-256 **`aaca5ae86df0b06a27deff741962418768c3fbf4cd7d168c1c171e3dfe4b5ae5`** (reported, not independently rehashed).
- Exact original P0A+consumer+LB1L2/LB1C1/LB1C0/LB1S/LB0/source-gamma/toolchain hash preflight PASS; Lean **4.34.1** and Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`** restored; frozen donor compile PASS; cold P0A source target failed. Source axiom audit and independent consumer NOT reached.
- **First causal error:** `P3M4LB1P0AOriginalSource48SkewPlane.lean:41:6: Tactic 'rewrite' failed: motive is not type correct`. Full log pinpoints `instDecidableAnd : Decidable (q=i ∧ p=j)` does not have expected type `Decidable _a` when `rw` attempts to rewrite the **proposition** in `@ite ℝ _a instDecidableAnd`. This is a dependent `Decidable`-instance rewrite issue, **not** a counterexample to skewness, not a recursion/timeout, and not proof of axiom-freedom. The unsuccessful proof printed `sorryAx` in both source theorem axiom reports. The source did not qualify.
- [Roadmap consistency #43943783452](https://github.com/etblink/math/actions/runs/43943783452) GREEN, a documentation check only.
- Previous [R1 #43940825520](https://github.com/etblink/math/actions/runs/43940825520) failed with unsolved conjunction cases from 16-way `by_cases` + `simp` + `ring`; separate RED record preserved.

## R3 bounded proof repair — avoid proposition rewriting in dependent ite

Keep exact unchanged `E^(ij)[p,q] = (if p=i∧q=j then 1 else 0) - (if p=j∧q=i then 1 else 0)` and the two native 48-label theorem statements. **Instead of** `propext` and `rw` on a proposition `q=i∧p=j` inside an `if`, prove equality of each complete **real-valued** conditional expression:

```text
h1 : (if q=i∧p=j then (1:ℝ) else 0)
     = (if p=j∧q=i then (1:ℝ) else 0)
h2 : (if q=j∧p=i then (1:ℝ) else 0)
     = (if p=i∧q=j then (1:ℝ) else 0)
```

For each, a single `by_cases` on the conjunction provides true and false branches; derive the swapped conjunction using `⟨h.2,h.1⟩`, then `simp [h,h']` on whole conditional terms. Only then `simp only [originalSource48SkewPlane]`, `rw [h1,h2]` on **complete ℝ scalars** and `ring`. There is no proposition rewrite under a dependent `Decidable` motive. This is a new proof, not yet qualified. Consumer/source statements unchanged, donor blobs frozen, no axiom, no resource relaxation.

If R3 RED again, preserve the first causal compiler diagnostic and reconsider matrix-conditional proof architecture; no open-ended CI loop. If R3 GREEN, accept **only** sparse Source48 plane matrix skewness with 2+2 independently checked standard-only axiom reports. Do not infer `K(E^(ij))=½Γ_iΓ_j`, full bivector Lie bracket, Spin9 physical symmetry or spectral results.
