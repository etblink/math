# RHOPF-P9C3D2F0 — original Gamma9 Circle Euclidean quadratic form invariant intake

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED new source-native Lean proof candidate pending original strict and independently imported consumer GREEN.
**Accepted predecessor:** P9C3D2E3 R1 [#44648748805](https://github.com/etblink/math/actions/runs/44648748805), exact tested `7b2c3693ddd14b307163987dcffa3260ff427eb3`, qualification `94b65488f4ec5e4a29130b262c24b1548552f686`.

## Why this next gate?

The last accepted result establishes an explicitly defined free **algebraic** Mathlib Circle action on the nonzero rank-four original Gamma9 P-image, with three independently qualified identity/composition/trivial-stabilizer theorems. To restrict it to an intrinsic norm-one sphere we next need to establish source-exact Euclidean norm preservation. The frozen original circle matrix source already proves `rho(z)ᵀ * rho(z)=I`, so start with the narrower quadratic invariant on the unmodified original 16-real-spinor carrier.

Proposed single theorem:

```lean
theorem relationalCircleVector_dot_self
    (z : Circle) (v : SpinIndex → ℝ) :
    (relationalCircleVector z v) ⬝ᵥ
        (relationalCircleVector z v) = v ⬝ᵥ v
```

The proof is purely algebraic and source-exact:
[
(Mv)\cdot(Mv)
 = ((Mv)^\mathsf{T}M)\cdot v
 = ((M^\mathsf{T}M)v)\cdot v
 = v\cdot v.
]
It reuses accepted `relationalCircleMatrix_orthogonal` and pinned Mathlib `Matrix.dotProduct_mulVec`, `Matrix.mulVec_transpose`, `Matrix.mulVec_mulVec`, `Matrix.one_mulVec`. It introduces no coordinate matrices, new basis, Fock operators, new axioms, or global typeclass instance.

## Exact original native/independent strict checks

The new source imports only accepted P9C3D2E3; the independent consumer imports exactly the new theorem and typechecks it. Pin every original Core/Gamma9/projector/phase/Circle source and the new source/consumer Git blob hashes. Pin Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; run original signed-permutation integer fixture and native cold accepted dependency build; exact source import/declaration and balanced section/namespace preflight. Native and independently imported Lean consumers are compiled with warnings-as-errors and each original `#print axioms` must contain only `propext`, `Classical.choice`, `Quot.sound`, without `sorryAx` or compiler error. Original exact tested commit, original artifact ZIP digest and full GREEN/RED transcripts are preserved. Failed Lean compilation requires a narrow sourced repair, not increased resources or weakened theorems.

## Limits and later topology

This one theorem is **quadratic-form preservation**, not a complete norm-one subtype action proof. Subsequent gates will define `{v | Pv=v ∧ v·v=1}`, prove its action is closed, identity/composition/freeness and joint continuity, then supply source-derived dimension four and a topological identification of that unit sphere with `S³`; proving `S³/S¹ ≅ S²` requires separate quotient/orbit topology and explicit source compatibility. The full real 16-dimensional carrier contains a fixed 12-dimensional complement and is not a free action. Original BFSS 48-Majorana/24-complex-mode Fock implementation, full Spin(9), SU(2) gauge and Hamiltonian invariance, physical vortex protection and Standard Model observations remain independent unproved obligations.

Maintain permanent original negative knowledge (P9C3D2E1 R1 missing namespace, P9C3D2B R1 redundant rewrite, P9C3D0 R1/R2/R3 and predecessor native/consumer failures) and never modify `main` or unrelated original sources.
