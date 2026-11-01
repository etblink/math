# K1D18V10H — F10F accepted; F10G real Hermitian spectral API bridge candidate

Date: 2026-10-31 PDT. Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F10F STRICT QUALIFICATION — ACCEPTED

- [V10H-F10F Gate2 #41271511363](https://github.com/etblink/math/actions/runs/41271511363) completed SUCCESS attempt 1; job `124745064555`, exact tested SHA `796a1c0bc56a15720a23416065c2d52cc7d7f7c1`. F10F qualified original Lean file Git blob `19a1d1fd4cfc89d7c243d28a4c9f1663a3aa3ce3`.
- Pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; original exact real signed-permutation gamma source blob `b9b8192055c70f0d001d7982669b9823c55562ed`. All source blob preflights PASS, pinned dependencies restore PASS, accepted F10E ancestry rebuild PASS, fresh `-DwarningAsError=true` F10F compile PASS; **all three independent original-source declaration types and axiom whitelist PASS**.
- Three ACCEPTED declarations `source9Quadratic_eq_zero_iff`, `source9Quadratic_pos_of_ne`, `gammaNineRealLinear_isSymm`. Axioms only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- Original 9-vector quadratic Q satisfies Q(v)=0 iff v=0 and Q(v)>0 when v≠0. Every **original** gamma16 real linear combination Γ(v) is symmetric. Alongside qualified F10E original trace-zero, F9 determinant square, this establishes exact source spectral prerequisites but **does not prove determinant sign**.
- [Immutable F10F artifact #13069377613](https://github.com/etblink/math/actions/runs/41271511363/artifacts/13069377613), SHA256 `0e00527bc317b7d500a3bfa7f5a5a75fdca4019de2948b5616281ef9b58d8c79`.
- [F10F Gate1 red #41270798888](https://github.com/etblink/math/actions/runs/41270798888), original attempted `Finset.sum_apply` and `Pi.smul_apply` on a finite MATRIX sum; produced non-type-correct expression and `sorryAx` in third theorem; repaired Gate2 with pinned `Matrix.transpose_sum`, `Matrix.transpose_smul` and original `gamma_symmetric`. Preserve the red and its failure record.

## F10G pending — exact source eigenvalue API bridge

Pinned Mathlib 4 at `d13f23b723b8a846827a245b89c10fc7d3f11612` defines:
- `Matrix.isHermitian_iff_isSymm` for real matrices in `Mathlib/LinearAlgebra/Matrix/Hermitian.lean`: equivalence between `IsHermitian` and `IsSymm` for coefficients with `TrivialStar ℝ`.
- `Matrix.IsHermitian.eigenvalues` in `Mathlib/Analysis/Matrix/Spectrum.lean`: **real-valued** eigenvalues indexed by original `SpinIndex` `Fin16`.
- `Matrix.IsHermitian.trace_eq_sum_eigenvalues`: trace equals finite sum of those eigenvalues.
- `Matrix.IsHermitian.det_eq_prod_eigenvalues`: determinant equals their finite product.

F10G checks three distinct statements against the ORIGINAL `gammaNineRealLinear v`:
1. `gammaNineRealLinear_isHermitian`: exact original gamma matrix is Hermitian, via accepted source symmetry.
2. `gammaNineRealLinear_realEigenvalues_sum_zero`: sum of 16 real eigenvalues = 0, from source accepted trace zero and pinned spectral formula.
3. `gammaNineRealLinear_det_eq_realEigenvalues_prod`: source determinant equals product of the same 16 spectral eigenvalues.

This is a deliberately **BOUNDED BRIDGE**, not an eigenvalue-square or parity theorem. The actual subsequent high-value source-exact obligations: for v≠0, prove **each** eigenvalue squared equals Q(v) using Γ(v)²=Q(v)I and spectral eigenvector identity; use Q(v)>0 and trace-zero to establish eight positive/eight negative eigenvalue indices; then conclude det Γ(v)=Q(v)^8. At v=0 handle separately. Every transfer through the genuine Clifford unit, original Spin9, original SO48 and Spin48 action remains an independent obligation. Do not smuggle in eigenvalue cardinality, assumed perfectness or determinant sign.

Strict qualification rules unchanged: original gamma/F9/F10E/F10F hashes pinned, exact toolchain and Mathlib, F10F ancestor rebuilt, F10G compiled fresh warningAsError, three independent exact type checks, three root axioms subset `propext`, `Classical.choice`, `Quot.sound`; no sorry/admit/native_decide/axioms/resource-limit hikes.

## Historical negative knowledge

Original F10 full-matrix three red gates #41266215820, #41266892206, #41267510559 and original private-access F10D red #41268424166 remain UNQUALIFIED. Direct private gammaInt signed-permutation unfolding and `import all` on legacy source retired; no changes to accepted sources. F10E Gate1 #41269330982 was red from deprecated `if_neg`; F10E Gate2 #41270021638 green and qualified. F10F Gate1 #41270798888 red from invalid matrix sum entrywise simp; F10F Gate2 #41271511363 green and qualified. Preserve all exact immutable runs and failed proof-method warnings; do not count greens as evidence beyond the stated exact declarations.
