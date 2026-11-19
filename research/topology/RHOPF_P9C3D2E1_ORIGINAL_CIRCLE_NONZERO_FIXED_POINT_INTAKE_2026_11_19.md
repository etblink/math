# RHOPF-P9C3D2E1 — source-exact Mathlib Circle fixed-point criterion intake

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED candidate pending exact native and independent strict CI.
**Accepted predecessor:** P9C3D2E0 R1 original [#44639024919](https://github.com/etblink/math/actions/runs/44639024919), exact tested SHA `cd330ce88d8e017a30209dc306d3093e3e506bbf`, accepted in `07f04792754609db789ad11e8045311120f389ae`.

## Purpose and original-source theorem

The source-original BFSS Gamma9 real 16-spinor vector carrier already has qualified `P²=P`, `J²=-P`, `R(a,b)=Q+aP+bJ`, continuous Mathlib `Circle` matrix representation, pointwise action on real vectors, invariance of the `P`-image, `R(a,b)v=av+bJv` on that image, and real independence of `v` and `Jv` whenever `Pv=v`, `v≠0`.

Test exactly the new theorem:

```lean
theorem relationalCircleVector_fixed_point_implies_one
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0)
    (hfix : relationalCircleVector z v = v) :
    z = 1
```

The proof unfolds only the *accepted* vector action and original real phase interface, then rewrites `hfix` using source-verified `relationalCirclePhase_mulVec_on_projector_image`. Rearranging gives
[
((z:\mathbb C).re-1)v + (z:\mathbb C).im(Jv)=0.
]
Apply strict-qualified `relationalPhaseJ_linear_coefficients_unique` to obtain `(z:ℂ).re = 1` and `(z:ℂ).im = 0`; Mathlib's `Circle.ext` and `Complex.ext` then give `z=1`. Exact original gamma matrix entries and basis choices are never accessed.

## Audited obligations

- Exact native warning-as-error Lean compilation and independent source-typed consumer with zero source/consumer errors.
- Native and independent `#print axioms` for the single new theorem, allowing only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- Frozen exact original Gamma9/Core/accepted P-J-Q plus circle phase/continuity/vector/projection/linear independence sources, signed-permutation independent original integer fixture, exact new source/consumer hashes, imports/declaration/section grammar preflight, pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Original exact-tested SHA, original GitHub artifact download, matching independent SHA-256 and retained original native/independent logs, including any RED failure and sorryAx.

**STOP** if native proof or independent check is RED. Preserve the original failing log and repair only the demonstrated issue without relaxing theorem, pins, warnings, axiom policy or proof resources. No branch other than canonical unified integration, no original Gamma9/physical edits.

## Physical and topology boundary

A qualified fixed-point criterion implies algebraic freeness of this action on the *nonzero original rank-four P-image*, as a paper-level deduction. However the gate alone does **not** package/verify a continuous action on an intrinsically defined norm-one source `P`-sphere, prove nonemptiness and homeomorphism to `S³`, or construct the quotient `S³/S¹≈S²`. The original full real 16-spinor carrier contains an invariant 12-dimensional fixed complement, so **the full 16-dimensional action is not free**. Original 48 Majorana / 24 complex-mode physical Fock representation, Spin(9) compatibility, SU(2) gauge and Hamiltonian symmetry, stable vortex/hopfion interpretation, and Standard Model predictions remain separate unproved obligations.
