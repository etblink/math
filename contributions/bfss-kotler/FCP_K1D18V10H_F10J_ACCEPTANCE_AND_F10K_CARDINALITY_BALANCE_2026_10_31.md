# K1D18V10H — F10J accepted and F10K cardinality-balance candidate

Date 2026-10-31 PDT. Branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## Verified strict F10J acceptance
- [F10J strict run #41275399714](https://github.com/etblink/math/actions/runs/41275399714), completed SUCCESS attempt 1, job 124756455636, tested commit 3509e92ae92baef0428b15270ba995a71aa5ea2a.
- Original F10J qualified blob 144d32242d33428fdf26b40a9cfb8ce42bbe7c87; original public gamma and F9/F10E/F10F/F10G/F10H/F10I source blobs pinned. Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Toolchain/ancestor restore, warning-as-error compile, independent three type audits and exact three axiom whitelists passed.
- Three ACCEPTED declarations: source9RealEigenvalue_negative_iff_not_positive (negative-root value iff not positive-root when v != 0), source9Eigenvalue_sign_partition_card (two true source-filter cardinalities sum to Fintype.card SpinIndex), source9Eigenvalue_sign_partition_sum_zero (their exact source eigenvalue sums add to zero). Root axioms only propext, Classical.choice, Quot.sound, no sorryAx.
- [F10J immutable artifact #13071541769](https://github.com/etblink/math/actions/runs/41275399714/artifacts/13071541769), SHA256 631898edc058eb9157bc288ecc35eeeaa6c68ac5c6bf8e5440145144d0bfcd85.

## Next F10K bounded candidate — unqualified
- Using only source-positive/negative eigenvalue Finset filters and pinned Finset.sum_congr, Finset.mem_filter, Finset.sum_const, nsmul_eq_mul, prove each filtered eigenvalue sum is its actual Nat cardinality (coerced to real) times its respective +/-sqrt(Q(v)).
- With accepted F10J trace split and F10I strict positivity of sqrt(Q(v)) for nonzero original v, derive (card positive : Real) = (card negative : Real) by factoring sqrt and cancellation; transfer to exact Nat cardinality equality by exact_mod_cast.
- Four separate theorem statements are checked for source-exact SpinIndex, original gamma, source quadratic Q, the same exact two Finset classes, and no replacement basis. F10K warning-as-error and independent exact four-type/axiom gate must pass before any acceptance.
- An 8/8 theorem is NOT YET stated in F10K; following equal natural counts, the accepted F10J total cardinality and the original SpinIndex cardinality provide the next dedicated gate. The eventual determinant sign also requires exact finite-product and sqrt exponent treatment and zero-vector case.

## Historical negative knowledge, scope and controls
- Original private matrix-table F10 Gates #41266215820 #41266892206 #41267510559 and F10D import-all #41268424166 remain RED and unqualified. F10E initial if_neg deprecation #41269330982, F10F invalid matrix sum entrywise simplifier #41270798888, F10H missing WithLp namespace #41273184444 remain red records, with later qualifying fixes.
- Accept F1–F9 and F10E–F10J with exact declarative scopes; never elevate CI to a proof that was not stated. F10K not accepted until fresh passing run with root axioms limited to propext, Classical.choice, Quot.sound. Preserve the complete red artifact if failure occurs.
- No sorry/admit/native_decide, extra axioms, weakened theorem statements, unbounded simplification loops, compiler limits, altered pinned dependency hashes, original private gamma signed-permutation access, original paired-Fock basis permutation edits, main or upstream PR without authorization.
- Source Spin9 orientation, original paired SO48 action, Spin48 lift/cover, Fock application and BFSS physical spectral existence remain OPEN independent of these original gamma trace/eigenvalue results.
