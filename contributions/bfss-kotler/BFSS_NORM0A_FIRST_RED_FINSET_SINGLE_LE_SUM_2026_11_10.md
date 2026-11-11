# BFSS NORM-0A first red — implicit finite-sum instantiation

**Recorded:** 2026-11-10 Pacific. **Tier:** STRICT RED + SINGLE SOURCE-PROOF REPAIR CANDIDATE. Not accepted Lean theorem.

**Exact failure:** [strict run #42954197413](https://github.com/etblink/math/actions/runs/42954197413), tested commit `24307cd0fba8faf9ddca84366ebfa6b6b2845bbd`, job `130305299811`, failure 2026-11-11 03:49:05 UTC. 104 exact Git-blob preflight passed (`NORM0A_ORIGINAL_104_BLOB_CLOSURE_PASS`), pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. Original VLY-0A imported and built. The new source `originalGramTrace_nonneg` compiled with only `propext, Classical.choice, Quot.sound`, but source line 37 of `BFSSNORM0AOriginalGramTraceBound.lean` failed at `apply Finset.single_le_sum`: the generic theorem's binder `f a ≤ ∑ x ∈ s, f x` did not unify against the original Gram diagonal `originalSpatialGram x i i ≤ ∑ i, originalSpatialGram x i i` without explicitly instantiating `f` and `s`. Subsequent `originalGram_abs_le_trace` showed `sorryAx` solely as a failed-elaboration consequence. The independent consumer was not compiled. Failure artifact ID `13826836526`, ZIP SHA-256 `e382909df5c2874a9fd2f4f5f5d4c084a420a9d2aeac29fcfb475c47054d9ae2`.

**Bounded repair candidate:** In the private helper `originalGram_diag_le_trace` only, replace the failed `apply` and subgoal bullets with:
```lean
  exact Finset.single_le_sum
    (s := Finset.univ)
    (f := fun j : SpaceIndex => originalSpatialGram x j j)
    (by
      intro j _
      change 0 ≤ inner ℝ (spatialColor x j) (spatialColor x j)
      exact real_inner_self_nonneg)
    (Finset.mem_univ i)
```
This fully instantiates the finite set, diagonal function, nonnegative summand and membership certificate against source-defined `Boson 2`. It is not a change in mathematical statement and does not touch the Cauchy–Schwarz/AM–GM body or independent consumer. Pinned Mathlib `Finset.single_le_sum` was confirmed in `Mathlib/Analysis/Convex/StdSimplex.lean` at `d13f23b7…`, where usage supplies nonnegativity and membership as separate arguments.

**Candidate source blob:** `9d4ef34bcfe7f496b94c35e2efa114bf97cf98e9` from `4d251575f578dd887fdf345b23b9dcf62d6bf60a`. **New strict workflow blob:** `49b6c6aa9a530e846453444611c3a8920c33881f` from `227dd6865447b16e8d6bb857d9ccc971f38efa55`. Exactly ONE source blob pin changes in a **104-pin manifest**. The NORM-0A consumer blob `c6020d269a53169deccef81ea76fc3005875203e`, all 102 independently green JOIN-0B3 ancestry blobs, toolchain, consumer import and axiom controls are unchanged.

**Stop rule:** No promotion of NORM-0A from the source or preflight alone. Require new green strict source and independent consumer check. If this still fails, inspect the exact first causal elaboration error; do not modify accepted sources or replace the original Gram carrier. NORM-0B remains unstarted, NORM-0C and NORM-0D remain future gates. Preserve the negative result as an explicit lesson about implicit Finset binder inference in Lean.
