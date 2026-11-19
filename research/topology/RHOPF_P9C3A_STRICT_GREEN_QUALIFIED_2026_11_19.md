# RHOPF-P9C3A — original-source algebraic relational circle-phase family strict GREEN

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Native strict run:** [#44591790772](https://github.com/etblink/math/actions/runs/44591790772), attempt 1, SUCCESS.
**Exact tested SHA:** `b7f55007ea3f6f51706e0cef2153d99bda7f671b`.
**Decision:** **ACCEPT** four original-source proof statements, not a continuous group action.

## Evidence

- Frozen source-hash/proof-contract preflight PASS; pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored PASS.
- Original-source signed-permutation independent integer fixture PASS.
- Source-original Gamma9/projector/phase dependency build PASS; native warning-as-error Lean compilation PASS; separately imported exact-type consumer warning-as-error compilation PASS.
- Four native + four independent `#print axioms` reports list only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, no compiler errors.
- Original [artifact #14563224271](https://github.com/etblink/math/actions/runs/44591790772/artifacts/14563224271) was downloaded and inspected. ZIP SHA-256 `67929689c4c10bba1c068737c4f75b3ec23c077ab969e6e5360f6f962ce5b44d` matches GitHub original digest; `exact-tested-commit.txt` matches SHA; logs and integer fixture retained.

## Qualified source theorems

- `FCP.RHOPFP9C3A.relationalCirclePhase_one_zero`: `R(1,0)=I`.
- `FCP.RHOPFP9C3A.relationalCirclePhase_zero_one`: `R(0,1)=U`.
- `FCP.RHOPFP9C3A.relationalCirclePhase_neg_one_zero`: `R(-1,0)=I-2P`.
- `FCP.RHOPFP9C3A.relationalCirclePhase_transpose`: `R(a,b)ᵀ=R(a,-b)`.

Here the original 16-real carrier `R(a,b) = I - P + a•P + b•J`, where accepted P9C1A/B/C established rank4 P, P9C2A/B/C established orthogonal complex structure J and partial isometry, and accepted P9C2D gave quarter turn U.

## Qualification boundaries

No original-source `R(a,b)R(c,d)=R(ac-bd,ad+bc)` has yet passed native and independent strict CI. Orthogonality for `a²+b²=1`, continuous S¹ action, its Hopf quotient, physical BFSS 2^24 Fock implementer and Hamiltonian invariance are separate obligations. Source selected coordinate equality `im(P)=span_R(e0,e1,e8,e9)` also remains unproved. Original single-gamma coordinate R1 #44574592530 and R2 #44577006982 REDs remain preserved with a stop on their exact tactic family; source gamma/Core/Fock/Hamiltonian were not modified.

**Next step:** First qualify simple complement support relations `Q=I-P, Q²=Q, QP=PQ=QJ=JQ=0` as an independent algebraic microgate; then attempt the parameterized multiplication law using generic matrix-ring identities, rather than full original gamma entry expansion. A separate mathematical topology gate is needed for continuity and quotient.
