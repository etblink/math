# RHOPF-P9C3D2A — original Gamma9 Circle action on real spinor vectors intake

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED new original-source Lean gate pending native and independent strict CI.
**Accepted predecessor:** P9C3D1 R1 [#44623409156](https://github.com/etblink/math/actions/runs/44623409156), exact tested SHA `588eb70bb8f364617a29be82950c4fcc16676430`, acceptance commit `8e967a879696a925fbc068229518c85f3e73cb8b`.

## Mathematical scope

On the original real 16-spinor carrier `SpinIndex → ℝ`, with `SpinIndex=Fin 16` from the untouched original BFSS Core, define
[
\mathrm{act}(z,v) := \rho(z) *_{\mathrm{vec}} v, \qquad z\in\mathrm{Circle},
]
where `rho(z)` is the exact already-qualified original Gamma9 real orthogonal matrix representation.

The only two new source-original theorem statements are:
1. `relationalCircleVector_one (v)`: `act(1,v)=v`.
2. `relationalCircleVector_mul (z w v)`: `act(z*w,v)=act(z,act(w,v))`.

This tests the exact vector-level identity and composition properties using only `relationalCircleMatrix_one`, `relationalCircleMatrix_mul`, and pinned Mathlib `Matrix.one_mulVec` / `Matrix.mulVec_mulVec`; no re-derivation of the gamma entries. The gate does not assert a global instance `MulAction Circle (SpinIndex → ℝ)` because registering a typeclass instance may alter unrelated code; a bundled independent vector-action interface can be considered in a separate bounded gate. This specific gate also does not claim joint continuity of the action, even though matrix-map continuity is now accepted.

## Frozen strict contract

Pin original untouched BFSS Gamma9 and Core files, accepted P9C3D0 and P9C3D1 source, pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact original independent signed-permutation fixture, new source and independent consumer bytes. Preflight explicitly checks the exact imports, two theorem names, one source noncomputable def, two root axiom reports per source/consumer, and balanced consumer/source sections to avoid P9C3D0's previous syntax failures. Native/consumer compilation uses warnings-as-errors with unchanged time/resource limits. All original artifacts must preserve original tested SHA and original ZIP SHA-256, with no `sorryAx`.

## Scientific caveats and stop rules

The action on the full 16-spinor carrier is not free: the complement of the selected rank-four `P` is fixed by the phase circle, so freeness on the full unit sphere cannot be asserted. Any later Hopf proof must restrict to the **unit sphere of the rank-four relational image** and prove preservation, freeness, and an explicit orbit/quotient equivalence. No claim of a physical BFSS fermionic Fock implementer, gauge/Hamiltonian commutation, physical vortex protection, Spin(9) centralizer or Standard Model observable is made. Failed independent consumer and source proof attempts remain part of the canonical negative-knowledge ledger.

If the new source proof fails for matrix-vector rewriting, inspect exact native Lean diagnostics and fix a precisely diagnosed issue; do not silently change theorem statements, weaken CI, duplicate source matrices, or raise resources.
