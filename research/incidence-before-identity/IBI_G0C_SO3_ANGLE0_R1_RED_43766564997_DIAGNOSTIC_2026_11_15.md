# IBI-G0C-SO3-ANGLE0 — R1 RED, missing donor lemma

**Decision date:** 2026-11-15 Pacific  
**Verdict:** RED_NOT_QUALIFIED, stage: source compilation.  
**Exact tested commit:** `742eafda208d31efd69b49193d0a1a652ad57c2e`

## Original evidence

- [Run #43766564997](https://github.com/etblink/math/actions/runs/43766564997) `completed/failure`; job `132972906421`, cold abstract source module step failed.
- Exact pinned Mathlib/Lean 4.34.1 preflight and toolchain restoration PASS. Cold `lake build` proceeded through its 8924th source module, where it failed at `IBIG0CSO3Angle.lean:30:32` with `Unknown constant Complex.ne_zero_of_norm_eq_one`.
- The QICLean public donor `LionSR/QICLean` commit `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac` used that helper; its Lean 4.36.0-rc1 era source cannot be presumed API compatible with the frozen Lean 4.34.1 / pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- The candidate theorem's `#print axioms` included `sorryAx` because of the missing constant, so R1 is **not accepted**; strict source and independent consumer not reached.
- [Preserved artifact #14182467587](https://github.com/etblink/math/actions/runs/43766564997/artifacts/14182467587) (GitHub API size 1257 bytes). Job-log artifact ZIP SHA-256 `1062a9e405ce07e2c76bfd6a844691636db2134f59cfe809472a50a7adc1e643` (GitHub-reported, not independently downloaded and rehashed).

## Bounded R2 repair

Replace only the source lemma invocation
```lean
have hz : (⟨c, s⟩ : ℂ) ≠ 0 := Complex.ne_zero_of_norm_eq_one hn
```
with the local proof
```lean
have hz : (⟨c, s⟩ : ℂ) ≠ 0 := by
  intro hzero
  rw [hzero] at hn
  norm_num at hn
```
This uses the already-established `‖(⟨c,s⟩ : ℂ)‖ = 1` and `‖0‖ = 0`, without new imports or unqualified donor lemmas. The original `unitCircle_exists_angle` statement and independent consumer remain byte-identical; only the strict workflow's source content pin updates. This R2 proof is a **candidate** until independent strict CI GREEN.

If R2 exposes a new typed issue, diagnose it precisely and preserve the failure; no unbounded adaptation or toolchain changes. This angle lemma is only a prerequisite for abstract arbitrary-SO(3) ZXZ decomposition, not surjectivity itself. No accepted G0C-X/Z, G3A or other original BFSS proof bytes modified; unified integration and `main` untouched.
