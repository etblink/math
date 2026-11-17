# BFSS M4 QTC0B — generic tensor-square coefficient contraction design

Date: 2026-11-16 Pacific. **FORWARD RESEARCH ONLY: no Lean source/consumer/workflow staged, no new theorem qualified.** Branch `integration/bfss-unified-research-20261108`. Written while QTC0A strict [#44001621836](https://github.com/etblink/math/actions/runs/44001621836) and governance [#44001621614](https://github.com/etblink/math/actions/runs/44001621614) were running.

## Exact target and algebraic reduction

The staged QTC0A first atom attempts the fully explicit original Fock sum expression

```text
[T, Q_x(b)] = (1/4) ∑_i ∑_j b[i,j] • (
   (∑_p a[p,i] • x_p) * x_j
  + x_i * (∑_p a[p,j] • x_p)),
```

under an **explicit** covariance premise `[T,x_k]=∑_p a[p,k]•x_p`. The index type `ι` is arbitrary finite; coefficients `a,b : ι→ι→ℂ`; operator space remains the genuine original `Fermion 2 →L[ℂ] Fermion 2`. No CAR assumption, real-source scalar bridge, or source48 gamma/K(A) appears.

The QTC0B theorem **after QTC0A qualifies** should show exactly

```text
[T,Q_x(b)] = Q_x(a*b + b*a.transpose),
```

where the complex matrices are functions with multiplication
`(a*b)[p,j] = ∑_i a[p,i]b[i,j]` and
`(b*a.transpose)[i,p] = ∑_j b[i,j] a[p,j]`.

**Never** replace `b*a.transpose` by `b*a` for general `a`. The equation without transpose is only the separate skew specialization `a.transpose=-a`, in which `b*a.transpose=-b*a` and `a*b+b*a.transpose=a*b-b*a`.

## Four generic sublemmas, each proof may be private

1. **Scalar movement through product:** for `α β:ℂ, X Y:Op`, show `β•((α•X)*Y)=(βα)•(X*Y)` and `β•(X*(α•Y))=(βα)•(X*Y)`. Reuse `smul_mul_assoc`, `mul_smul_comm`, `smul_smul`; do not add a global scalar-tower instance.
2. **Distribute the index actions:** `(∑_p a[p,i]•x_p)*x_j=∑_p a[p,i]•(x_p*x_j)` and `x_i*(∑_p a[p,j]•x_p)=∑_p a[p,j]•(x_i*x_p)`. Use `Finset.sum_mul`, `Finset.mul_sum` and the two operator scalar product rules, without commuting `x_i` and `x_j`.
3. **Reassociate finite sums:** exactly
```text
∑_i ∑_j ∑_p (b[i,j]*a[p,i]) • (x_p*x_j)
  = ∑_p ∑_j (∑_i a[p,i]*b[i,j]) • (x_p*x_j)
```
and
```text
∑_i ∑_j ∑_p (b[i,j]*a[p,j]) • (x_i*x_p)
  = ∑_i ∑_p (∑_j b[i,j]*a[p,j]) • (x_i*x_p).
```
Use `Finset.sum_comm`, `Finset.sum_smul`, `sum_smul` as appropriate; coefficient multiplication commutes in ℂ, not `Op`.
4. **Recombine:** `Finset.sum_add_distrib`, `add_smul`, `Matrix.mul_apply`, `Matrix.transpose_apply`, `Matrix.add_apply`, and the original QTC0A `originalFockQuadratic` definition; do not unfold the original `K(A)` finite 48×48 double sum.

## Adversarial tests before any native source binding

- `ι=Fin 0`: both sums vanish.
- `ι=Fin 1`: each generator can be repeated; no distinctness premise.
- `ι=Fin 2`, `a=I`, `b=E₀₀`: **`a*b+b*aᵀ=2E₀₀` but `a*b-b*a=0`**, so a proof accidentally assuming `a` skew is detected.
- `ι=Fin 2`, nonsymmetric/nondiagonal `a,b`: both left and right contractions are tested at unequal entries, including `a[0,1]≠a[1,0]`.
- `ι=Fin 3`, skew `a`: test the separate skew corollary but do not let it replace the general theorem.
- When proving complex scalar sums, do not infer an unproved real `SMul` compatibility or `StarModule` instance.

The proposed source and independent consumer should be **new** files with exact donor pins and a source-root `#print axioms` audit. Retain the original P1 R2 proof evidence, CT1 two-RED stop and QTC0A result at exact tested SHA. A second analogous finite-index recursion failure stops/reviews the approach. No resource/heartbeat increase and no synchronous second CI proof gate while QTC0A remains active.

## Separate QTC1/QTC2 source bridge

Only after QTC0B qualifies, QTC1 should establish native real `K(B)` as the same quadratic operator `Q_{sourceGamma}((B:ℂ))` under the exact source `1/4` coefficient, using the historically accepted `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`. QTC2 then binds the **qualified** LB1C1 `[K(A),Γ_k]=∑_p A[p,k]•Γ_p` for real skew `A`, and transports the generic equation. No direct unbounded Hamiltonian or global Spin(9) action follows.

The final equation `[K(A),K(B)]=K(AB-BA)` is **still a prospective claim** on the original `Fermion 2` carrier, not a result of this note, independent Clifford checks or QTC0A preflight. The physical goal remains an original-Hamiltonian fixed-positive-regulator ground-state fidelity certificate. Preserve the separate gauge/charge domains and G16/Hardy obligations.

**Evergreen provenance:** [Project Lead qualified reuse ledger](../../contributions/bfss-kotler/BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md) and [QTC strategy](BFSS_M4_QUADRATIC_TENSOR_COVARIANCE_DIRECT_K_LIE_BRACKET_FORWARD_RESEARCH_2026_11_16.md) govern theorem ceilings and reuse; historical docs are not silently overwritten. `main` untouched.
