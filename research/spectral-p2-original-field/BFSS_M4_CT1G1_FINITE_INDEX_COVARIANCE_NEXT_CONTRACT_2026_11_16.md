# BFSS CT1-G1 — next finite-index covariance contraction: forward research only

Date: 2026-11-16 Pacific. **NOT STAGED, NOT COMPILED, NOT QUALIFIED**. Sole branch `integration/bfss-unified-research-20261108`. This note was prepared while CT1-G0 strict [#43988822460](https://github.com/etblink/math/actions/runs/43988822460) was in progress; do not run G1 until G0 qualifies and its original evidence is separately preserved.

## Scope and research advantage

CT1-G0 isolates the genuine noncommutative Jacobi identity
`[[T,S],X]=[T,[S,X]]-[S,[T,X]]` and binds it to the actual original Source48 `K(A),K(B),Γ_k`. G1 should prove only the GENERIC finite-index covariance composition, using these qualified opaque lemmas; G2 can then bind the exact real source coefficients and prove the native defect commutator zero. Dividing G1 from G2 avoids repeating the failed native multiple-index elaboration of LB1L0.

Let `Op := Fermion 2 →L[ℂ] Fermion 2` (actual noncommutative original Fock operators) and `ι` be any finite type. For complex matrices as plain functions `a,b:ι→ι→ℂ` and `x:ι→Op`, assume

```text
[T_a,x k] = ∑ r, a r k • x r,
[T_b,x k] = ∑ r, b r k • x r.
```

Prove without unfolding `K` or `Γ`:

```text
[[T_a,T_b],x k] =
  ∑ s, ((∑ r, a s r * b r k) -
        (∑ r, b s r * a r k)) • x s.
```

The sign and order are **column convention** `A[s,r]B[r,k]-B[s,r]A[r,k]`, inherited from accepted LB1C1 `[K(A),Γ_k]=∑_r A[r,k]Γ_r`. Do not transpose the matrix or use a different commutator convention. A two-label skew-plane sign test may be conducted as an algebraic numeric control, but never as a substitute Fock representation.

## Proposed proof architecture: each helper a typed microstep

1. Prove, on opaque original `Op`, `[T,c • X]=c • [T,X]` for `c:ℂ`. Prefer existing central complex scalar multiplication lemmas; avoid constructing any new real/complex `SMul` or `StarModule` instances.
2. Prove `[T,∑_r f r]=∑_r[T,f r]` by `mul_sum`, `sum_mul`, `Finset.sum_sub_distrib`. Keep finite `ι` abstract to avoid 48-label expansion.
3. Prove the contraction rewriting
   ```text
   ∑ r, b r k • (∑ s, a s r • x s)
   = ∑ s, (∑ r, (a s r * b r k)) • x s.
   ```
   This uses `smul_sum`, `sum_smul`, `smul_smul`, `Finset.sum_comm`, and commutativity of coefficient multiplication in **ℂ only**. `Op` multiplication remains noncommutative.
4. Apply qualified CT1-G0 Jacobi, the two assumed covariance laws, steps 1–3, and `sub_smul` or `Finset.sum_sub_distrib` to conclude.
5. Independently import each root in a cold consumer; test arbitrary `ι`, repeated indices and a tiny 2-label coefficient sign control. The finite-index theorem should not depend on the original source-basis coordinates.

**G2 source-bound follow-up (still separate):** instantiate `ι=Source48Label`, `x=sourceNormalizedGamma`, `T_a=originalSource48BivectorK A` with REAL skew matrices, use the **qualified** source exact scalar bridge `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`, and `Matrix.mul_apply` with `(A*B-B*A)[s,k]`. Check skewness `(A*B-B*A).transpose=-(A*B-B*A)` to invoke LB1C1 for the defect `D(A,B)`. Only after G2 may one claim `∀k,[D(A,B),Γ_k]=0`. Then CT2 must use original Clifford all-axis induction and M3C scalar commutant, CT3 the qualified CT0 trace-zero to eliminate scalar.

## Donors and stopping rule

- CT1-G0 original Jacobi source (pending R1): `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT1G0OriginalFockJacobiSource48Adapter.lean`, staged Git blob `e4837ccb96108ecabcebfd0ba2534398fe0ddb2a`. NOT accepted pending strict GREEN and evidence.
- Accepted LB1L2 generic Leibniz `b4012951a26aa7573db513adab3d7ce27396db7e`; accepted LB1C1 source gamma covariance `c2e7a7c665121283cde13ae5dabc183362b6b420`; accepted CT0 skew K trace-zero `a6f93c62c83bf51a0b89691196f875399d2896fa`.
- Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Strict source/consumer separate reports, warning-as-error, standard-only axioms and exact donor/CI receipts. Never increase resource limits or flatten source K into huge native sums.
- Stop for source-class mismatch after two genuinely analogous REDs, and preserve first causal error, complete original ZIP/log, negative controls. If the generic path stalls, compare frozen P1 four-Majorana contract; retain Gauss charge-square route independently for the physical fidelity program.

**Nonclaim:** no global Fock-vector Spin(9), physical sector projection, G16 numerical Hardy bound, existence, mass gap or original fixed-regulator fidelity result is established by this unexecuted research note.
