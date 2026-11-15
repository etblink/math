# IBI-G0C-SO3-ANGLE0 — abstract angle existence candidate

**Date:** 2026-11-15 Pacific
**Branch:** `research/bfss-incidence-unified-20261114`.
**Status at creation:** STAGED_NOT_QUALIFIED pending separate exact-source CI, independent consumer and strict axiom audit.

## Motivation and trust boundary

[Original BFSS X-image R2 GREEN #43761025397](https://github.com/etblink/math/actions/runs/43761025397) and [Z-image GREEN #43755443223](https://github.com/etblink/math/actions/runs/43755443223) verify source-native rotation images and signs. The immediate remaining abstract geometry is arbitrary-Q SO(3) ZXZ decomposition, including gimbal-lock singularities. This microgate proves only:

```lean
{c s : ℝ} → c ^ 2 + s ^ 2 = 1 →
  ∃ θ : ℝ, Real.cos θ = c ∧ Real.sin θ = s
```

It uses only `import Mathlib` and an independent consumer testing arbitrary unit-circle pairs, `(±1,0)`, and `(0,±1)`. No reliance on source BFSS, generic SU2-to-SO3 surjectivity, physical/Fock assertions or unqualified quaternion/Euler modules.

**Public donor:** [LionSR/QICLean EulerAngles.lean, lines approximately 189–199](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean), pinned snapshot `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`. Donor's `exists_cos_sin` argument uses `Complex.arg` of the nonzero unit complex number. Donor's Lean 4.36.0-rc1 environment is different from native accepted Lean 4.34.1; this proof must compile independently. No QICLean package import.

**Next only after GREEN:** stand-alone `SO3-EULER` theorem in `Matrix.specialOrthogonalGroup (Fin 3) ℝ`, using row/column orthogonality, adjugate/determinant-one cofactor identities, unit-circle angle witnesses and two branches `sβ ≠ 0` / `sβ = 0`. After its independent gate, adapt its abstract matrices to accepted original-source `sourceRotZ` and `sourceRotX`, then prove universal native witness using already present original `adjointColorMatrix_mul`.

**No claims of SO(3) decomposition, any-gauge kernel, spectral/physical facts or full surjectivity from this helper.** Freeze previously accepted source and diagnostic bytes. Preserve any RED compiler output, apply two-analogous-failure stopping rule, never use sorryAx as an accepted proof. No updates to unified integration, main or FCP.
