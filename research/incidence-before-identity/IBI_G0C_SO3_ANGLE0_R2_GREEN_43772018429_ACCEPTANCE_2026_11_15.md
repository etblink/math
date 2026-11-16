# IBI-G0C-SO3-ANGLE0 — R2 strict GREEN acceptance

**Date:** 2026-11-15 Pacific  
**Research branch:** `research/bfss-incidence-unified-20261114`  
**Decision:** GREEN_QUALIFIED for an **abstract real unit-circle cosine/sine angle witness**. This gate does **not** prove universal SO(3) Euler decomposition, SU2→SO3 surjectivity, or physical BFSS/Fock/spectral statements.

## Reproducible exact evidence

- [Run #43772018429](https://github.com/etblink/math/actions/runs/43772018429): `completed/success`, attempt 1, tested commit `578cc3c387aaa96f9dd7e2412785b5de6f256c4e`; job `132989800336` all required steps `completed/success`.
- Exact pure-Mathlib source module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSO3Angle.lean`, Git blob `2bc7521a8f417ddd8e0e74370d3d014ddb200e2a`. Imports **only** `Mathlib`.
- Independent consumer `lean/diagnostics/BFSSIBIG0CSO3AngleIndependentConsumer.lean`, Git blob `9f98826ebf5321ebac3ecc66383f37e5361d4308`.
- Strict workflow `.github/workflows/bfss-ibi-g0c-so3-angle-strict.yml`, Git blob `ec8db4403b8312e8c46ec282a283331a82cc1882`.
- Frozen accepted source image pins `IBIG0CXImage.lean` `999a0c66110431d1c92aaaf6ca37b21f253a9501` and `IBIG0CZImage.lean` `e4623ef2e7ce825575a73f96e087bee17c4872ab`. No source image bytes changed.
- Original Lean `leanprover/lean4:v4.34.1` and Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612` checked.
- Cold source build `8924/8924`, separate `-DautoImplicit=false -DwarningAsError=true` source and independent consumer passed.
- Preflight marker `BFSS_IBI_G0C_SO3_ANGLE0_PREFLIGHT_PASS`; final audit marker `BFSS_IBI_G0C_SO3_ANGLE0_SOURCE_AND_CONSUMER_STRICT_GREEN`.
- `#print axioms FCP.BFSSIBIG0CSO3Angle.unitCircle_exists_angle` reported only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or unpermitted warnings.
- Independent consumer tests arbitrary real `c,s` with `c²+s²=1`, `(1,0)`, `(-1,0)`, `(0,1)` and `(0,-1)`, five cases.
- [Preserved artifact #14185221302](https://github.com/etblink/math/actions/runs/43772018429/artifacts/14185221302), size 1515 bytes per GitHub API; job-log ZIP SHA-256 `fad4b4cef289ff7d546fd9ebbbfdfd82abac2802cdbd207419263d1d894a9c0e` (GitHub reported; not independently downloaded/rehashed).

## Exact accepted statement

```lean
theorem FCP.BFSSIBIG0CSO3Angle.unitCircle_exists_angle
    {c s : ℝ} (h : c ^ 2 + s ^ 2 = 1) :
    ∃ θ : ℝ, Real.cos θ = c ∧ Real.sin θ = s
```

The implementation constructs `Complex.arg (⟨c,s⟩ : ℂ)` and proves nonzeroness from the norm-one hypothesis.

## Negative-knowledge preservation

- [R1 RED run #43766564997](https://github.com/etblink/math/actions/runs/43766564997), original tested SHA `742eafda208d31efd69b49193d0a1a652ad57c2e`, stopped in cold source build at `IBIG0CSO3Angle.lean:30:32`: unknown constant `Complex.ne_zero_of_norm_eq_one` copied from public QICLean donor (a different Lean/Mathlib toolchain); `sorryAx` was reported for incomplete R1.
- [Permanent R1 diagnostic](https://github.com/etblink/math/blob/578cc3c387aaa96f9dd7e2412785b5de6f256c4e/research/incidence-before-identity/IBI_G0C_SO3_ANGLE0_R1_RED_43766564997_DIAGNOSTIC_2026_11_15.md), artifact #14182467587, SHA256 `1062a9e405ce07e2c76bfd6a844691636db2134f59cfe809472a50a7adc1e643` (reported).
- R2 replaced only that nonexistent donor-helper invocation with a local norm-zero contradiction. The theorem statement and independent consumer were unchanged, and both accepted G0C axis image modules remained byte-for-byte frozen.

## Next mathematical boundary

**SO3-EULER**: independently prove for each `Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ`, three angles `α β γ` such that `(Q : Matrix (Fin 3) (Fin 3) ℝ) = rotZ α * rotX β * rotZ γ`, including `sin β=0` (both diagonal ±1) and nonsingular branches. Use only the qualified unit-circle angle lemma and abstract Mathlib geometry. The public [LionSR/QICLean EulerAngles donor](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean) contains a constructive proof but pins a different toolchain. A separate BFSS adapter can identify the qualified native Z/X images after the Euler geometry gate passes. The original G3A `adjointColorMatrix_mul` then assembles the explicit source-gauge witness.

**No claim of arbitrary SO3 decomposition or surjectivity yet.** Freeze accepted source blobs. No modifications to main, unified integration or frozen FCP.
