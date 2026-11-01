# F10AE Gate 1 RED — exact nested-sign proof repair

Date: 2026-11-01. Owner research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Negative evidence preserved
[Run #41343019280](https://github.com/etblink/math/actions/runs/41343019280), attempt 1, tested SHA `3d83678d43f625e936b88961282d176ce37dd01a`, concluded FAILURE. Artifact [#13097638524](https://github.com/etblink/math/actions/runs/41343019280/artifacts/13097638524), ZIP SHA256 `62823fc425b48214c5d22f5811f8a23cde27c1711d9fe421fd16366423a6651c`.

Exact original source pins, Lean 4.34.1 and pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, and accepted F10AD ancestry build PASSED. Strict F10AE warnings-as-errors compiler FAILED; independent two-declaration types and axioms audit SKIPPED.

Source-exact diagnostics: line 60 `neg_mul` was an unused simp argument, line 65 an unsolved negative sign goal `-(gamma b * -(gamma a * (gamma c * gamma d))) = gamma b * (gamma a * (gamma c * gamma d))`, line 66 `neg_neg` unused because the simplification lacked `mul_neg`. Consequently both candidate theorem declarations report `sorryAx` and are NOT accepted.

## Bounded Gate 2 candidate
Keep both public theorem statements unchanged and all previous accepted files pinned. At original F10AE source line 60, replace `simp only [mul_neg, neg_mul]` with `simp only [mul_neg]` (unused simp removal). At original line 66, add `mul_neg` so `simp only [neg_mul, mul_neg, mul_assoc, neg_neg]` first distributes the right-sided negative and cancels both signs. No source index or matrix carrier changes. Update only the F10AE source blob hash in the strict workflow.

This is a proof-tactic normalization, NOT mathematical falsification or license to weaken assumptions, disable linting, raise recursion/heartbeat limits, add axioms, or bypass strict independent declarations. Require fresh warning-as-error Lean and exact two-type/axiom verification before qualifying F10AE.

**Scope:** four-source gamma trace vanishing when a differs from b,c,d remains unqualified. Full 36 original gamma-pair independence, full 256 even gamma images, source Spin9 faithfulness, Spin48 lift, Fock action and BFSS physics remain open. No main branch merge or upstream PR.
