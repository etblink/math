# BFSS M4-LB1C0 — original 48-Majorana K(A) commutator: first expansion gate

**Date:** 2026-11-16 Pacific. **Canonical branch:** `integration/bfss-unified-research-20261108` ONLY. **Status:** `STAGED_UNQUALIFIED` until strict cold source+consumer CI and six independent standard-only axiom reports complete. Do not change `main`.

## Exact qualified inputs

- Accepted [LB0 R3 #43811766549](https://github.com/etblink/math/actions/runs/43811766549), source blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`: true original 48-label sqrt(2) normalized Majorana CAR `[(Γ_pΓ_q),Γ_k]=2δ(q,k)Γ_p−2δ(p,k)Γ_q`.
- Accepted [LB1S R5 #43849019596](https://github.com/etblink/math/actions/runs/43849019596), source blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`: exact `K(A)=(1/4)∑_(p,q) A[p,q]Γ_pΓ_q`, the actual `Fermion 2 →L[ℂ] Fermion 2` operator and real 48×48 matrix `A`, skew adjoint for skew A. These accepted source files are READ ONLY throughout LB1C.

## New staged bounded source

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C0OriginalSource48BivectorCommutatorExpansion.lean`, original staged source Git blob `8b11930128c92bb8a499970593252de942052b1b`.
- `lean/diagnostics/BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansionIndependentConsumer.lean`, Git blob `4011e62c0680c27d17a3d63e41f5bac8ac7036e5`.
- `.github/workflows/bfss-m4-lb1c0-original-source48-k-commutator-strict.yml`, exact initial tested workflow commit `373e9b017586812bbfe47646fb5d80c76609e7e9`; [strict LB1C0 R1 run #43853833739](https://github.com/etblink/math/actions/runs/43853833739), **in progress**, not yet qualified.
- Cold target is the NEW LB1C0 source `.olean`, not LB1S. Frozen Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact source/donor/consumer SHA pins, warning-as-error, three native source and three independently compiled original Fock consumers, **6/6 standard-only `#print axioms`** required, no `sorryAx` or unallowlisted warnings.

Source exact statements, currently candidate only:

1. `originalSource48BivectorK_commutator_doubleSum`: for *every* real source matrix A, the genuine `[K(A),Γ_k]` equals `∑p,q (A[p,q]/4) • [Γ_pΓ_q,Γ_k]`, with unchanged original `Source48Label=Fin24×Fin2` indices and coefficient.
2. `originalSource48BivectorK_commutator_CAR_sum`: substitute qualified LB0 CAR, preserving both explicit Kronecker deltas under the actual real scalar action.
3. `originalSource48BivectorK_zero_commutator`: the zero source matrix has vanishing commutator in the actual original Fock algebra.

The generic one-index/two-index additive sum lemmas are proved on the true noncommutative original Fock operator additive group BEFORE inserting original gammas. Original real→complex scalar bridge `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul` handles a single real coefficient acting on a commutator, with no invented `StarModule ℝ` or `IsScalarTower ℝ Op Op` class. This follows the successful LB1S R5 architecture: typed local f, bounded row/outer sum, then definitional K(A) equality.

## LB1C1 full 48×48 delta-contraction plan (NOT YET PROVED)

After accepting LB1C0, algebraically separate the two source CAR terms using `smul_sub` and `Finset.sum_sub_distrib`. For original `k`:

```text
P = ∑p∑q (A[p,q]/4) • (δ(q,k)·2Γ_p)
Q = ∑p∑q (A[p,q]/4) • (δ(p,k)·2Γ_q)
[K(A),Γ_k] = P − Q.
```

Prove two generic typed delta contractions using `Finset.sum_eq_single k`: `P = ∑p (A[p,k]/4) • (2Γ_p)` and, after **finite-sum interchange** `Finset.sum_comm`, `Q=∑p (A[k,p]/4) • (2Γ_p)`. Avoid unfolding 48×48 gamma expressions in `rw`/unification-heavy goals.

For any real `a` and actual original `Fermion 2` operator `x`, use the *source-exact* existing scalar bridge to prove the generic typed normalization
```text
(a/4 : ℝ) • ((2:ℂ) • x) = (a/2 : ℝ) • x.
```
The real-zero coefficient cases must use the source bridge and **typed** `zero_smul ℂ`, not heuristic simplification. For genuine real skew `A[k,p]=-A[p,k]` use
```text
(A[p,k]/2) • Γ_p - (A[k,p]/2) • Γ_p = A[p,k] • Γ_p
```
and sum once, not 48×48 nested elaboration. Then separately prove the original source theorem
```text
[K(A),Γ_k] = ∑_p A[p,k] • Γ_p.
```
The real source coefficient and factor **1/4** are not tunable and have not been altered.

## Epistemic limits

This staged gate does not itself claim the full delta collapse or the Lie-bracket `so(48)` action. Neither the accepted LB1S `K(A)†=-K(A)` nor any candidate LB1C1 covariance establishes coherent global Fock-vector `Spin(9)` unitary, central-sign/parity coherence, original full `SU(2)` bosonic/gauge action, sixteen BFSS supercharges and domains, physical state existence, auxiliary fidelity or spectral/mass-gap claims. Maintain the source-exact proof layering and preserve every RED first-causal diagnostic with artifact SHA and tested commit before repair.
