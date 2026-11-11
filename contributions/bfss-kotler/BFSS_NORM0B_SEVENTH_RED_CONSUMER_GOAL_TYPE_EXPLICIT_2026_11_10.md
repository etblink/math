# NORM-0B seventh strict RED — last consumer leaf requires proof-shape change

**Date:** 2026-11-10 Pacific (2026-11-11 UTC). **Status:** STRICT RED, proposed repair uncompiled and unqualified.

## CI evidence
- Run: https://github.com/etblink/math/actions/runs/42972917456
- Exact tested commit: `a08e955bed8894edf986d93a706b5d9ae48f3ae1`
- Job `130365307227`; failed 2026-11-11 06:46:40 UTC
- Artifact `13834823009`; ZIP SHA-256 `d7efb2ca45fbe0310c99478c5121db0a96f45a561d66b2901aba9de4730475f0`
- All 106 source/consumer blob pins passed; pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; all 9,068 source build jobs passed; all 4 NORM-0B source roots and first independent consumer reported permitted axioms only.
- **Sole failure:** diagnostic line 53, final leaf of `originalFockGramObservable_zero_B`: `simp only [smul_zero]` returned `simp made no progress`; consumer `sorryAx` is failed elaboration. This follows the previous attempt's `SMulZeroClass ℂ ?m.34` under an unconstrained term `exact smul_zero coeff`. Neither report establishes a source theorem defect.

## Revised proof shape
The first consumer's successful explicit real/complex scalar calc stays byte-for-byte unchanged. The second consumer still uses the new exact 81-term sum theorem, simplifies both original gamma-zero matrix products and the original `Q(0)` identity, then independently proves two nested finite sums vanish. Replace only the last leaf:

```lean
  first
  | rfl
  | exact (show
      ((originalSpatialGram x i j : ℝ) : ℂ) •
        (0 : Fermion 2 →L[ℂ] Fermion 2) = 0
      from smul_zero ((originalSpatialGram x i j : ℝ) : ℂ))
```

The `rfl` branch discharges a possibly already reflexive target without requiring simplifier progress; the other branch explicitly fixes the genuine original bounded Fock operator carrier, solving the earlier undetermined `SMulZeroClass` instance. The goal itself is not printed in the old CI logs, so this remains a **candidate** rather than a claimed compilation result.

- Previously failed consumer blob `6076229e5fbba92f33906abb2e88e5dbb7d9e41e`, candidate blob `8ca4e9fc4231ad34698a6fc65a4f91837f0ef94f`.
- Workflow previous blob `f9000d3445864773aad8d11af9c85eaead5a647c`, candidate blob `07c17cca5900f3669658bc7e4d9bc66b0b19dba9`.
- Original mathematical source frozen `78cf0db748fc7d98bcd1f6c2629d75742c6d8097`; 104 previously qualified parent blobs frozen; only one consumer pin changes among 106.
- Import closure, both theorem statements, six axiom-root checks, cold pinned source/consumer compilation, diagnostics and warnings unchanged.

## Stop rules
Require a fresh strict green before NORM-0B qualification. If it fails, print the precise remaining elaborator goal at the already isolated consumer leaf or use the alternative additive-zero proof, not more speculative `simp` attempts. Preserve all negatives; do not start NORM-0C or claim `FullL2 2` or source Hamiltonian spectrum or mass gap.
