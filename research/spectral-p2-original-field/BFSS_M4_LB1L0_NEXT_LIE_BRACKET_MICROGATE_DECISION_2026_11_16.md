# BFSS M4-LB1L0 — source-exact Fock bivector Lie-bracket decision and microgate

**Date:** 2026-11-16 Pacific. **Only branch:** `integration/bfss-unified-research-20261108`. **Status:** mathematical forward-research + qualification plan, NOT a Lean theorem or run, and **not** yet a result about global `Spin(9)`. Preserve accepted LB1C1 source blob `c2e7a7c665121283cde13ae5dabc183362b6b420`.

## Target with exact coefficient and sign

Let `V = Source48Label`, `Γ_p = sourceNormalizedGamma p : Fermion 2 →L[ℂ] Fermion 2`, and the **accepted literal** `K(A)=1/4∑_(p,q) A[p,q] Γ_p Γ_q` for real 48×48 matrices. The next claim for skew `A,B` is

```text
[K(A), K(B)] = K(A * B - B * A).
```

`A*B-B*A` is real skew under `Aᵀ=-A`, `Bᵀ=-B`. The proof must retain original matrix carrier, paired index order, real scalar action on genuine continuous linear maps, and noncommutative multiplication.

### Direct derivation (algebraic plan, **not formal acceptance**)

For any associative operator algebra, the *Leibniz commutator identity* is

```text
[T, Γ_p Γ_q] = [T, Γ_p] Γ_q + Γ_p [T, Γ_q].
```

Use the now qualified LB1C1, `[K(A),Γ_p]=∑_r A[r,p]Γ_r`. Substitution into the immutable real-fourth-coefficient expression for `K(B)` gives

```text
[K(A),K(B)]
 = (1/4) ∑_(p,q,r) B[p,q](
       A[r,p] Γ_r Γ_q + A[r,q] Γ_p Γ_r)
 = (1/4) ∑_(r,q) (A B)[r,q] Γ_r Γ_q
   + (1/4) ∑_(p,r) (B Aᵀ)[p,r] Γ_p Γ_r
 = K(A B - B A).
```

The **second term's negative sign** follows from `Aᵀ=-A`; it must not be hidden by a mistaken matrix-index or commutator convention. This direct expansion is preferable to using a central-commutant theorem plus trace normalization: covariance alone determines the bracket *modulo central scalar operators*, whereas direct expansion proves exact equality with no unidentified central term.

### Source-typed and CI stages

1. **LB1L0 product-rule microgate:** on the actual original `Op = Fermion 2 →L[ℂ] Fermion 2`, prove the Leibniz commutator identity and a generic finite double-sum commutator-distribution helper *without unfolding 48×48 source gamma sums*. Pin accepted LB1C1/LB1S sources and an **independent consumer**; emit controlled `#print axioms`. Initially prove a mathematically modest reusable interface before attempting the native matrix theorem.
2. **LB1L1 scalar + source binding:** reuse the qualified original real-to-complex operator-scalar bridge; show `[T, a•(Γ_pΓ_q)]=a•[T,Γ_pΓ_q]` for real `a`. Avoid `SMulZeroClass` overloaded carrier errors and avoid synthetic module/star instances. Specialize only after an abstract finite-sum lemma compiles.
3. **LB1L2 matrix reindex & coefficient contraction:** prove the two finite triple-sum rearrangements, connecting exact `A[r,p] B[p,q]` and `B[p,q] A[r,q]` to literal source matrix multiplication, with real-skew transpose sign. Keep original `1/4`. Prove final source-exact target and an independent native consumer with a new strict cold build 3+3 or stronger standard-only axiom gate.
4. **Adversarial controls:** check `A=0`, `B=0`, and a single elementary skew-plane input; verify bracket sign, actual original paired label order and noncommutative operator multiplication. Negative controls must never be substituted for the full theorem.

### Acceptance and scientific limits

Require a *new* exact-source/accepted-donor/independent-consumer/toolchain pin manifest, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold source olean, independent source-typed consumers and all `#print axioms` within `{propext, Classical.choice, Quot.sound}`, no `sorryAx`, unallowlisted warnings, `admit`, `axiom`, increased recursion limits or fabricated operators. Any RED is preserved with first causal error and artifact digest before another repair.

This will establish a representation of the **real skew 48-generator Lie algebra** on original Fock vectors only if the final bracket theorem qualifies. The source `so(9)→so(16)` and paired-color `so(16)→so(48)` coefficient transport are separate source-exact adapters; do not automatically claim them from the formal `so(48)` gate. Global `Spin(9)` Fock-vector unitary implementability, central sign/parity, original physical Gauss/16-charge domains, singlet existence, auxiliary ground-state bound and spectral gap are still open.
