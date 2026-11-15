# IBI-G0C-INV-PAULI R1 staged boundary — source-exact inverse formula

**Date:** 2026-11-15 Pacific
**Branch:** `research/bfss-incidence-unified-20261114`
**Status:** STAGED_NOT_QUALIFIED until an independently verified strict CI green.

## Accepted source dependency
- [G0C-PAULI-TRACE R5 GREEN](https://github.com/etblink/math/actions/runs/43748016863), at tested `a10167e0fefde8ddcac5d6ae8d6aa233fbf95aab`; original trace source blob `b3fc2604a8536cef7c5d0a1a6ca9ba12eccd4c8f`.
- [G0C acceptance record](https://github.com/etblink/math/blob/f7628a32a968e79c58705668f488608122f9e844/research/incidence-before-identity/IBI_G0C_PAULI_TRACE_R5_GREEN_43748016863_ACCEPTANCE_2026_11_15.md).
- [G0B1 native det-one GREEN](https://github.com/etblink/math/actions/runs/43733883094).
- `GaugeGroup 2` means literal `Matrix.specialUnitaryGroup (Fin 2) ℂ` in `lean/OAI/MathematicalPhysics/BFSS/Core.lean`.

## Donor and proof boundary
- [QICLean Basic.lean at pinned snapshot](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/Basic.lean) uses `Matrix.inv_eq_left_inv (Matrix.mem_unitaryGroup_iff'.mp hu)` to show a unitary matrix inverse equals its star, after splitting special-unitary membership via `Matrix.mem_specialUnitaryGroup_iff`. We adapt only this narrow source-local Mathlib lemma pattern; no QICLean package import or external theorem qualification.
- For arbitrary source `g : GaugeGroup 2`, candidate `sourceGaugeMatrix_inverse_eq_star` states `(g : ColorMatrix 2)⁻¹ = star (g : ColorMatrix 2)`.
- With the accepted original conjugate-transpose trace formula, candidate `originalAdjointColorMatrix_pauliInverseTrace` states `R(g) B A = Re(tr(σ_B g σ_A g⁻¹)) / 2`.
- Both remain candidates until strict native source cold build, exact pinned source, standard axiom audit and a separate consumer are all green.
- This is the inverse-vs-conjugate-transpose interface, NOT a `GL (Fin 2) ℂ` lift or full QICLean equivalence, and NOT surjectivity onto `SO(3)`.
- Original Pauli gate and other accepted source bytes must remain frozen. No version changes; Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Stop after two analogous failures, preserve negative CI evidence and investigate typed goals. No edits to unified integration, main or frozen FCP.
