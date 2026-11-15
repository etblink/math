# IBI G0C SO3-EULER — R1 independent abstract proof candidate

**Date:** 2026-11-15 Pacific.  
**Branch:** `research/bfss-incidence-unified-20261114`.  
**Status:** STAGED_NOT_QUALIFIED. Do not promote without exact-source cold strict CI.

The first **universal geometry** obligation is
```lean
(M : Matrix (Fin 3) (Fin 3) ℝ) →
  M ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ →
  ∃ α β γ : ℝ, M = rotZ α * rotX β * rotZ γ
```
with `rotZ` and `rotX` explicit, source-independent positive 3×3 rotations. Only project import: [accepted G0C-SO3-ANGLE0](https://github.com/etblink/math/actions/runs/43772018429), source blob `2bc7521a8f417ddd8e0e74370d3d014ddb200e2a`, whose unit-circle cosine/sine witness eliminates an earlier missing donor declaration.

**Licensed donor provenance:** The constructive proof is adapted with attribution/Apache-2.0 notice from [LionSR/QICLean EulerAngles.lean](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean), pinned source revision `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`. The external Lean 4.36.0-rc1 toolchain differs from pinned BFSS Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Its source is research, not evidence of qualified in-repo proof. Strict CI independently checks all tactics, statement and axioms in the native source.

The original donor proof extracts row and column orthogonality from the `SO(3)` membership, identifies `Mᵀ=M.adjugate` from determinant one, and proves cofactor certificates. It constructs (sβ = sqrt(1-M22²)), extracts β from the accepted circle lemma, and separates **gimbal-lock (sβ=0)** (both β=0 and β=π) from the regular branch (sβ≠0). Each of nine matrix entries is discharged by finite polynomial or cofactor identities. The two independent consumer examples quantify over both an arbitrary matrix with a membership certificate and a genuine `Matrix.specialOrthogonalGroup` element.

No new BFSS source group, gauge action, physical/Fock equivalence, spectral or full source surjectivity theorem is claimed. After strict GREEN, a distinct original-source adapter must compare these abstract `rotX/rotZ` definitions to qualified native BFSS `sourceRotX/sourceRotZ`, then assemble `sourceZGauge α * sourceXGauge β * sourceZGauge γ` using original `adjointColorMatrix_mul`. Preserve every RED with its typed goals. If two analogous proof elaboration failures recur, stop and compare a geometric axis-stabilizer route. Keep all accepted source bytes and unified integration/main unchanged.
