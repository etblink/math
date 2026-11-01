# K1D18V10H — strict F10I acceptance; F10J finite sign-partition candidate

Date 2026-10-31 PDT. Research branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## F10I strict acceptance — verified
- [Gate #41274621449](https://github.com/etblink/math/actions/runs/41274621449), attempt 1, job 124754169047, status SUCCESS, tested commit d2312cb473cc03939ebcfb8ca79d1efb6ff02e54.
- Qualified F10I Git blob 0497b3ac508931ad568fc6ef1e3c20c688627ba7. Original gamma, accepted F9 and F10E/F10F/F10G/F10H SHA pins validated. Lean v4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored and accepted F10H rebuilt. Fresh F10I warning-as-error compilation and all three independent declaration/axiom audits passed.
- Exact accepted declarations: source9Quadratic_nonneg, gammaNineRealLinear_realEigenvalues_eq_sqrt_or_neg, source9Quadratic_sqrt_pos_of_ne. The root axioms are propext, Classical.choice, Quot.sound only; no sorryAx.
- For every actual original SpinIndex, lambda_i(v) is either +sqrt(Q(v)) or -sqrt(Q(v)); when v != 0 the source sqrt is positive. Nothing about number of positive indices nor determinant positivity follows without separate finite-index proof.
- [Qualified artifact #13071540348](https://github.com/etblink/math/actions/runs/41274621449/artifacts/13071540348), SHA256 059534df8560f2a54ef2957ee61d5adda329d952d882f42bb3f6c23ae5b000b8.

## F10J source-exact bounded sign partition CANDIDATE, not yet qualified
- Define source9PositiveEigenIndices and source9NegativeEigenIndices as actual Finset.univ filters of the **original** real gamma spectral eigenvalues on SpinIndex; their membership compares to +sqrt Q and -sqrt Q, respectively. The negative class is NOT defined artificially as complement.
- First theorem source9RealEigenvalue_negative_iff_not_positive: when source v != 0, a source eigenvalue equals -sqrt Q iff it is NOT +sqrt Q, using F10I two-sign and positive sqrt.
- Second theorem source9Eigenvalue_sign_partition_card: the counts of these two actual finite filters sum to Fintype.card SpinIndex, via pinned Mathlib Finset.filter_congr and Finset.card_filter_add_card_filter_not.
- Third theorem source9Eigenvalue_sign_partition_sum_zero: sums of the actual real eigenvalues over those filters add to zero, via pinned Finset.sum_filter_add_sum_filter_not and accepted F10G trace-zero spectral sum.
- All statements require the original source nine-vector and SpinIndex without changing label order or copying private signed-permutation matrices. This gate deliberately does NOT assert counts eight/eight or positive determinant. Next, source-exact finite-constant-sum lemmas must show trace = (card positive - card negative)*sqrt(Q), then use nonzero sqrt and Fin16 to deduce eight/eight and original determinant +Q^8. No short-circuit inference is permitted.

## Negative knowledge and project controls
- Accepted F1–F9 and F10E–F10I frozen. Original F10 private gamma signed-permutation Gates #41266215820 #41266892206 #41267510559 and F10D import-all Gate #41268424166 are preserved RED. F10E deprecated if_neg #41269330982, F10F invalid matrix-sum application #41270798888, F10H missing WithLp #41273184444 are also retained RED with their succeeding qualified strict fixes.
- Pinned source, reproducible Lean toolchain and Mathlib, clean ancestor rebuild, exact compiler with warningAsError, independent exact declaration type proof and root-axiom audit are mandatory. No sorry, admit, native_decide, added axioms, replacement gamma, basis-order changes, resource limit increases, unauthorized main/upstream publication or BFSS physical spectral claims.
- Global original Spin9 orientation, original paired SO48, Spin48 lift/cover, Fock action and physical spectral existence remain independent OPEN obligations.
