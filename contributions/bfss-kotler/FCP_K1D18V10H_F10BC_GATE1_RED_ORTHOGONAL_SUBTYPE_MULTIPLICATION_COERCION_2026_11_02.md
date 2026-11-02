# K1D18V10H F10BC — Gate 1 red: orthogonal-subtype multiplication coercion

**Date:** 2026-11-02 UTC / 2026-11-02 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `RED__NO_ACCEPTED_F10BC_ROOT`

## Immutable evidence

- Strict run: [#41451815156](https://github.com/etblink/math/actions/runs/41451815156), attempt 1.
- Exact tested commit: `2a16904937d431116086adb5f8d77e2fa5ca5132`.
- Exact Gate 1 candidate source blob: `be20c6b937c83eb16185e743e508d6bc55d76300`.
- Job: `125298598690`, `source-spin9-original-gamma-so16`.
- Artifact: `13144718561`.
- Artifact ZIP SHA256: `f14b4eeb5962845747c1f032cca54d5debe33a29803e01fc8f5c52065b9d3751`.

## What passed

- Exact source, toolchain, Mathlib, and accepted constructive-ancestry pins passed.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed.
- The entire accepted F10Q determinant-one ancestry rebuilt successfully: 8978 jobs.

## First material failure

The fresh F10BC compile failed at source line 55 in `map_mul'`. After rewriting the accepted orthogonal-group homomorphism with `rw [map_mul]`, Lean retained the coercion boundary

```lean
↑(source9SpinGammaOrthogonalHom g * source9SpinGammaOrthogonalHom h) =
  ↑(source9SpinGammaOrthogonalHom g) *
    ↑(source9SpinGammaOrthogonalHom h)
```

This equality is definitional after exposing the subtype multiplication, but `rw` alone does not close it. The independent exact-type/root-axiom audit was skipped. The printed `sorryAx` for the partially elaborated definition and dependent application theorem is a consequence of the failed elaboration and is not accepted evidence.

No F10BC declaration is accepted by Gate 1.

## Repair

Preserve every theorem statement, carrier, accepted dependency, and scope ceiling. Add only the missing definitional closure step `rfl` immediately after `rw [map_mul]`, update the exact source pin, and rerun the same strict gate.

This repair does not add an axiom, admission, linter suppression, theorem weakening, source substitution, or resource-limit increase.
