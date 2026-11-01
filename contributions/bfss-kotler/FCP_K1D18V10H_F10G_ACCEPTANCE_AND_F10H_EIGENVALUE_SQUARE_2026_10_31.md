# K1D18V10H — F10G accepted; F10H exact real eigenvalue-square and nonzero probe

Date: 2026-10-31 PDT. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F10G accepted with exact formal scope

- [F10G strict gate #41272333530](https://github.com/etblink/math/actions/runs/41272333530) completed SUCCESS, attempt 1, job `124747490554`, tested SHA `a4874c3746e62f93a800e23d0d27c9b6a28750b8`. F10G original source blob `76800a61a1b26825896519789ae2aaaef19069e9`.
- Original public gamma source blob `b9b8192055c70f0d001d7982669b9823c55562ed`, accepted F9/F10E/F10F sources pinned exactly. Lean `v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original F10F ancestor rebuild PASS, fresh F10G `-DwarningAsError=true` PASS, independent EXACT three declaration types PASS, three root-axiom audits PASS, no `sorryAx`, only `propext`, `Classical.choice`, `Quot.sound`.
- Qualified F10G theorems: `gammaNineRealLinear_isHermitian`, `gammaNineRealLinear_realEigenvalues_sum_zero`, `gammaNineRealLinear_det_eq_realEigenvalues_prod`. They hold for actual original Γ(v) on original `SpinIndex : Fin16`. The real eigenvalues sum to 0, and original determinant equals their finite product. **No eigenvalue sign parity has been established**.
- [Immutable F10G artifact #13070167401](https://github.com/etblink/math/actions/runs/41272333530/artifacts/13070167401), SHA256 `fbb520e0a8dad9219dd82b999673933c1b4a0a7887e43644ea180d8ca3dfcf44`.

## F10H candidate: original-real-eigenvalue square equation (PENDING)

The pinned `Mathlib/Analysis/Matrix/Spectrum.lean` defines the real Hermitian eigenvalues and `Matrix.IsHermitian.mulVec_eigenvectorBasis`:

```lean
 A *ᵥ e_i = lambda_i • e_i
```

It also uses the nonzero eigenvector proof `(ofLp_eq_zero 2).ne.2 (hA.eigenvectorBasis.orthonormal.ne_zero i)`. Pinned `Mathlib/Algebra/Module/Torsion/Free.lean` supplies `smul_left_injective ℝ hu`. The original accepted `gammaNineRealLinear_sq v` proves **exactly**
```lean
Gamma(v) * Gamma(v) = (source9Quadratic v) • (1 : GammaMatrix)
```

Apply both sides to the same nonzero real eigenvector, use pinned `Matrix.mulVec_mulVec`, `Matrix.mulVec_smul`, `Matrix.smul_mulVec`, `Matrix.one_mulVec`, then cancel that exact original nonzero eigenvector to conclude
```lean
(hA.eigenvalues i) * (hA.eigenvalues i) = source9Quadratic v.
```
A second theorem uses accepted `source9Quadratic_eq_zero_iff` to conclude that every eigenvalue of a nonzero source vector is nonzero.

These are **F10H CANDIDATES ONLY** and neither should be considered proved until F10H passes its pinned warning-as-error source compile AND two independent exact-type/axiom checks. F9/F10E/F10F/F10G stay unchanged.

## After F10H, remaining obligations

For nonzero v, F10E proves `sum_i lambda_i = 0`; F10G establishes `det Gamma(v) = prod_i lambda_i`; F10F proves Q(v)>0. If F10H is qualified, the real λ_i satisfy λ_i²=Q(v)>0. A NEW source-typed proof is still required showing exactly 8 positive and 8 negative eigenvalues, and then `det Gamma(v) = Q(v)^8`; handle v=0 separately. Finite cardinality `SpinIndex=Fin16` and the pinned Mathlib spectral function must be respected, not inferred by analogy or an invented basis.

Original Spin9 determinant orientation/character triviality, original paired SO48, Spin48 lift/cover, Fock action and BFSS physical spectral theorem remain OPEN regardless of this gate. No direct private gamma table, no code-content workaround or error reporting-limit changes, no outside upstream publication, no toolchain/accepted source edits.

## Retained negative knowledge

F10 full private-table original gates #41266215820, #41266892206, #41267510559 and F10D legacy `import all` rejection #41268424166 remain RED and unqualified. F10E Gate1 #41269330982 deprecated `if_neg` red, Gate2 #41270021638 green. F10F Gate1 #41270798888 matrix-valued sum entrywise `simp` error red, Gate2 #41271511363 green. Source-exact public identity and minimal typed obligations were the successful pattern; don't widen conjectures from a green CI.
