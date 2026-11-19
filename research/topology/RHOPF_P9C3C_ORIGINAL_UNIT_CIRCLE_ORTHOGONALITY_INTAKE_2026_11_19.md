# RHOPF-P9C3C — exact original Gamma9 unit-circle phase orthogonality intake

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED strict original-source candidate pending native and independently imported type consumer.
**Accepted predecessor:** P9C3B1 R3 [#44603537606](https://github.com/etblink/math/actions/runs/44603537606), exact original tested commit `42d6835eab024a57aa5a65f3adb13bfb8765de7e`, permanent acceptance commit `90d4ab3b149aba7c740a9a72979e3d3179d93382`.

## Mathematical purpose and precise contracts

Previous strict original-source gates have established:
- Original Gamma9 real 16-carrier orthogonal rank-four P, complex phase J with `P²=P`, `Pᵀ=P`, `J²=-P`, `Jᵀ=-J`, and `PJ=JP=J`.
- Real two-parameter family `R(a,b)=I-P+a•P+b•J`, its exact transpose `R(a,b)ᵀ=R(a,-b)`, and its source-original product `R(a,b)R(c,d)=R(ac-bd,ad+bc)`.

P9C3C tests exactly two new native source-typed conclusions:
1. `relationalCirclePhase_transpose_mul_self (a b)`: `R(a,b)ᵀR(a,b)=R(a*a+b*b,0)` for arbitrary real parameters.
2. `relationalCirclePhase_orthogonal_of_unit (a b) (hunit : a*a+b*b=1)`: `R(a,b)ᵀR(a,b)=I`.

Both follow by single source-accepted multiplication and transpose rewrites, followed only by ring normalization of `a*a-(-b)*b` and `a*b+(-b)*a`, and qualified `R(1,0)=I`. No original gamma-coordinate expansion, matrix-entry unfolding, private signed-permutation copies, unsupported physical assumptions, `import all`, resource limit changes, or new axioms.

## Strict evidence and scientific boundaries

Workflow freezes original source hashes (including exact accepted P9C3B1 R3 source), pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, independent original signed-permutation integer fixture, warning-as-error native compilation and independently imported typed consumer, both declarations' original and imported axiom reports, and original artifact ZIP/exact-tested SHA. Do not accept this candidate without original strict GREEN and both allowed-only axiom reports with no `sorryAx`.

Success qualifies only unit-circle **matrix orthogonality**. Formally identifying the domain with the continuous topological unit circle, proving continuity of the parameter map, the group-action law in that domain, a Hopf quotient of the source-original sphere, and BFSS Fock-space/Hamiltonian/gauge covariance are separate obligations. The direct source-selected basis bridge and the stopped P9C1C1B-D0 R1/R2 REDs remain explicitly open. The P9C3B1 native R1/R2 REDs and their diagnostics must also remain permanently preserved as negative knowledge.
