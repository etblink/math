# K1D18V10H — F10M accepted; F10N exact original positive determinant candidate

Date 2026-10-31 PDT. Authorized branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## Independently verified F10M strict acceptance
- [F10M strict run #41280978845](https://github.com/etblink/math/actions/runs/41280978845), completed SUCCESS attempt 1, job 124772674813, tested commit 884005e5321d8d5aa5b1460b702b2543b978c148.
- Exact accepted F10M original-source Git blob ec8c1ea8339df8262b394b0c8013e99b807a314b. Original public gamma and F9/F10E–F10L blobs pinned and preflight PASS. Lean 4.34.1; Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Dependency restore PASS, accepted F10L ancestor rebuild PASS, fresh F10M -DwarningAsError=true compilation PASS, three independent exact source theorem-type and root-axiom audits PASS.
- Three accepted F10M theorems: source9PositiveEigenIndices_prod_eq_sqrt_pow_eight, source9NegativeEigenIndices_prod_eq_neg_sqrt_pow_eight, source9RealEigenvalue_prod_sign_partition. They refer to the real eigenvalues of the genuine ORIGINAL 16-spinor source gamma and actual source positive/negative eigenvalue filters, for nonzero v. Only propext, Classical.choice, Quot.sound; no sorryAx.
- [Immutable F10M qualification artifact #13073780560](https://github.com/etblink/math/actions/runs/41280978845/artifacts/13073780560), SHA256 85b2b520b1140a2fd523d27fc0795a34e8a2afe252dd27c4296c37b00dbdfaf6.

## New F10N source exact determinant-sign candidate, unqualified
- Pinned qualified F10G theorem gammaNineRealLinear_det_eq_realEigenvalues_prod bridges original determinant to real spectral product.
- Pinned qualified F10M source spectral products split over the two actual source sign classes. For v != 0, those products are sqrt(Q)^8 and (-sqrt(Q))^8, respectively.
- F10N theorem gammaNineRealLinear_det_eq_source9Quadratic_pow8_of_ne: in original source real gamma16, derive det Γ(v) = Q(v)^8 when v != 0 by multiplying the two F10M products, proving the even-power identity with ring, and using Real.mul_self_sqrt applied to source9Quadratic_nonneg.
- F10N theorem gammaNineRealLinear_det_eq_source9Quadratic_pow8: same equality for ALL original source nine-vectors, including v=0; use accepted F9 gammaNineRealLinear_det_eq_pow8_or_neg, for which both branches coincide at Q(0)=0. Original zero Q proof is source9Quadratic_eq_dot and simp as previously F10I qualified. This avoids an unproved determinant-zero matrix simplification.
- F10N theorem gammaNineRealLinear_det_nonneg: determinant is nonnegative for all original source vectors. This is not a claim about every Spin9 element.
- F10N theorem source9CliffordUnitsGammaDetHom_generator_positive_branch: transfer exact original Γ(v) determinant formula to the accepted genuine Clifford unit determinant hom whenever a genuine unit u equals CliffordAlgebra.ι source9Quadratic v. No claim about general Spin9 character triviality, Spin48 lifts or perfectness.
- All FOUR statements are CANDIDATES only until pinned warning-as-error fresh compilation and independent exact four-type/axiom audit pass. F1–F9 and F10E–F10M remain qualified and unchanged.

## Explicitly separate unresolved broader mathematics and physics
- Even if F10N passes, original source Spin9 subgroup character triviality and multiplicative generation on all Spin9 elements are NOT established by this theorem alone. Original paired SO48 covariance, Spin48 global lift/cover/surjectivity and any BFSS spectral existence are distinct open obligations.
- Do not extrapolate this original real gamma determinant calculation to Fock-order Spin9 covariance, physical spectral theorem, or a claimed Theory of Everything. Source indexing is not silently changed.

## Negative knowledge retained
- Original F10 private gamma table red runs #41266215820, #41266892206, #41267510559 and F10D import-all red run #41268424166 remain unqualified. F10E first deprecated if_neg #41269330982, F10F first invalid matrix entrywise sum #41270798888, and F10H first missing WithLp scope #41273184444 remain preserved red and were repaired by source-exact public Mathlib identities and tiny typed gates.
- No sorry/admit/native_decide, extra axioms, weakened source theorem statements, modified original gamma or paired-Fock basis order, compiler-limit inflation, changed toolchain hashes, unauthorized main/upstream PR or merge.
