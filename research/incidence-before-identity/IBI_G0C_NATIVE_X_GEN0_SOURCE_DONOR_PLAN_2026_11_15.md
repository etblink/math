# IBI G0C-X-GEN0 original native X generator — bounded R1

**Decision date:** 2026-11-15 Pacific  
**Branch:** `research/bfss-incidence-unified-20261114`  
**Status:** STAGED_NOT_QUALIFIED pending independent strict CI.

Source-native `sourceXGauge β : GaugeGroup 2` is the actual original BFSS `Matrix.specialUnitaryGroup (Fin 2) ℂ`, with matrix `!![cos(β/2), -i sin(β/2); -i sin(β/2), cos(β/2)]`. Only exact special-unitary membership, subtype coercion, identity at zero and compatibility with accepted source inverse/star are tested here. Neither `R(X β)=rotX β` nor global `SU(2)→SO(3)` surjectivity is asserted.

**Donor:** [LionSR/QICLean EulerAngles.lean](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean), exact donor commit `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`, `su2Xrot_mem_specialUnitaryGroup` finite-matrix arithmetic. Adapted only as stand-alone source-local code; no QICLean imports or trust in Lean 4.36.0-rc1 results under BFSS's Lean 4.34.1.

**Accepted ancestors:** [Z image R2 GREEN](https://github.com/etblink/math/actions/runs/43755443223) at `182ca9b7d4f27e4c9f4f2d1a460a26eaaaa053fa`; [X prerequisite inverse-Pauli GREEN](https://github.com/etblink/math/actions/runs/43750250997), Z-generator, Pauli trace and native determinant-one all remain unchanged. The next distinct gate is **G0C-X-IMAGE**, requiring the true original (3×3) color-adjoint rotation and asymmetric sign checks, followed by a separate arbitrary-`SO(3)` Euler decomposition including singular cases before the full surjectivity existential can be proved. Older S1V52 quaternion/Euler modules still self-label STAGED and must not be silently promoted.

Strict workflow checks exact native source/consumer/donor bytes, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, a cold build, standalone source and consumer warning-as-error compilation, and standard-only `#print axioms`. Preserve failures and stop after two analogous compiler or consumer failures. Do not modify the unified integration branch, `main`, original FCP or previously accepted source artifacts.
