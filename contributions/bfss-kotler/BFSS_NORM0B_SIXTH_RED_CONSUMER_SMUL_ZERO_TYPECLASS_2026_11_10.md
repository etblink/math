# NORM-0B sixth strict red — final independent consumer scalar-zero instance inference

**Date:** 2026-11-10 Pacific / 2026-11-11 UTC. **Status:** STRICT RED — independent consumer only, proposed bounded repair UNCOMPILED. No source or physical model changes.

## Exact receipt

- Run: https://github.com/etblink/math/actions/runs/42970882167
- Tested commit: `9750450b4663f0f4263aeabb1365895cc1136071`; job `130358820647`; completed red 2026-11-11 06:27:52 UTC.
- Artifact ID `13834585084`, ZIP SHA256 `ec5c9cd603284b82cd1e6e49fcf5d41ce8b3b98ac6b4a204acac133608f971d8`.
- Frozen 106 blob preflight succeeded. Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. All 9068 source build jobs completed; all four NORM-0B source roots reported only standard axioms `propext`, `Classical.choice`, `Quot.sound`.
- **First consumer success:** `originalColorQuadratic_neg_from_real_smul` now compiles and has only allowed axioms. Explicit typed real-to-complex `-1` calc proved useful; preserve it.
- **Sole compiler error:** `diagnostics/BFSSNORM0BOriginalFockQuadraticRealLinearGramSumConsumer.lean:53:8`, `SMulZeroClass ℂ ?m.34` typeclass instance problem stuck. The consumer applied a bare `exact smul_zero (coeff : ℂ)` without enough result-type information for Lean to resolve the implicit operator type. `sorryAx` only reflects the failed elaboration of this consumer and is not a successful proof.
- Existing NORM-0B source `78cf0db748fc7d98bcd1f6c2629d75742c6d8097` is frozen; 104 accepted parent blobs remain frozen.

## Bounded patch

- Previous consumer blob `e0785e77a84817b73b5cf6d0bba06eff9ca3e318`; new candidate consumer blob `6076229e5fbba92f33906abb2e88e5dbb7d9e41e`.
- Keep original zero-matrix Gram decomposition, both `Finset.sum_eq_zero` steps, all imports, all theorem statements and six axiom checks.
- Replace **only** `exact smul_zero ((originalSpatialGram x i j : ℝ) : ℂ)` at the final leaf goal with `simp only [smul_zero]`. Unlike a bare `smul_zero` term with an uninstantiated result-carrier metavariable, the local simplifier matches the scalar action in the fully typed target `Fermion 2 →L[ℂ] Fermion 2`.
- One consumer hash changed in 106-blob manifest. Previous workflow `a6e24263f3432ee2ee77202d6bcfd7745ae3af71`, new workflow `f9000d3445864773aad8d11af9c85eaead5a647c`; source pin and ancestry unchanged. No weakening of independent-cold-build, warning, axiom or diagnostic requirements.

**Warning:** The change is source-inspected and minimal but *not locally compiled*. A new strict cold source + consumer green is required for NORM-0B qualification. If red, inspect the exact new goal, prefer an explicit `show` or `change` with the original Fock operator type, and record the first causal diagnostic. Do not restart NORM-0C or original FullL2 work until qualification.
