# K1D18V10H F10BB — Gate 1 red: structure-field rewrite location

**Date:** 2026-11-02 UTC / 2026-11-02 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `RED_INTERFACE_ERROR_NO_LIEHOM_ROOT_ACCEPTED`

## Immutable failure evidence

- Strict run: [#41437884545](https://github.com/etblink/math/actions/runs/41437884545), attempt 1, terminal failure.
- Exact tested commit: `a8a9ddb975c04605f3aedc8b984b18e33feefe2f`.
- Exact F10BB source blob: `5af9eaa5c8b11a91fe671c7841051ff2e0c6a3a6`.
- Job: `125252146181`, `original-gamma-canonical-skew-liehom`.
- Exact source and accepted-ancestry pins passed.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore passed.
- The complete accepted F10BA ancestry rebuilt successfully.
- Fresh F10BB warnings-as-errors compilation failed; the independent exact-type/root-axiom audit was skipped.
- Artifact: `13137917249`.
- Artifact ZIP SHA256: `4580811a0d94a84b6eb359360b9e6f6dbee237c00033ca928f249844d6b18691`.

## Earliest material failure

Lean reported three instances of:

```text
Unexpected term A.property; expected single reference to variable
```

(and the analogous `B.property`) at attempts to execute

```lean
rw [LieAlgebra.Orthogonal.mem_so] at A.property
```

The issue is tactical location syntax: `rw ... at` accepts a local hypothesis variable, not a projected structure field. This does not refute the accepted skew-image theorem, F10BA bracket preservation, or the intended canonical carrier types.

The subsequent `sorryAx` reports arise from the failed definition elaboration and qualify no declaration.

## Bounded repair

Copy each membership field into a local hypothesis:

```lean
have hA_mem := A.property
rw [LieAlgebra.Orthogonal.mem_so] at hA_mem
```

Then use the rewritten local proof. Preserve the exact canonical `LieAlgebra.Orthogonal.so SpaceIndex ℝ →ₗ⁅ℝ⁆ LieAlgebra.Orthogonal.so SpinIndex ℝ` type and all mathematical dependencies. Do not raise limits, weaken the theorem, add axioms or admissions, suppress linters, or import the paired-48 carrier.
