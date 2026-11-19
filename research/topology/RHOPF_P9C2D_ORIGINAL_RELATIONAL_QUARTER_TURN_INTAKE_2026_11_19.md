# RHOPF-P9C2D — source-original relational quarter-turn extension

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** NATIVE AND INDEPENDENT STRICT CI PENDING, not qualified.

**Accepted predecessor:** P9C2C [run #44585835008](https://github.com/etblink/math/actions/runs/44585835008), exact source tested SHA `6f62ed77f2afed6c0ed5b3d9e4a97d5363785dbc`, qualification committed `ef552ea7e37be6b59577163de0e9007f6b8d42e6`.

## Exact mathematical objective

The original 16-real-dimensional Gamma9 source contains a qualified orthogonal projector P, rank_R(P)=4, image characterized by equality of three original bivector actions. The original matrix J=K13 P satisfies P²=P, Pᵀ=P, J²=-P, Jᵀ=-J, PJ=JP=J, JᵀJ=JJᵀ=P (all separately qualified through P9C2C).

Define one exact full-16 carrier matrix:

[
U = (I-P)+J.
]

On im(P), U=J (quarter turn); on ker(P), U=I. Propose and strictly test three exact original-source statements:

1. `relationalQuarterTurn_transpose`: `Uᵀ=I-P-J`.
2. `relationalQuarterTurn_transpose_mul_self`: `UᵀU=I`, so U is ambient real orthogonal.
3. `relationalQuarterTurn_square`: `U²=I-2P`, a sign flip on the rank-four sector and identity on its complement.

The proof uses only already-qualified *original source* P/J polynomial identities, and small abstract additive noncommutative-ring normalization. This builds a finite order-four phase representation as a controlled milestone toward an honest continuous S¹ action, without attempting a Hopf quotient or any original gamma matrix entries.

## Evidence policy and limitations

Frozen exact source/Gamma9/Fock/Core dependency hashes and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; source-exact independent integer fixture; native warning-as-error compilation; separate independent original-typed consumer; six allowed-only root axiom reports; original artifact with exact tested commit and SHA-256. No sorry/axiom/import-all, private signed-permutation copy, original source edit, heartbeat/resource override or change to accepted theorem statements.

Even if all three identities qualify, a continuous U(1) action and a Hopf S³→S² quotient are still separate mathematical gates. The selected original source-indexed coordinate basis equality remains open; prior direct column R1/R2 REDs must not be revisited naively. Fock-space implementability, SU2 physical gauge projection, Hamiltonian covariance, Noether current and particle/SM predictions are NOT established by this gate.
