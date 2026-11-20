# RHOPF-P9C3D2G0B — original relational nonzero fixed vector intake

**Pacific date:** 2026-11-19.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED source-native and independently imported theorem until strict GREEN.  
**Accepted predecessor:** G0A R1 strict GREEN [#44668376890](https://github.com/etblink/math/actions/runs/44668376890), exact tested `e962730b181771c29144d0a17e9dcc1544f0d583`, acceptance `6ed03b52bc763d7d758925ac10ce9a4e1bd14c05`.

## Source-exact mathematical goal

```lean
theorem relationalProjector_exists_nonzero_fixed :
    ∃ v : SpinIndex → ℝ,
      (Matrix.toLin' relationalProjector) v = v ∧ v ≠ 0
```

The prior G0A nontrivial rank-four range supplies a nonzero vector in `LinearMap.range F`. Original idempotence G1B1 supplies `IsIdempotentElem F`. The exact Mathlib `IsIdempotentElem.mem_range_iff` transfers range membership to a projector-fixed vector; `Subtype.ext` transports nonzero out of the range subtype. This uses no source-specific 16x16 matrix expansion or selected coordinate basis.

## Strict qualification controls

Frozen original Gamma9 and P9* source hashes, exact new source and independent consumer hashes, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source-original integer fixture, exact import/theorem/namespace/axiom reports, 200000 heartbeat default, warnings-as-errors. Require native and independent Lean green and independently SHA-256 verified ZIP with embedded tested commit. Preserve any RED with exact diagnostic; no auto-acceptance.

## Scientific boundary

A nonzero projector-fixed vector can be normalized, but **this gate does not yet normalize it or prove `Nonempty RelationalUnitSpinor`**. That remains G0C, before the S³ homeomorphism and Hopf quotient. Original 48 Majorana/24-mode Fock action, gauge/Hamiltonian covariance, Spin(9) lifting, and physical hopfions remain independent obligations.
