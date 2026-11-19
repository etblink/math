# RHOPF-P9C3D2B — projector-sector invariance gate intake

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** New original-source Lean candidate, UNQUALIFIED until original native and independent strict GREEN.
**Accepted predecessor:** P9C3D2A R1 [#44626196617](https://github.com/etblink/math/actions/runs/44626196617), exact SHA `dc9d5ecd010b9c1e5a9246081a58a5240f5f21db`, accepted in commit `1f17e461b7bbfa571d6e69f056f15a1ec1a87fa5`.

## Mathematics and source exactness

The original pinned Gamma9 real 16-spinor matrices support the exact rank-four source projector `P=relationalProjector`, partial phase `J=relationalPhaseJ`, complement `Q=1-P`, and continuous circle representation `rho`. The source fixes `P²=P`, `PJ=JP=J`, `PQ=QP=0`, and `R(a,b)=Q+aP+bJ`, without any use of gamma-entry coordinates.

The bounded gate proves two native source theorems:
1. `relationalProjector_commutes_circleMatrix (z)`: `P*rho(z)=rho(z)*P`.
2. `relationalCircleVector_preserves_projector_image (z v) (hv:P.mulVec v=v)`: `P.mulVec (rho(z).mulVec v)=rho(z).mulVec v`.

The first uses the exact accepted original projector/complement/phase algebra and matrix scalar multiplication; the second uses exact matrix-vector associativity and the first theorem. The separate consumer imports the source, tests both exact types and both axioms reports, with no private gamma-table reproduction or modifications to any original physical source.

## Strict workflow

An exact original test uses Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original signed-permutation integer source fixture, frozen canonical source hashes, target and independent type consumer bytes, strict warnings-as-errors, exact proof contracts, balanced section and namespace preflight, the native original source dependency cold build, both source and independent axiom reports with only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, and retained original artifact ZIP and embedded tested SHA. Red failures remain permanent diagnostic evidence rather than trigger for unsound tactical shortcuts or resource escalation.

## Physics boundary

Commutation with the original projector demonstrates invariance of the *rank-four real relational image*, not freeness, a topological (S^3\to S^2) quotient, or a Hopfion. The 12-real-dimensional complementary subspace stays fixed, so claiming freeness on the full spinor sphere would be false. A later gate must treat the `P`-image and its unit sphere intrinsically and prove nonzero orbits/freeness. Spin(9) equivariance, original 24-mode physical Fock implementation, SU(2) Gauss-law and Hamiltonian commutation, empirical observable claims, and any Standard Model connection remain independent obligations.

Preserve all historical RED/GREEN and original operator source; never write `main` or fork another research branch.
