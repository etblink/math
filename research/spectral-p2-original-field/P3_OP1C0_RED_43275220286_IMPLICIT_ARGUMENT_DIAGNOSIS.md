# P3-OP1C0 RED #43275220286 — implicit argument binding, not mathematical failure

**Date:** 2026-11-12 Pacific. **Branch:** `integration/bfss-unified-research-20261108`. **Status:** RED; candidate theorem unqualified. **Project Lead:** authorize one-line proof repair and matching single source blob pin only.

## Exact tested evidence
- [Run #43275220286](https://github.com/etblink/math/actions/runs/43275220286), `completed/failure`, attempt 1, tested commit `31f90423b33a936ef7c54e97a0ff64961306ce1d`, job `131381733119`.
- 61/61 original source/consumer pins passed; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; historical ancestors compiled.
- Original candidate source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3OP1C0OriginalFockTraceNonnegative.lean`, blob `c6443d150371c2505ab6b5f2a01d6b20254662b3`; independently intended consumer blob `6d1307aa5363a91c4c208c98354ab9c25f11a1ac`.
- First causal error at `P3OP1C0OriginalFockTraceNonnegative.lean:39:38`: `Function expected at inner_self_nonneg`, because term `inner_self_nonneg` already has type `0 ≤ RCLike.re ⟪?m.40, ?m.40⟫_?m.35` and is being incorrectly applied to a positional `(T (b i))`. The vector parameter is **implicit**, requiring `(x := T (b i))`.
- Follow-on `sorryAx` output is an artifact of failed elaboration. No consumer was compiled; the source is NOT qualified on this run.
- [Artifact #13970154313](https://github.com/etblink/math/actions/runs/43275220286/artifacts/13970154313), SHA-256 `65b08ebebc50865acf2768eeda87bef458a83a355ca4e04ca453ca766d21b29d`.

## Bounded repair/decision
Replace only
```lean
exact Finset.sum_nonneg (fun i _ => inner_self_nonneg (T (b i)))
```
with
```lean
exact Finset.sum_nonneg (fun i _ => inner_self_nonneg (x := T (b i)))
```
in the unqualified source, and update only that source's Git blob in the strict 61-pin manifest. Keep its theorem statement, imports, other proof steps, diagnostic consumer, 59 qualified ancestor blobs, pinned toolchain, cold-build and independent-consumer gates and restricted axioms unchanged. The new run is separately CANDIDATE until green. If a new error surfaces, inspect it before any further edit. Do not alter the actual original Fock carrier or introduce a substitute HS model.

**Scientific ceiling:** even on successful qualification this gate proves only `0 ≤ Re Tr_F(T†T)`, not yet strict positivity, a Hilbert–Schmidt norm/complete space, continuity of Spin(9), physical SU2 gauge compatibility or any BFSS spectral claim.
