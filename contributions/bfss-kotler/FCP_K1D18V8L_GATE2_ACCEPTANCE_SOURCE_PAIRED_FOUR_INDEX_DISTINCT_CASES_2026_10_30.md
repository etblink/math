# Project Lead — V8L Gate 2 ACCEPTED: five source-original four-index distinct patterns

**Research local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T03:33:01Z. **Disposition:** `ACCEPTED_5_EXACT_LEAN_ROOTS__GENERAL_FOUR_INDEX_STILL_OPEN`.

## Exact immutable terminal green evidence

- [V8L Gate 2 run #41164408088](https://github.com/etblink/math/actions/runs/41164408088) attempt **1**, **completed/success**, exact tested SHA **`4fa9a84d98f13f7531c62be8e9e76955cab3ea41`**, strict job `124428748647` completed/success.
- Candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FourIndexDistinctCasesProbe.lean` exact Git blob **`35b6e9acd0504885521727ec0e655f7e51813ea0`**.
- Exact original gamma and `pairedColorSpinEquiv` Fock crosswalk, V8I `L` bracket and V8K pair-coincidence ancestors, Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` all pin-verified.
- Dependency restoration and accepted V8I/V8K ancestor `lake build` passed, `Build completed successfully (8961 jobs)`. This is the build dependency count, **not** newly accepted roots.
- Fresh warnings-as-errors `lake env lean` compilation of exact source **PASS**, new `.olean`, five exact `#print axioms` records.
- Separate warnings-as-errors Lean independent audit checked **five original-source exact theorem-type `example`s**, five `#check` statements and five declaration `#print axioms` **PASS**.
- Each root depends only on `[propext, Classical.choice, Quot.sound]`, no `sorryAx`, no proof-limit increase.
- Terminal marker `K1D18V8L_FIVE_FOUR_INDEX_DISTINCT_CASES_TYPE_AXIOMS_PASS`.
- [Preserved evidence artifact #13028164992](https://github.com/etblink/math/actions/runs/41164408088/artifacts/13028164992) `bfss-v8l-original-paired-four-index-distinct-4fa9a84d98f13f7531c62be8e9e76955cab3ea41-1`, zip SHA256 **`bfa98da4b9c4b59480a3fc519909344ddbd1f4d16b2d6a417b00262af5450c8c`**, size 1162 bytes.

## Five accepted new theorem roots

All declarations are in `FCP.BFSSPairedSpin9Plane` on the actual `Matrix Source48Label Source48Label ℝ`, not a color-major surrogate.

- `zeroDiagonalFourIndex_disjoint_case`: `[L_rs,L_tu]=zeroDiagonalFourIndexRHS r s t u` when r,s,t,u are four different indices.
- `zeroDiagonalFourIndex_adjacent_case`: `[L_rs,L_st]=zeroDiagonalFourIndexRHS r s s t` for pairwise distinct r,s,t, equal to `-(L_rt+L_rt)`.
- `zeroDiagonalFourIndex_shared_right_case`: `[L_rs,L_ts]=zeroDiagonalFourIndexRHS r s t s` for pairwise distinct r,s,t, equal to `L_rt+L_rt`.
- `zeroDiagonalFourIndex_shared_left_case`: `[L_rs,L_rt]=zeroDiagonalFourIndexRHS r s r t` for pairwise distinct r,s,t, equal to `L_st+L_st`.
- `zeroDiagonalFourIndex_cross_right_case`: `[L_rs,L_tr]=zeroDiagonalFourIndexRHS r s t r` for pairwise distinct r,s,t, equal to `-(L_st+L_st)`.

These proofs transport accepted V8I exact L brackets and simplify the concrete V8J four-index RHS under explicitly named inequality hypotheses.

## Failure-to-correction knowledge

Original [V8L Gate 1 RED #41163775125](https://github.com/etblink/math/actions/runs/41163775125), SHA `86d8de845822fed7e56667ef30afbb643f470bca`, red artifact `13028315711`, SHA256 `c1e378667f260729495a85d4e3584453e9d771a787f906044fc4d34a8f4b4ab2`, failed on *three unused simp args*, lines 48, 76 and 90. Removing only the redundant `Ne.symm hrs`, `hrs`, `hrs` produced the new strict-qualified blob. Exact causal record: `FCP_K1D18V8L_GATE1_RED_LINTER_CAUSAL_REVIEW_GATE2_RECOVERY_2026_10_30.md`. No accepted source, theorem statement, linter setting or proof limit was changed.

## Status and next narrow source theorem

Prior V8A–V8K **24** accepted roots; V8L adds **5**, total **29 accepted V8A–V8L roots**. V8J diagonal input, V8K identical/reversed pair, and V8L all four shared/disjoint patterns cover each equality partition of four index variables. However **the universal four-index theorem is NOT QUALIFIED** by case-coverage intuition alone.

**Next isolated V8M target:**
```lean
theorem zeroDiagonalFourIndex_universal_bracket
    (r s t u : SpaceIndex) :
    zeroDiagonalPairedPlane r s * zeroDiagonalPairedPlane t u -
      zeroDiagonalPairedPlane t u * zeroDiagonalPairedPlane r s =
    zeroDiagonalFourIndexRHS r s t u := by
  -- explicit by_cases r=s; t=u; r=t; r=u; s=t; s=u
  -- close with strictly accepted V8J, V8K, V8L theorems
```
Prove without new gamma arithmetic, without changing the zero-diagonal interface, using exact original source labels and typed cases. New theorem gets independent exact type and axiom audit and immutable artifact. The proposed RHS is `(if s=u then L_rt+L_rt else 0) - (if s=t then L_ru+L_ru else 0) + (if r=t then L_su+L_su else 0) - (if r=u then L_st+L_st else 0)`.

Even if qualified, the universal matrix bracket is an algebraic identity and **not** automatically an integrated global Spin(9) group action, a source Majorana Fock representation, a topological covering, or any BFSS spectral existence theorem.

No changes to accepted theorem source, frozen FCP provenance, `main`, or mathcommunity upstream. This acceptance handoff commit is documentary, not itself a new Lean theorem.
