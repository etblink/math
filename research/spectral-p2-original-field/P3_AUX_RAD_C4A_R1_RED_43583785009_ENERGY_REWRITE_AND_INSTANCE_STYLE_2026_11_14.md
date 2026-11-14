# P3-AUX-RAD-C4A R1 — RED, concrete energy rewrite and proof-instance style

**Date:** 2026-11-14 Pacific. **Verdict:** RED_UNQUALIFIED, not mathematical falsification. [Strict #43583785009](https://github.com/etblink/math/actions/runs/43583785009), attempt 1, exact tested `f7e6db3f05569403c47774655a17aabfaa4c656c`, job `132413864798`.

## Verified source and first causal failure

- Exact source blob `63561999a01e09638063d7efeb4ca057239f32f8`, original independent paired consumer `820ec0bd4a0255d2564dc05b72bc488b1dabf4d0`, workflow `979ffcd0cf2cc47981e75903d2ba601cfcf661e0`.
- Reviewed source-closure preflight PASS: **212** OAI candidate/donor files, manifest SHA256 `2b763f2f408dad46638682a5c47d0baa368189533f5fb7abeafff6899852039a`; original Core/BB/BC/BD/C3/C3DC source pins matched; pinned Lean/Mathlib restoration PASS.
- All 9,133 preceding cold build jobs succeeded. The final new source failed at **94:14**, second rewrite in `rw [hinner, inner_self_eq_norm_sq]`: could not find generic `re (inner ?m x x)` in the concrete `Complex.re (inner ℂ ... ...)` target.
- The compiler additionally reports the target is not type-correct under the rewrite tactic's **implicit transparency**: `u.property` belongs to the source-defined `originalWeightedPhysicalAdjointSquare` domain, but the local `naturalComp_domain_le` application expects its unfolded `naturalComp Sε.adjoint Sε` domain. This is a source/interface normalization diagnostic, not evidence that the mathematical energy identity is false.
- Six style warnings at **44:2, 52:2, 64:2, 70:2, 82:2, 101:2**: proof-valued `letI` should be `let`. These independently fail strict warning policy and must be corrected without disabling the linter.
- Domain, self-adjointness, closedness and dense-domain source roots printed only `[propext, Classical.choice, Quot.sound]`. Energy and dependent nonnegativity printed `sorryAx` after the error. **No root is newly qualified by this failed module; the independent original paired consumer was not reached.**
- [Timestamped source diagnostic excerpt](evidence/P3_AUX_RAD_C4A_R1_43583785009_first_causal.log). Raw job logs and [artifact #14110420001](https://github.com/etblink/math/actions/runs/43583785009/artifacts/14110420001), 26,091 bytes, published digest `sha256:bdfeeaee9267e2912665392284560613609f0c7fb26230c7e17789026f66f52b` independently match GitHub metadata/logs; ZIP not independently rehashed.

## Source/API retrieval for one bounded R2 repair

Pinned Mathlib `Mathlib/Analysis/InnerProductSpace/Basic.lean`, commit `d13f23b723b8a846827a245b89c10fc7d3f11612`, lines 391–392, has the exact generic theorem:
```lean
theorem inner_self_eq_norm_sq (x : E) : re ⟪x, x⟫ = ‖x‖ ^ 2 := by
  rw [pow_two, inner_self_eq_norm_mul_norm]
```
The scalar can be explicitly specialized with `(𝕜 := ℂ)`. Existing failure playbook calls for a typed generic scalar fact before entering a native semireducible expression; no need to invent another norm identity or unfold the physical carrier.

**Prospective R2, not yet tested:** replace only the concrete rewrite step by composition of the already established `congrArg Complex.re hinner` with `inner_self_eq_norm_sq (𝕜 := ℂ)` applied to the exact source output. This uses ordinary theorem application instead of the rewrite tactic's implicit-transparency matching. Replace the six proposition-proof `letI` binders by `let`, retaining `letI` in the operator definition and theorem result signatures. Keep all six public statements, source carriers, exact original consumer, donor pins, strict audits and heartbeat/recursion budgets unchanged; update only the frozen new-source hash in its workflow.

If this architecture is still RED, stop after these two related attempts and inspect a small explicit domain/instance transport rather than cycling rewrite variants. No source model change, warning suppression, new axiom or budget escalation.

## Research preserved alongside the red

[Forward C4B/kernel/positive-regulator memo](P3_AUX_RAD_C4B_FORWARD_RESEARCH_NORMALIZATION_KERNEL_AND_POSITIVE_REGULATOR_STABILITY_2026_11_14.md) is conventional/source-reviewed research only. It contains a direct BE normalization plan, exact graph-zero kernel argument, conditional positive-regulator norm-resolvent bound, and an analytic ℓ² countercontrol at ε=0. None is promoted by this run. Complete and review C4A before advancing C4B.

Original accepted Sε closedness/density, original H/M5 baseline and TD-C1A RED remain unchanged.
