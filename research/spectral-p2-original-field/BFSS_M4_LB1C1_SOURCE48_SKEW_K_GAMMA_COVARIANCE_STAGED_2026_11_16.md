# BFSS M4-LB1C1 — original skew K(A) Majorana covariance: strict staged gate

**Date:** 2026-11-16 Pacific. **Owner branch:** `integration/bfss-unified-research-20261108` ONLY, no side branch and `main` untouched. **Status:** STAGED/UNQUALIFIED until new strict source + independent consumer complete with acceptable axiom reports.

## Qualified provenance and exact new bytes

- Accepted [LB0 R3 #43811766549](https://github.com/etblink/math/actions/runs/43811766549): original Source48 normalized Majorana triple CAR, source blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`.
- Accepted [LB1S R5 #43849019596](https://github.com/etblink/math/actions/runs/43849019596): source-exact original real 48×48 `K(A)=(1/4) ∑_(p,q)A[p,q]Γ_pΓ_q`, skew-adjoint on genuine `Fermion 2` Fock vectors under real skew A, source blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`.
- Accepted [LB1C0 R1 #43853833739](https://github.com/etblink/math/actions/runs/43853833739): exact double-sum commutator expansion and original CAR substitution, source blob `8b11930128c92bb8a499970593252de942052b1b`, six restricted axiom reports.
- **New LB1C1 source candidate** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean`, Git blob **`9e39d24150d9146ffe6ac0484977a867fb269103`**.
- **New independent original-Fock consumer** `lean/diagnostics/BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovarianceIndependentConsumer.lean`, Git blob **`a1c186bf3a630b251e4596ecf63a1dd48c12e701`**.
- **New strict workflow** `.github/workflows/bfss-m4-lb1c1-original-source48-k-gamma-covariance-strict.yml`, initial source/workflow commit `eb1f95bf53f315de27908f1b01dfc3dc182c2621`, [R1 #43856330483](https://github.com/etblink/math/actions/runs/43856330483).
- Frozen Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact source and accepted donor blobs pinned. New LB1C1 **cold** `.olean`, independent consumer, **three source + three consumer 6/6** axiom reports restricted to `{propext, Classical.choice, Quot.sound}`, no `sorryAx`/source compiler warnings. Initial workflow launch/preflight is NOT a GREEN claim.

## Candidate source theorem statements (not yet accepted)

1. **`originalFock_skew_delta_doubleSum_contract`** — generic finite index type `ι`, original complex Fock operators `Op = Fermion 2→L[ℂ]Fermion 2`, an arbitrary REAL skew `a : ι→ι→ℝ` and family `x : ι→Op`. Prove:
```text
∑p∑q (a[p,q]/4) • (2δ(q,k)•x[p] - 2δ(p,k)•x[q])
 = ∑p a[p,k]•x[p].
```
This is the algebraic layer, with explicit rowwise delta selection `Finset.sum_ite_eq'`, exact original real/complex scalar bridge for 1/4×2=1/2, `Finset.sum_comm` for the second index, and original skew `a[p,q]=-a[q,p]` only at the final step. The Fock operator multiplication is never assumed commutative.
2. **`originalSource48BivectorK_skew_commutator_gamma`** — exact source input `A : Matrix Source48Label Source48Label ℝ` and entrywise real skew condition yields
```text
originalSource48BivectorK A * sourceNormalizedGamma k
 - sourceNormalizedGamma k * originalSource48BivectorK A
 = ∑p : Source48Label, (A p k : ℝ) • sourceNormalizedGamma p.
```
Uses the **byte-identical qualified K(A) from LB1S** and qualified LB1C0 CAR expansion, with local typed a/x aliases to prevent nested 48×48 elaborator recursion. Uses the original sqrt(2)-normalized Majoranas on actual `Fermion 2`.
3. **`originalSource48BivectorK_skew_commutator_gamma_of_transpose`** — same original source covariance under native `A.transpose=-A`, adapting the accepted LB1S skew-entry binding.

Three independent consumer declarations repeat generic original operator delta contraction and the two source forms (native entrywise and transpose). No replacement gamma model, no new `K(A)`, no hidden inverse/sign change, no new axioms, no resource cap increase or original physical BFSS charge-domain claims.

## Gate interpretation and next phase

**STOP if R1 RED:** preserve first exact Lean compiler diagnostic, tested SHA, artifact digest, source/consumer axiom reports, then diagnose whether failing point is (a) genuine coefficient/sign mathematics, (b) original scalar bridge, (c) finite-sum elaboration, or (d) native source matching. Repair only bounded tactic/proof bodies unless a counterexample forces reconsideration. The pre-accepted LB0/LB1S/LB1C0 sources remain immutable.

If R1 STRICT GREEN (or bounded later qualified Rn), this establishes the exact **infinitesimal linear so(48) action on original Majoranas** at each source real skew matrix, NOT YET the Lie-bracket identity `[K(A),K(B)]=K([A,B])`, a differential binding to original `so(9)→so(16)→so(48)`, global coherent Spin9 action on physical Fock vectors, source SU2 gauge, all sixteen original supercharges on invariant common domains, auxiliary fidelity, ground-state existence or spectral mass gap.

This record and any roadmap updates are document-only descendants; qualification must refer to the exact tested workflow commit.
