# RHOPF-P9C3D2G1D1A — positive radius homogeneity source-exact strict intake

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Disposition:** UNQUALIFIED pending source-native and independent-consumer strict GREEN.

## Qualified starting point

G1D0 strict [#44709845743](https://github.com/etblink/math/actions/runs/44709845743) at tested SHA `997db333ad121db2a70fca7995ccb9fc23587c1a`, accepted in `4a5c9c9b864ac0e72af2e40021c1bc3e3758e4d7`. G1D0 constructed source-original Gamma9 Q-unit → standard Euclidean dot-one sphere continuous map `F(x)=s(x)⁻¹ • x` and reverse continuous map `G(y)=r(y)⁻¹ • y`. This is NOT YET a homeomorphism: G(F(x))=x and F(G(y))=y remain unqualified.

## Small bounded analytic adapter

Prove source-original Gamma9 square-root radius and standard Euclidean square-root radius degree-one homogeneity for **nonnegative** real scalars:
```lean
theorem relationalRangeCoordinateRadius_smul_nonneg
    (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateRadius (t • x) =
      t * relationalRangeCoordinateRadius x

theorem standardCoordinateRadius_smul_nonneg
    (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    standardCoordinateRadius (t • x) =
      t * standardCoordinateRadius x
```
Use only accepted `Q(t•x)=t*(t*Q(x))` (G1C4), accepted `(t•x)⬝ᵥ(t•x)=t*(t*(x⬝ᵥx))` (G1C9), and exact pinned Mathlib `Real.sqrt_mul (mul_self_nonneg t)` and `Real.sqrt_mul_self ht` (verified in pinned `Mathlib/Analysis/Real/Sqrt.lean`). This keeps eventual inter-sphere inverse identities as separate D1B gate instead of mixing them with untested radius interfaces.

## Guardrails

All original Gamma9 projector/spinor sources, G0A/B/C, G1A/B/C0/C1/C2/C3/C4/C5/C6/C7/C8/C9/D0 exact source SHA pins, source-independent original integer fixture, new exact native and independent-consumer pins, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warnings-as-errors source and independent consumer, both `#print axioms` restricted to `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`, independently verified original artifact ZIP checksum and embedded tested SHA. Preserve REDs; no proof-budget changes or `main` writes.

Neither map inverse, `S_Q\simeq S³` homeomorphism, Hopf S¹ equivariance/quotient, physical 48-Majorana Fock action, Hamiltonian/gauge covariance nor stable hopfion is claimed by this gate.
