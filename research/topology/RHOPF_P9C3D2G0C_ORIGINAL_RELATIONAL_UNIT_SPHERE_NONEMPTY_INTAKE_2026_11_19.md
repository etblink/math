# RHOPF-P9C3D2G0C — exact original relational unit sphere nonemptiness

**Pacific date:** 2026-11-19.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until original native + imported independent strict GREEN with artifact verification.  
**Accepted predecessor:** G0B R3 strict GREEN [#44673328325](https://github.com/etblink/math/actions/runs/44673328325), tested `88328326104d22cf8750d05e0f374eec64accaa3`, accepted at `d173035882e340926b77c7ac10b1d97dd72f142f`.

## Mathematical contract

Prove exactly
```lean
theorem relationalUnitSpinor_nonempty : Nonempty RelationalUnitSpinor
```
by extracting nonzero original P-fixed spinor from G0B; proving its finite real dot self is positive via Mathlib `dotProduct_self_eq_zero`, `mul_self_nonneg` and a finite sum; scaling by inverse `Real.sqrt (v ⬝ᵥ v)`; transporting fixedness through the original `Matrix.toLin'` real linear map; proving the scaled dot-self is one with original dotProduct scalar identities and `Real.mul_self_sqrt`.

No replacement spinor, index basis choice, source matrix table or novel geometric structure. Retain P9C3D2F1's exact definition `RelationalUnitSpinor`. Do not change accepted original sources.

## Qualification criteria

Exact original BFSS Gamma9/source/G0B blob pin and new source/consumer pins, pinned Lean 4.34.1 + Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; source-original independent integer fixture; native and separately imported independent consumer compilation with warnings-as-errors, both axiom reports contain only `propext`, `Classical.choice`, `Quot.sound`; archived original ZIP independently SHA-256 verified against CI and exact embedded tested commit. Preserve REDs, no source changes to `main`, no elevated proof budget.

Success establishes a **nonempty** source-original norm-one projector sphere alongside P9C3D2F1/F2/F4's explicitly verified free continuous Circle action. It does NOT prove an S³ homeomorphism, Hopf quotient, Fock lift, gauge/Hamiltonian covariance or an observed physical hopfion.
