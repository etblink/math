# BFSS NORM-0B second strict red — zero scalar proof normalization

**Recorded:** 2026-11-10 Pacific. **Tier:** STRICT RED + SOURCE-ONLY REPAIR CANDIDATE (NOT YET LEAN QUALIFIED).

## Exact strict failure

- Workflow: [run #42960271760](https://github.com/etblink/math/actions/runs/42960271760), tested exact commit `850e7c37f774f5c9e55c628fa4a12640317bd049`, job `130324883250`, failure confirmed 2026-11-11 04:50:36 UTC.
- 106 pinned Git blob preflight passed `NORM0B_ORIGINAL_106_BLOB_CLOSURE_PASS`; original source dependencies and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` compiled/restored.
- Source `originalColorQuadratic_add` at current source line 29-61 now compiled cleanly under a three-stage `calc`. `originalColorQuadratic_real_smul` likewise compiled with allowed axioms `propext, Classical.choice, Quot.sound`.
- **One causal source error:** at source line 81 in `originalColorQuadratic_zero`, `simp only [zero_smul, Finset.sum_const_zero]` reported **`simp` made no progress**, despite the prior explicit `change` exposing nested complex zero scalar terms. The subsequent `#print axioms` for zero and source Gram sum included `sorryAx` only as failed elaboration artifacts, not qualified mathematical proofs. Independent NORM0B consumer did not run because the source cold build failed.
- Separate nonfatal linter at source line 94 suggested `simp` instead of `simpa` in previously accepted generic induction proof; this is not a causal error and its code was not changed.
- Preserved artifact ID `13829361820`, zip SHA-256 `3f46f60d4db93fd621ed09e82c63f5de2104c71c58c7b5960bbea6c21d48081a`.

## Bounded repair

Do not reprove the nested zero sums. The NORM-0B source has ALREADY successfully compiled the full real scalar compatibility theorem `originalColorQuadratic_real_smul (r : ℝ) (J : GammaMatrix)`. Apply it to real scalar zero and the original zero GammaMatrix:

```lean
theorem originalColorQuadratic_zero :
    originalColorQuadratic (0 : GammaMatrix) = 0 := by
  simpa only [zero_smul, Complex.ofReal_zero] using
    (originalColorQuadratic_real_smul (0 : ℝ) (0 : GammaMatrix))
```

Pinned Mathlib `Mathlib/Basic/Complex/Basic.lean` line 134 verifies `Complex.ofReal_zero`. The source expression `0 • (0 : GammaMatrix)` and the complex scalar `(0:ℂ) • originalColorQuadratic 0` each reduce using `zero_smul`. No additional original Majorana operator identities, Finset rewrites or new axioms are needed.

- Failed source blob: `5b90c5d460288ce9bce68ed4c3ac54559f5b5889`.
- Repaired source candidate blob: `f37b2420306bf56aa62bc96f0a93abacd161ef9c`.
- Previous NORM0B strict workflow blob: `0821371d8cb8fc99df5fb9af461b51c753ed2053`; new workflow candidate `399dbdd4d0bcf38edcbf94237924683b612bf5f9` with **exactly one source hash changed among 106 frozen pins**.
- All **104 qualified** previous source/consumer Git blobs including NORM0A, original JOIN0 series and BIL remain unchanged.
- NORM0B independent consumer blob `fca47c1d976aaced0f1a9720a1ed457d16039910`, source addition and real scaling proof bodies, 81-term decomposition statement, pin preflight and axiom controls remain unchanged.

**Stop rule:** Not yet qualified. Require new 106-pin cold source build, separate independent consumer compilation and permitted-only `#print axioms` results. Any further red must be classified by first causal source/consumer error; do not change accepted ancestors. NORM0C fixed-B field bound and NORM0D original FullL2 multiplier remain prospective. Preserve negative knowledge that the correct next proof can be a corollary of a previously compiled structural theorem rather than another direct Finset reduction.
