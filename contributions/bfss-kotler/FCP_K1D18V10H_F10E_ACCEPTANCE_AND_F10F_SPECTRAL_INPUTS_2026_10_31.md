# K1D18V10H — F10E accepted; F10F exact positive quadratic / symmetric gamma spectral inputs

Date: 2026-10-31 PDT, research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F10E strict acceptance — independently verified

- [V10H-F10E Gate2 run #41270021638](https://github.com/etblink/math/actions/runs/41270021638) completed SUCCESS, attempt 1, job `124740704075`, exact tested SHA `f7234a54c77534471ff9abc15f8408fed1fb1758`. Qualified F10E source blob `3922916e49fc961efa99a72d706ca83ca704e3d6`.
- Pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact original gamma source blob `b9b8192055c70f0d001d7982669b9823c55562ed`; preflight PASS; dependency restore PASS; accepted F9 ancestor rebuild PASS; fresh F10E `-DwarningAsError=true` compile PASS; **four independent declaration types and root-axiom whitelist PASS**, no `sorryAx`.
- Exact four now accepted: `source9OriginalGamma_basis_mul_self`, `source9OriginalGamma_anticommute`, `source9OriginalGamma_basis_trace_zero`, `gammaNineRealLinear_trace_zero`. Axioms only `propext`, `Classical.choice`, `Quot.sound`.
- Formally for **original** public gamma16, `Γ(v)^2=Q(v)I_{16}` (prior source), `tr Γ(v)=0` (F10E), `det Γ(v)^2=Q(v)^{16}` and `det Γ(v)=+Q(v)^8 ∨ det Γ(v)=-Q(v)^8` (F9). **No sign selected**.
- [Qualified artifact #13068408871](https://github.com/etblink/math/actions/runs/41270021638/artifacts/13068408871), sha256 `fba4630537e7dc0d8d4e7a65d2feb231a8ff77cab7f7914222bcffdeab3d214f`, nonexpired when reviewed.
- Gate1 [#41269330982](https://github.com/etblink/math/actions/runs/41269330982) was red solely for pinned Lean deprecation of `if_neg`, not a proof gap; correction to `ite_eq_right` established source strict qualification. Preserve this red alongside F10 private-table historical reds, never erase negative history.

## F10F: next exact spectral-input candidate — NOT QUALIFIED

Three source-exact declarations:
1. `source9Quadratic_eq_zero_iff v : source9Quadratic v = 0 ↔ v = 0`, using accepted `source9Quadratic_eq_dot` and pinned Mathlib `dotProduct_self_eq_zero`.
2. `source9Quadratic_pos_of_ne v hv : 0 < source9Quadratic v` for `hv : v ≠ 0`, via source exact finite sum of real squares and zero iff lemma.
3. `gammaNineRealLinear_isSymm v : (gammaNineRealLinear v).IsSymm` via public original `gamma_symmetric`, finite-sum entrywise symmetry, explicitly avoiding private signed permutations.

These are the **precise prerequisites** for a later genuine real symmetric matrix eigenvalue multiplicity argument. With F10E `tr=0` and `Γ²=QI`, nonzero v implies Q>0, eigenvalues of Γ must be ±√Q and trace zero forces multiplicity 8/8; then det Γ = (-1)^8 Q^8 = +Q^8. This last spectral argument is a **mathematical plan**, NOT a formally proved source theorem today. It requires actual pinned spectral theorem and dimension/multiplicity type bridges; do not infer it from standalone trace zero.

The F10F gate accepts only if original F10E ancestry rebuilds, F10F compiles fresh warningAsError and **three independently elaborated exact types and root-axiom reports** match whitelist. No changed accepted modules, private table exposure, invented positive determinant, unproved Lie connectedness, recursion/heartbeat increase, extra axiom, sorry/admit, native_decide, altered pinned Mathlib, main/upstream or 48-label paired Fock ordering.

## Negative knowledge and open scope

F1–F9 and F10E accepted. Original F10 full-matrix Gate1 #41266215820, Gate2 #41266892206, Gate3 #41267510559; F10D parser rejection #41268424166 remain RED/UNQUALIFIED. The failed method assumed access to imported private `gammaInt` or used `import all` in legacy source; both rejected. F10E succeeded only by using PUBLIC Clifford identities and real matrix trace cyclicity; replicate its source-typed, minimal, declaration audited methodology.

Global source Spin9 determinant +1, original paired SO48, Spin48 lift/cover, Fock action and BFSS physical spectral claims remain UNPROVED. We do not confuse green CI with a theorem that was not stated.
