# V10H — F10L strict acceptance; F10M original real eigenvalue finite product candidate

Date 2026-10-31 PDT. Authorized research branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## Verified strict F10L acceptance
- [F10L gate #41276948003](https://github.com/etblink/math/actions/runs/41276948003), completed SUCCESS attempt 1, tested SHA 9897f244918159eba4845d1fa0e4fc259518ea81, job 124760931359.
- Exact accepted source blob 225f44f885923e567f2965ffd587920d4bfdaf5e. Original gamma, F9 and F10E–F10K source hashes preflight PASS. Lean v4.34.1, pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; dependency restore and qualified F10K rebuild PASS. Fresh F10L -DwarningAsError=true compilation PASS; three independent exact type and root-axiom checks PASS. Only propext, Classical.choice and Quot.sound, no sorryAx.
- Accepted source9SpinIndex_card_sixteen: Fintype.card SpinIndex = 16 with actual original Core.lean SpinIndex := Fin 16. Accepted source9PositiveEigenIndices_card_eight and source9NegativeEigenIndices_card_eight: for each nonzero original nine-vector v, exactly 8 actual original eigenvalues in each source spectral sign-filter.
- [Qualified F10L artifact #13072220095](https://github.com/etblink/math/actions/runs/41276948003/artifacts/13072220095), SHA-256 aa60d300d229181c562669a775d5ed1abde1706b786b08592983838dd739acfb.
- This establishes **the source-exact 8/8 spectral sign multiplicity**, not a positive determinant theorem or a global Spin(9) orientation result.

## Next F10M source-exact finite product obligations, unqualified
- Pinned Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean provides `Finset.prod_eq_pow_card` and `Finset.prod_filter_mul_prod_filter_not`, verified at Mathlib commit d13f23b723b8a846827a245b89c10fc7d3f11612.
- Candidate source9PositiveEigenIndices_prod_eq_sqrt_pow_eight: product of ACTUAL original source gamma real eigenvalues restricted to positive-root filter equals sqrt(Q(v))^8, using F10L exact cardinality and filter membership.
- Candidate source9NegativeEigenIndices_prod_eq_neg_sqrt_pow_eight: negative-root filter product equals (-sqrt(Q(v)))^8.
- Candidate source9RealEigenvalue_prod_sign_partition: original product over the actual SpinIndex equals positive-root filter product times negative-root filter product; uses qualified F10J exact source non-positive iff negative equivalence.
- Three candidate statements require fresh warning-as-error compilation, three independent exact types, and root axiom whitelist PASS before qualification. No theorem here asserts det Gamma(v) = +Q(v)^8.

## Next after F10M
- F10G already qualifies det Gamma(v) = product of original 16 real eigenvalues. If F10M qualifies, derive for v != 0 det Gamma(v) = sqrt(Q)^8*(-sqrt(Q))^8 = Q(v)^8, with pinned `Real.mul_self_sqrt` and algebra; handle zero vector with original F9 det square or source gamma zero lemma. This must pass a separate exact warning-as-error and axiom gate.
- Only then may the original gamma generator determinant sign be considered settled. Original Spin(9) character triviality, SO(48) action, Spin(48) global lift/cover and physical BFSS claims remain separate open obligations.

## Preserved negative knowledge and frozen controls
- Original private-table F10 Gates #41266215820, #41266892206, #41267510559 and F10D import-all #41268424166 remain RED unqualified. F10E deprecated if_neg #41269330982, F10F matrix sum entrywise simp #41270798888 and F10H missing WithLp scope #41273184444 remain preserved red evidence with subsequently qualified repairs.
- F1–F9 and F10E–F10L accepted and immutable. No sorry/admit/native_decide, new axioms, private gamma-table unfold, changed original SpinIndex/Fock permutation, pinned toolchain changes, compiler-limit hacks, main push or upstream PR without explicit authorization.
