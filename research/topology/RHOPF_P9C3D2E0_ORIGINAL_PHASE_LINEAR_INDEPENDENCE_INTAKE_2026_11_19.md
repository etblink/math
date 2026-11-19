# RHOPF-P9C3D2E0 — original Gamma9 real-linear phase coefficient uniqueness intake

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED candidate pending exact native and independently imported Lean strict GREEN.
**Accepted predecessor:** P9C3D2D R1 [#44636667539](https://github.com/etblink/math/actions/runs/44636667539), tested `9e42db287a7a1cca34a68952349762b6ecc11da0`, accepted `b46aea83e6e3de2b3cc9bcdd9232c405e02f503e`.

## Mathematical contract

For original real 16-spinor carrier `SpinIndex → ℝ`, source rank-four projection `P`, and phase `J` with accepted `J²=-P`, the one new qualified-if-GREEN theorem target is:

```lean
theorem relationalPhaseJ_linear_coefficients_unique
    (c d : ℝ) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0)
    (h : c • v + d • relationalPhaseJ.mulVec v = 0) :
    c = 0 ∧ d = 0
```

The proposed native proof sets `w=Jv`, proves `Jw=-v` from `J²=-P` and `Pv=v`, applies `J` to the linear dependence to obtain `c w-d v=0`, and takes the real linear combination
[
(c^2+d^2)v=c(cv+dw)-d(cw-dv)=0.
]
Since `v ≠ 0`, `c²+d²=0`, then positivity in `ℝ` forces `c=d=0`.

This is an original-source real-linear independence theorem on the projector image; not yet the Mathlib `Circle` fixed-point theorem, global freeness or Hopf quotient.

## Strict original-source and independent qualification

Reuse exact-pinned original Gamma9 and BFSS Core, accepted original P/J/Q/phase and D2D source, independent integer signed-permutation Gamma9 fixture, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact new theorem and independently imported source-typed consumer, frozen SHA for all accepted dependencies, warning-as-error original and independent builds. Both root axiom reports must contain only `propext`, `Classical.choice`, `Quot.sound`, with zero `sorryAx` and strict artifact ZIP/tested-SHA integrity. Source-contract preflight separately checks imports, theorem names, absence of illicit declarations, balanced noncomputable sections and namespace closures, with no global resource-limit increase. If native Lean fails, preserve original complete RED/axiom and stop for a narrow correction; no inferred success.

## Interpretation and stop rules

On the original rank-four image, `v` and `Jv` being independent would be the exact algebraic mechanism that stops `R(a,b)` from fixing `v≠0` except at `(a,b)=(1,0)`. We will need an additional strict source-typed theorem specializing to `Circle` and, beyond that, a verified continuous action on a specifically defined `P`-image *unit sphere*. A genuine topological quotient, physical 24-complex-mode Fock-space lift, gauge/Hamiltonian covariance, Spin(9) centralizer and Standard Model observables remain independent unproved obligations. Preserve the ambient 12-dimensional fixed complement and all original prior RED evidence.
