# Accepted F10AF and F10AG full canonical original gamma-pair trace Gram candidate

Date: 2026-11-01. Research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`. Accepted parent SHA: `53b949e9c4f9f2694db8e61875cb2584bde982da`.

## Accepted strict F10AF
[Run #41345111543](https://github.com/etblink/math/actions/runs/41345111543) SUCCESS, attempt 1, tested exact parent SHA. Pinned original gamma sources, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AE ancestry rebuild, warning-as-error Lean compile, independent exact three declaration types and root axioms passed. Marker `V10H_F10AF_THREE_SHARED_INDEX_TRACE_TYPES_AXIOMS_PASS`; only `propext`, `Classical.choice`, `Quot.sound`, no sorryAx.

[Artifact #13099197768](https://github.com/etblink/math/actions/runs/41345111543/artifacts/13099197768), SHA256 `0ccbb93bd03ab3097d6323009386b078677cceefb28595413ff26a43300be1a0`.

F10AF accepted original source results: trace((γaγb)(γbγc))=0 for a≠c; trace((γaγb)(γcγb))=0 for a≠c and b≠c; trace((γaγb)(γcγa))=0 for b≠c.

## F10AG CANDIDATE: complete ordered two-gamma Gram matrix
The input pair indices are the EXACT `SpaceIndex=Fin 9` from the original source, always **canonically oriented** a<b and c<d. This is necessary: reversing the same two-gamma word changes sign and would not have off-diagonal trace zero.

**Lemma 1:** `source9OriginalGamma_ordered_distinct_pair_trace_zero`. If a<b and c<d and `(a,b) ≠ (c,d)`, then trace((γaγb)(γcγd))=0. Dispatch all cases a=c (F10AB shared-left), a=d (F10AF closing-shared), b=c (F10AF adjacent-shared), b=d (F10AF shared-right), and all four indices distinct (F10AE four-word source). The order constraints supply every required inequality without case-count heuristics.

**Lemma 2:** `source9OriginalGamma_ordered_pair_trace_gram`. Under the same strict index order, trace((γaγb)(γcγd)) is -16 when `(a,b)=(c,d)` and zero otherwise. Diagonal supplied by accepted F10AB source gamma pair square-trace.

Passing both would prove the FULL nondegenerate signed 36×36 source gamma-pair trace Gram formula on the actual 16-real source matrices. It would be stronger than the accepted fixed-left eight-word coefficient extraction, but **simultaneous 36-word linear independence still requires a separately checked finite coefficient extraction theorem** (proposed F10AH); full 256 even gamma PBW images and actual even-Clifford gamma AlgHom injectivity remain OPEN. Faithful Spin9 source action, Spin48 lift, Fock realization, BFSS physical/spectral results also remain OPEN.

Strict gate: exact source pins F10E/F10AB/F10AE/F10AF/F10AG, Lean 4.34.1/Mathlib frozen, accepted F10AF rebuild, fresh warning-as-error Lean, independent exact TWO declaration type and axiom checks with whitelist, SHA and artifact. No sorry/admit/new axioms, private signed-permutation gamma tables, raised resource limits, main-branch merges or external upstream PR.
