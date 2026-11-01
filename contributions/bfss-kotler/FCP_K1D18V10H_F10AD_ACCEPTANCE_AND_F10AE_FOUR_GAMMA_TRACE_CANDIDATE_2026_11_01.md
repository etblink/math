# F10AD accepted; F10AE four-gamma trace candidate

Research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`; date 2026-11-01; accepted parent `b3ebd32135b8d2efe98dbb871aff9fd04feb2775`.

## Accepted F10AD Gate 2
[Run #41341740848](https://github.com/etblink/math/actions/runs/41341740848), attempt 1, completed SUCCESS at parent SHA, strict pinned source, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AC rebuild, warnings-as-errors compiler, independent exact three theorem declarations and root-axiom audit `V10H_F10AD_THREE_FIXED_LEFT_COEFF_TYPES_AXIOMS_PASS`. Allowed only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`. [Artifact #13097702864](https://github.com/etblink/math/actions/runs/41341740848/artifacts/13097702864) ZIP SHA256 `39c90696475c3aab20b193dea2545a88e863320eaeb63a419d39be1f9d282aec`.

Negative knowledge: [Gate 1 RED #41340651169](https://github.com/etblink/math/actions/runs/41340651169), unqualified `mul_sum` reference caused an incomplete proof and cascading `sorryAx`; pinned Mathlib confirms correct `Matrix.mul_sum`. [Artifact #13097154176](https://github.com/etblink/math/actions/runs/41340651169/artifacts/13097154176). Gate 2 accepted unchanged all three theorem statements.

## F10AE candidate
Exact ORIGINAL public source gamma fields only; original F10E/F10AB/F10AD ancestry. Show:
1. `source9OriginalGamma_four_word_trace_zero`: for `a≠b`, `a≠c`, `a≠d`, trace of `gamma a * (gamma b * gamma c * gamma d)` vanishes. Prove by THREE source Clifford anticommutations and Matrix.trace_mul_comm, no private gamma signed-permutation tables.
2. `source9OriginalGamma_pair_four_word_trace_zero`: equivalent trace((gamma a * gamma b) * (gamma c * gamma d)) vanishes. This closes the disjoint-index source pair Gram cross case without assuming injectivity.

These are source-exact matrix word statements. They do NOT prove all unordered-pair Gram cases, 36 gamma pair independence, the 256 even-Clifford gamma basis independence/injectivity, source Spin9 → original paired SO48 faithful action, global Spin48 lift, Fock operators or BFSS physics.

Strict gate must rebuild accepted F10AD ancestry and independently check exact two theorem types and axiom allowlist with fresh warning-as-error Lean, frozen pins and artifact. Do not mutate accepted files, increase resource limits, introduce unproved axioms or publish upstream.
