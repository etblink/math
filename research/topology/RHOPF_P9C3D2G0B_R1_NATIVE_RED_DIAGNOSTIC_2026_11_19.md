# RHOPF-P9C3D2G0B R1 — source-native RED preserved

**Local date:** 2026-11-19 America/Los_Angeles (CI UTC completion 2026-11-20T04:01:40Z).  
**Branch:** `integration/bfss-unified-research-20261108`  
**Original run:** https://github.com/etblink/math/actions/runs/44670301525  
**Exact original tested commit:** `1a80e74169d67b12101606e1b2e2a9d88f30a849`  
**Original CI job:** `136069390714`  
**Original artifact:** https://github.com/etblink/math/actions/runs/44670301525/artifacts/14600741176  
**Artifact ZIP SHA-256:** `e91e94f57a16f63abc7ccc6d9250fee907cd1a26f52ba2bcd4b209b85f1aeeaa` (downloaded independently, computed locally, exact match to original uploaded ZIP digest).  
**Archive embedded tested commit:** `1a80e74169d67b12101606e1b2e2a9d88f30a849` (verified).  
**Status: RED — NOT QUALIFIED.**

## Stage boundaries

- Frozen original-source hash + proof-contract preflight: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore: PASS.
- Qualified original-source dependency build: PASS (9032 jobs).
- New native Lean source: RED.
- Independent imported consumer: SKIPPED.
- Both strict axiom audits: NOT QUALIFIED.
- Original diagnostic archive: PRESERVED and independently SHA-256 verified.

## Exact diagnostics

```text
RHOPFP9C3D2G0BOriginalGammaRelationalNonzeroFixedVector.lean:36:2:
error: Try this: letI̵
The goal is a proposition, so `let` is preferred over `letI`.

RHOPFP9C3D2G0BOriginalGammaRelationalNonzeroFixedVector.lean:40:17:
error(lean.invalidField): Invalid field `mem_range_iff`:
The environment does not contain `Eq.mem_range_iff`.
  hIdem : F * F = F
```

The subsequent `#print axioms` contains `sorryAx` because native compilation failed. This is not a source-accepted theorem. The idempotence premise `IsIdempotentElem F` elaborates to an equality; dot projection `hIdem.mem_range_iff` therefore tries `Eq.mem_range_iff`, rather than resolving the lemma's namespace.

## Bounded R2 repair

Change only two expressions: `letI : Nontrivial...` to `haveI : Nontrivial...` to satisfy warnings-as-errors, and `hIdem.mem_range_iff` to the original Mathlib theorem `IsIdempotentElem.mem_range_iff hIdem`. Confirmed upstream pinned Mathlib contains `IsIdempotentElem.mem_range_iff {p : M →ₗ[S] M} (hp : IsIdempotentElem p)`. Keep theorem statement, original projector, qualified G0A, independent imported consumer, existing workflow, proof resource limit, and frozen pins invariant except exact new G0B source blob hash. Preserve source-independent original integer fixture and history. R2 remains UNQUALIFIED until source-native + independent strict GREEN with verified original artifact. If another RED occurs, preserve and diagnose before new changes.

**No source-derived norm-one inhabitant, Hopf quotient or physical Fock implementation is qualified by this RED.**
