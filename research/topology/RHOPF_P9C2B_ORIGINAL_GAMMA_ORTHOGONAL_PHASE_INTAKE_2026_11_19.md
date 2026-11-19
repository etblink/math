# RHOPF-P9C2B — original Gamma9 symmetric projection / skew relational phase

**Date:** 2026-11-19.
**Branch:** `integration/bfss-unified-research-20261108`.
**Status:** NEW STRICT NATIVE CANDIDATE. Not qualified until original source + independently typed consumer CI passes.
**Accepted input:** P9C2A strict [run #44579965448](https://github.com/etblink/math/actions/runs/44579965448), original SHA `50ce9fb073e2a980045c3657231bf691027bfd83`, qualification evidence commit `e0523d5bc15ecc900b736f3e7d8977b3a135a6db`.

## Mathematical target

Source-original 16-real spinor `GammaMatrix` fields KA=gamma1 gamma3, KB=−gamma2 gamma5, KC=−gamma4 gamma6. Accepted P9A0 proves each K is real skew and squares to −I; accepted P9C0 proves they commute; accepted P9C1A/B0 prove the idempotent projector
`P=(1/4)(I−KA KB−KA KC−KB KC)`; accepted P9C1B1 proves rank P=4; accepted P9C2A proves `KA P = P KA` and `J²=−P` for `J=KA P`.

The next metric gate tests two native typed original-source equalities:

1. `relationalProjector_transpose_eq`: `P.transpose=P`.
2. `relationalPhaseJ_transpose_neg`: `J.transpose=−J`.

A generic helper proves that a product of commuting skew matrices is symmetric by `(AB)ᵀ=BᵀAᵀ=(−B)(−A)=BA=AB`. The accepted four-term projector expansion then gives `Pᵀ=P` without any signed-permutation entries. The accepted commutation KA P = P KA and skewness of KA yield `Jᵀ=(KA P)ᵀ=Pᵀ KAᵀ=−P KA=−KA P`.

Mathematically, P symmetric and idempotent over ℝ makes it an orthogonal projection. J skew and `J²=−P` then make its restriction to im(P) an orthogonal complex structure; proving norm-preserving action as a directly typed original source theorem, and constructing a Hopf bundle, remain separate gates.

## Controls and limitations

Use only pinned original source/hashes, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, native warning-as-error build, independent original typed consumer, four allowed root axiom reports and original artifact archive. No copied gamma table, private source imports, heartbeat overrides, source Core/Fock/Hamiltonian changes, `sorry`, custom axioms, or physical interpretive promotion.

The direct original gamma column REDs P9C1C1B-D0 [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and [#44577006982](https://github.com/etblink/math/actions/runs/44577006982) remain preserved and stopped. The source-indexed equality `im(P)=span(e0,e1,e8,e9)` still requires a new, source-bound sparse interface. Neither orthogonal complex structure nor the anticipated Hopf geometry on its unit sphere automatically establishes dynamics in original BFSS Fock space, a protected vortex, a conserved physical current, or a Standard Model observation.

**Do not accept P9C2B before strict GREEN, original and independent axiom/typed reports, exact SHA and ZIP digest verification.**
