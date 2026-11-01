# F10AE qualified; F10AF original gamma shared-index cross-trace candidate

Date 2026-11-01. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`. Accepted F10AE parent `69831c289aed98d503597e41d516f30f524970a5`.

## Accepted F10AE Gate 2
[Strict run #41344113951](https://github.com/etblink/math/actions/runs/41344113951), successful attempt 1, exact tested parent SHA. Original gamma source pins, Lean 4.34.1, frozen Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AD ancestry, warnings-as-errors fresh Lean compiler and TWO independent exact declaration types/axioms passed; marker `V10H_F10AE_TWO_FOUR_WORD_TRACE_TYPES_AXIOMS_PASS`. Only `propext`, `Classical.choice`, `Quot.sound`; no sorryAx. [Artifact #13097649680](https://github.com/etblink/math/actions/runs/41344113951/artifacts/13097649680), zip digest SHA256 `6dfc0d1c5ebd3ea0c48262cb778dc5820818a0c8d4c66a63cf276870cea266f5`.

Negative knowledge preserved: [F10AE Gate 1 RED #41343019280](https://github.com/etblink/math/actions/runs/41343019280) due to unused Lean simp arguments and missing `mul_neg` for nested-sign cancellation; no mathematical theorem invalidation. [Artifact #13097638524](https://github.com/etblink/math/actions/runs/41343019280/artifacts/13097638524). Gate 2 repaired only simp normalizations.

Accepted F10AE source result: `trace(gamma a * (gamma b * gamma c * gamma d))=0` for a≠b,a≠c,a≠d, and the equal parenthesized two-pair identity. This covers all four-distinct pair indices and related three-distinct arrangements with first index unique. No full pair orthogonality claimed.

## F10AF — UNQUALIFIED remaining shared-index cases
Test three distinct, exact ORIGINAL 16-real public source gamma matrix theorems:
- `source9OriginalGamma_pair_adjacent_shared_trace_zero`: trace((γaγb)(γbγc))=0 when a≠c; use source gamma_b²=1.
- `source9OriginalGamma_pair_shared_right_trace_zero`: trace((γaγb)(γcγb))=0 when a≠c and b≠c; anticommute γbγc and reduce to -trace(γaγc).
- `source9OriginalGamma_pair_closing_shared_trace_zero`: trace((γaγb)(γcγa))=0 when b≠c; trace cyclically moves the closing γa beside the first γa to reduce to trace(γbγc).

These fill the three shared-index patterns missing from the accepted F10AE proof. The next prospective F10AG should organize full distinct *unordered* 36-pair Gram formula, but do NOT claim it here. Full simultaneous 36 gamma pair independence, complete 256 even PBW gamma images, even-Clifford gamma injection, source Spin9 faithfulness, Spin48 lift, original Fock realization and BFSS physical/spectral results remain OPEN.

Require pinned original F10AE/F10AD/F10E source hashes, strict Lean/Mathlib, full F10AE ancestry build, fresh warning-as-errors compiler, independent three exact types and axiom checks, immutable commit SHA/artifact. No sorry/admit/new axioms or increase of resource limits; owner research branch only; no merge/upstream PR.
