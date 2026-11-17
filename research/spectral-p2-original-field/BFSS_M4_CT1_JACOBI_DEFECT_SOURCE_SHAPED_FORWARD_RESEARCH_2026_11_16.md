# BFSS M4-CT1 — source-shaped Jacobi defect reduction (prospective)

Date: 2026-11-16 Pacific. **RESEARCH CONTRACT ONLY; NO Lean source, consumer or strict workflow STAGED, no theorem or CI qualified here.** Single allowed branch: `integration/bfss-unified-research-20261108`. CT0 R2 [#43983772199](https://github.com/etblink/math/actions/runs/43983772199) was still running when the contract was prepared. Do not count CT0 as accepted until original source, independent consumer, standard-axiom and complete artifact checks finish.

## 1. Scientific purpose

CT0 is the trace-normalization half of a candidate shortcut for the *original* (48)-Majorana bivector Lie algebra. CT1 would prove the first, logically separate assertion: the alleged full-bracket defect has zero commutator with every **active source** Majorana. It does NOT establish that the defect is zero, because an operator commuting with all Majoranas could still be central. CT2 must bridge active axes to the original full complex Clifford action and M3C's actual scalar commutant, and CT3 must use CT0 and the trace of the original identity to kill the scalar.

This is one bounded algebraic lane that avoids expanding `K(A)` or the original Fock CAR into 48×48×48 source terms. If large native reindexing becomes unavoidable or two analogous typed conversions fail, stop and return to the existing P1 four-Majorana contract, while retaining charge-square/Gauss as a physical-energy comparator.

## 2. Exact native symbols and first source theorem

On `Op := Fermion 2 →L[ℂ] Fermion 2` define `[X,Y] := X*Y-Y*X`. Do **not** introduce a false operator commutativity assumption. The fixed original generator is

```text
K(A) := ∑ p : Source48Label, ∑ q : Source48Label,
  (A p q / 4 : ℝ) • (sourceNormalizedGamma p * sourceNormalizedGamma q).
```

For real skew `A` the qualified original LB1C1 theorem states

```text
[K(A), Γ_k] = ∑ r : Source48Label, (A r k : ℝ) • Γ_r.
```

For real skew `A,B`, let `C = A*B-B*A` (literal source matrix multiplication) and

```text
D(A,B) := [K(A),K(B)] - K(C).
```

The prospective CT1 native goal is

```text
∀ k : Source48Label, D(A,B)*Γ_k - Γ_k*D(A,B) = 0.
```

The proof needs `C.transpose=-C`, and must preserve the correct *column* ordering `A[r,k]`.

## 3. Small generic root before native adapter

First formulate the genuine noncommutative ring **Jacobi commutator identity** as an opaque original `Op` lemma:

```text
[[X,Y],Z] = [X,[Y,Z]] - [Y,[X,Z]].
```

The proof can normalize only associativity/distributivity of opaque operator variables. Compare the already-qualified LB1L2 `originalFock_product_covariance_from_two_hypotheses`, which succeeded by `simp only [sub_mul, mul_sub, mul_assoc]; abel`. Avoid the historical LB1L0 native K-expression expansion, which repeatedly timed out.

Second, prove a finite-index covariance composition on an **arbitrary finite `ι`**. Prefer `ℂ` coefficients in the generic lemma so scalar multiplication through operator products is typed and ordinary. With `x:ι→Op`, `a,b:ι→ι→ℂ`, `T_a,T_b:Op`, and hypotheses

```text
[T_a,x_k] = ∑ r, a[r,k] • x_r,
[T_b,x_k] = ∑ r, b[r,k] • x_r,
```

Jacobi and the exact finite contraction imply

```text
[[T_a,T_b],x_k] =
  ∑ s, ((∑ r, a[s,r]*b[r,k]) - (∑ r, b[s,r]*a[r,k])) • x_s.
```

Keep coefficient multiplication commutative only in `ℂ`; `Op` remains noncommutative. Use a generic finite `Finset.sum_comm` / `sum_smul` interface and independently prove the matrix multiplication convention. Require a simple two-by-two signed-plane mathematical control (not a replacement representation) before source adaptation.

Only then bind `ι=Source48Label`, `x=sourceNormalizedGamma`, `T_a=originalSource48BivectorK A` and the native REAL coefficient covariances. The existing qualified `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul` is the explicit real-to-complex bridge. Do not invent new global `SMul` or `StarModule ℝ` instances.

## 4. Exact source donors checked at the unified branch

| Role | Source module under `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/` | Git blob |
| --- | --- | --- |
| Active normalized gamma | `SU2BFSSSource48NormalizedFockGammaProbe.lean` | `7abc03723b3111e4a03389b722054e50d6a9bf30` |
| Literal real skew K(A) | `P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean` | `d7d460fc8d2806234816e8bd2088f9cebb6addd4` |
| Qualified [K(A),Γ] source covariance | `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean` | `c2e7a7c665121283cde13ae5dabc183362b6b420` |
| Opaque Fock Leibniz precedent | `P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean` | `b4012951a26aa7573db513adab3d7ce27396db7e` |
| Full original Clifford scalar commutant (future CT2) | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe.lean` | `6fefd9ae344df0b7247feb34c9bec5ea0a27aea0` |
| Clifford source-axis to active gamma (future CT2) | `OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean` | `a9db27fc28379b35ca85515d733cc0bc43376592` |
| Original Clifford AlgEquiv (future CT2) | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean` | `754a5f2a13baea90312f6031eb8fa7963dbdf42b` |
| Source Spin(9) 9→48 coefficient bracket already qualified independently | `SU2BFSSPairedSpin9NativeSkewCommutatorEqualityProbe.lean` | `ca26ae3f9942eb8d3ad639e77356a7df3c41456f` |

That last donor proves a **different** exact 9×9 to 48×48 coefficient bracket transport; it neither proves a 48×48 Fock K-bracket nor an original Fock-vector unitary action. It can be used later only after source-exact coefficient normalization/geometry is checked.

## 5. Expected acceptance/stopping controls (future, not launched)

Qualify the generic Jacobi root, the generic finite covariance composition, and the actual original 48-label consumer separately. Freeze full source and consumer blobs; cold Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warnings-as-errors, original Fock types, standard-only axioms and negative auditor controls. Prohibit `sorryAx`, replacement Fock matrices, global operator commutativity and resource-limit escalation. Preserve the first RED and its original ZIP/log; a second analogous native conversion failure stops CT1 rather than opening an unbounded retry series.

**Physical ceiling:** CT1 would be a commutant-reduction lemma only; physical gauge/charge domains, Spin(9) group integration, G16 Hardy coefficient and regulator-dependent ground-state fidelity remain open even if CT1 qualifies. The leading scientific goal remains a fixed-positive-regulator fidelity certificate on the original SU(2)-physical Hilbert space.
