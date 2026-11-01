# V10H F10H acceptance and F10I sqrt two-sign candidate — 2026-10-31 PDT

## F10H strict acceptance
- Exact [run #41273897401](https://github.com/etblink/math/actions/runs/41273897401), attempt 1, job 124752049774, SHA 003e7d3434d05627fafde62d4799d1e5fa38dafc, completed SUCCESS.
- Exact F10H source Git blob 245d1c509d41e71f001204d04b154dee76bd1b6c, pinned Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, original gamma and F9/F10E/F10F/F10G source hashes verified.
- Fresh compiler -DwarningAsError=true PASS, accepted F10G ancestry rebuilt PASS, two separate exact theorem type checks PASS, and root axiom whitelists PASS (propext, Classical.choice, Quot.sound only; no sorryAx).
- Accepted original source statements: gammaNineRealLinear_realEigenvalues_mul_self (lambda_i(v)^2=source9Quadratic v), and gammaNineRealLinear_realEigenvalues_ne_zero for nonzero original v.
- [Qualified artifact #13070736465](https://github.com/etblink/math/actions/runs/41273897401/artifacts/13070736465), SHA-256 8cca7e259d0f9d820d8dfbaf1df25a9fd2e9aa87710eb01bd806839c31c49e39.
- Historical red Gate1 [#41273184444](https://github.com/etblink/math/actions/runs/41273184444) used the exact eigenvector source but omitted the pinned WithLp namespace; Gate2 corrected only that scope and passed. Preserve negative evidence.

## F10I next candidate, UNQUALIFIED
- Source9Quadratic_nonneg: Q(v)>=0 for all original source vectors, from accepted positivity for nonzero and original zero case.
- gammaNineRealLinear_realEigenvalues_eq_sqrt_or_neg: every original real eigenvalue lambda_i(v) equals plus or minus Real.sqrt(Q(v)); follows from F10H equality of squares and pinned Real.mul_self_sqrt / mul_self_eq_mul_self_iff also used by accepted F9.
- source9Quadratic_sqrt_pos_of_ne: Real.sqrt(Q(v)) > 0 if original v != 0.
- No eigenspace sign multiplicities or positive determinant theorem claimed. All three need strict warning-as-error compiler plus independent exact types and axiom audit before acceptance.

## Next obligations
- For nonzero source v, 16 original lambda_i each equals +/-r with r>0, and sum lambda_i=0 by qualified F10G. Establish exactly eight positive and eight negative indices with exact source SpinIndex Fin16, formal finite-sum/card bridges. Only THEN may determinant/product simplify to Q(v)^8; handle v=0 separately.
- Global original source Spin9 orientation, paired SO48 action, Spin48 lift/cover, original paired Fock permutation and BFSS physical spectral claims remain separately unproved.

## Failure inventory / frozen controls
- Original F10 private signed-permutation Gate1 #41266215820, Gate2 #41266892206, Gate3 #41267510559, legacy import F10D #41268424166 remain red/unqualified.
- F10E initial deprecated if_neg #41269330982, F10F matrix sum entrywise simplification #41270798888, F10H missing WithLp scope #41273184444 remain red, subsequent verified repairs green.
- Accepted F1–F9 and F10E–F10H unchanged. No sorry/admit/native_decide, axiom insertion, toolchain change, compiler limit hike, private gamma table copies, main/upstream push, or changed original paired-Fock labels.
