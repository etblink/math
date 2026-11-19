# RHOPF-P9C1C1B-D0 — bounded single-original-gamma column diagnostic

**Date:** 2026-11-19.
**Status:** DIAGNOSTIC STAGED; native Lean source and consumer NOT QUALIFIED until strict CI.
**Branch:** `integration/bfss-unified-research-20261108`.
**Accepted predecessor:** P9C1C1A R3 [#44571452613](https://github.com/etblink/math/actions/runs/44571452613), original tested SHA `de4c3aed8ba34694b82759a320b5816cfac4e33c`; evidence accepted at commit `e80eab393dcf0abb00a85747c6055d79cf17dcc6`.

## Why this microgate

The prior P9A1B R1/R2/D0 failed on large original real 16-term matrix-product normalization, forbidden private `import all`, and naive `rfl` on concrete original product entries. Avoid reproducing those attempts. From the exact frozen original `SU2RealGammaProbe.lean`, gamma index 3 is a signed permutation with row 10 mapping to column 0 with sign +1, and (as verified by the independent original integer fixture) its real public original matrix therefore sends original column basis vector e0 to e10.

Before attempting all three bivectors on four selected basis vectors, attempt ONE original public gamma action `gamma (3 : SpaceIndex) *ᵥ e0 = e10` using `Matrix.mulVec_single_one` to collapse the vector sum to a single original GammaMatrix column, then 16 independent original-source public matrix entries under `fin_cases i` and `norm_num`. No copied private signed permutation data, no original source edits, no alternative gamma representation, no heartbeats/recursion changes.

This is an honest **proof feasibility diagnostic**, not a claimed physical or mathematical result before strict CI. Its success could inform a much more bounded two-gamma/e0 comparison, then the four basis-vector common-action statements. Its failure tells us this original public-source reduction still needs a different original-source adapter; preserve the failure and stop before more expensive direct calculations.

## Strict requirements

Exact original source/hash preflight, independent integer source fixture, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; independently compiled typed Lean consumer; two original/independent `#print axioms` results with only `propext`, `Classical.choice`, `Quot.sound`; artifact archive with SHA-256 and exact tested commit. No `sorryAx`.

Regardless of outcome, P9C1C1A original equalizer remains qualified and the equality to literal selected coordinate `span(e0,e1,e8,e9)` is not yet a native theorem. A single gamma action neither gives the full Spin9-on-Fock representation nor establishes a physical Hopfion, Noether conservation, or SM observable.
