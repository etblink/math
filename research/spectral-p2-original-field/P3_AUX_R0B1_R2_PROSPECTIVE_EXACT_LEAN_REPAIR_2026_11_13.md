# P3-AUX-R0B1 R2 — bounded source-exact repair for genuine reciprocal L-infty

Date: 2026-11-13 Pacific. Status: **STAGED / UNQUALIFIED until independent strict run**.
Predecessor: [R1 RED #43513258078](https://github.com/etblink/math/actions/runs/43513258078), exact tested commit `1c36cb1786d297db1d8aa433a9a25d9f61b423a4`; [immutable first-causal red ledger](P3_AUX_R0B1_R1_RED_43513258078_FIRST_CAUSAL_2026_11_13.md).

## Changes — no change of mathematical statement or six roots

1. In `originalReciprocalField_norm_le`, complete the real/complex norm normalization by `Real.norm_eq_abs` and positivity lemma before directly using accepted `originalRadialWeight_inv_le`. This addresses Lean R1 line 35.
2. Use `(⊤ : ℝ≥0∞)` in the genuine `MemLp` and `Lp` exponents on source **and independent consumer**. This addresses the R1 parser failures at lines 39 and 46. The infinite-measure space is unchanged.
3. Keep `P3AuxR0AOriginalRadialScalar.lean`, original `Core.lean`, compiler pins, strict workflow, names and six exact `#print axioms` roots unchanged.
4. No axiom, `sorry`, `admit`, alternative Hilbert carrier, finite-volume proxy or weakened mathematical hypothesis is added.

## Strict qualification rule

A future exact tested-commit GREEN must independently compile original source and consumer under Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, check the six actual axiom roots against `[propext, Classical.choice, Quot.sound]` and retain first-causal logs. **This memo is not a theorem certificate.**

Mathematical target: continuous reciprocal original `Boson 2` complex field with bound, `MemLp` infinity and exact `Lp ℂ ⊤ volume` AE representative. No `FullL2 2` bounded multiplier, finite sixteen-charge `PiLp` multiplier, weighted closed charge, domain density, auxiliary Hamiltonian, singlet Hardy bound, ground state or spectral gap asserted.

Keep original M5BF0 and R0A accepted states untouched.
