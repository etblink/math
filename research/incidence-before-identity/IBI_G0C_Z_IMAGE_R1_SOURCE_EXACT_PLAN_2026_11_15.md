# G0C-Z-IMAGE R1 — source-exact adjoint rotation image candidate

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Status:** STAGED_NOT_QUALIFIED; wait for separate exact-commit strict source and consumer CI.

## Scientific gate
The parent [G0C-Z-GEN0 GREEN](https://github.com/etblink/math/actions/runs/43752271387) established a genuine original BFSS `sourceZGauge θ : GaugeGroup 2` with exact source diagonal matrix `diag(exp(-iθ/2), exp(iθ/2))`, no SO(3) image theorem. [G0C-INV-PAULI GREEN](https://github.com/etblink/math/actions/runs/43750250997) already transfers original BFSS G3A coefficients to the inverse-based trace `Re(tr(σ_B g σ_A g⁻¹))/2`.

This gate states exactly:
```lean
FCP.BFSSSU2GaugeG3A.adjointColorMatrix
    (FCP.BFSSIBIG0CNativeZGenerator.sourceZGauge θ) =
  !![Real.cos θ, -Real.sin θ, 0;
     Real.sin θ, Real.cos θ, 0;
     0, 0, 1]
```

The proof separates finite complex Pauli-trace calculation from the map `Complex.re` into BFSS's original real coefficient field. Independent consumer tests arbitrary θ and both asymmetric signs `R(θ) 1 0 = sin θ` and `R(θ) 0 1 = -sin θ`.

## Donor and constraints
The [QICLean EulerAngles.lean finite-component method](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean) (at commit `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`) is adapted for an original-source trace theorem, **not imported**. Its version Lean 4.36.0-rc1 does not match BFSS's pinned 4.34.1. All original G3A/BFSS source, accepted Pauli trace/inverse and Z-generator bytes remain frozen. No change to source orientation, no allowed `sorry`, only standard `propext`, `Classical.choice`, `Quot.sound`.

If R1 fails, preserve the exact typed proof diagnostics; use a small proof-architecture correction, not an unbounded tactic tweak loop. Stop after two analogous failures. The target is *not* full (SO(3)) surjectivity, not X-axis image, and not proof of kernel or physical/Fock equivalence. No edits to unified integration or main.
