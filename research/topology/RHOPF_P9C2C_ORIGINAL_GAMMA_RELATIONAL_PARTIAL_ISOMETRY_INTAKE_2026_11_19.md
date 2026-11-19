# RHOPF-P9C2C — source-original relational phase partial-isometry

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** STRICT ORIGINAL-SOURCE CANDIDATE — unqualified pending new CI.
**Accepted input:** P9C2B [run #44582890701](https://github.com/etblink/math/actions/runs/44582890701), exact tested commit `8a0259ee0626694d27a04fe9571e327d63032f54`, formal GREEN acceptance commit `671c1010da38bc2c0dffb29cabe926de3759e1a9`.

## Mathematical scope

The original 16-real Gamma9 source provides real K1=gamma1 gamma3 and the original relational projector P. Accepted P9C1A: `P²=P`. Accepted P9C1B1: rank_R P=4. Accepted P9C1C1A: image(P) is the common-action equalizer of original K1/K2/K3. Accepted P9C2A: `J=K1P`, `J²=−P` and `K1P=PK1`. Accepted P9C2B: `Pᵀ=P` and `Jᵀ=−J`.

Now formalize four exact original-source consequences without any coordinate calculations:
- `relationalPhaseJ_transpose_mul_self`: `JᵀJ=P`.
- `relationalPhaseJ_mul_transpose_self`: `JJᵀ=P`.
- `relationalPhaseJ_mul_projector`: `JP=J`.
- `relationalProjector_mul_phaseJ`: `PJ=J`.

These are the defining partial-isometry and support identities: on im(P), J is orthogonal; it vanishes on its orthogonal complement. The theorem does not create a new Fock-space operator or implementer and does not select a unique Spin9-invariant physical state.

## Source and governance constraints

Strict pinned original hashes, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source exact integer fixture, native warnings-as-errors compilation, separately imported independent typed consumer, eight allowed-only axiom reports and retained exact-SHA original artifact. No `sorryAx`, changes to source Gamma9/Core, private source table imports, matrix-entry unfolding, global resource overrides, Fock/Hamiltonian edits, or weakening existing theorems.

The original indexed four-plane equality `im(P)=span_R(e0,e1,e8,e9)` remains an unproved source binding. P9C1C1B-D0 R1 and R2 direct gamma column REDs remain stopped with full records. The next stage after a successful P9C2C would use these intrinsic properties to define an explicit `ℂ`-module structure or a mathematically exact circle action and then a geometric Hopf quotient; an actual BFSS gauge/Fock selection and experimental discrimination require separate research.
