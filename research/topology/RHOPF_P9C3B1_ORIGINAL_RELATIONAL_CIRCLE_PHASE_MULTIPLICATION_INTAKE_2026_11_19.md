# RHOPF-P9C3B1 — source-original algebraic phase multiplication-law intake

**Date:** 2026-11-19.
**Branch:** `integration/bfss-unified-research-20261108`.
**Status:** NEW STRICT ORIGINAL-SOURCE CANDIDATE; no native qualification before CI.
**Accepted predecessor:** P9C3B0 original strict GREEN [#44594739348](https://github.com/etblink/math/actions/runs/44594739348), tested SHA `68e16bb7ab4672a4012b3c8b1f14bade20e321c5`, acceptance commit `7fb4ffa8f7bd9564c381f2e018e2977047f331a8`.

## Bounded mathematical target

The original Gamma9 source real 16-spinor representation supplies qualified source-exact matrices:
- `P`: orthogonal real rank-four common-action projector, `P²=P`.
- `J`: supported orthogonal complex structure, `J²=−P` and `PJ=JP=J`.
- `Q=I-P`: complementary orthogonal projector, `Q²=Q`, `QP=PQ=QJ=JQ=0`.
- `R(a,b)=Q+a•P+b•J`: accepted original family.

**One theorem only**, with all four real parameters free:

[
R(a,b)R(c,d)=R(ac-bd, ad+bc).
]

The native proof expands the two three-term matrix sums into nine ordered products using abstract `noncomm_ring`, then uses ONLY the accepted original multiplication table and commutative `ℝ` scalar-module normalization. There is no 16×16 original gamma expansion, no numerical fixture substituted for the source matrix, no modification of original Gamma9/Core/Fock/Hamiltonian or changes to resource limits.

An independently imported exact source-typed consumer must compile the theorem statement. Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, hash-frozen dependencies, source integer fixture, native and independent allowed-root-axiom checks, original ZIP evidence and exact tested commit remain mandatory. The single theorem will not be accepted without original strict GREEN plus independent consumer and no `sorryAx`; an initial native RED should be diagnosed without changing theorem statement or escalating resources.

## Interpretation boundary

This is an *algebraic multiplication law for arbitrary real a,b,c,d*, not a continuous group action yet. The matrix family is orthogonal and invertible only under an explicit unit-circle condition `a²+b²=1`; those constraints and continuity still require separate native proof gates. A Hopf bundle, source-indexed selected coordinates `span(e0,e1,e8,e9)`, physical BFSS Fock representation and its Hamiltonian covariance, protected vortex, stable soliton or SM observable are not consequences of this one theorem.

The original source indexed single-column R1 [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and R2 [#44577006982](https://github.com/etblink/math/actions/runs/44577006982) failures remain preserved and that tactic family stopped.
