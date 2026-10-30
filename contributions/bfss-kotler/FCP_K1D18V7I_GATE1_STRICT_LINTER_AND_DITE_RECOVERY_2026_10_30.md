# V7I Gate 1 — pinned Lean strict-linter/deprecated dependent-if recovery

**Project Lead, 2026-10-30 UTC.** Preserve mathematical truth, negative knowledge and source-exact qualification; this candidate remains unaccepted until a terminal strict pass.

## Failed run
- [GitHub Actions run #41024449305](https://github.com/etblink/math/actions/runs/41024449305): completed failure, tested exact SHA `6b14e52af7a6ef22364935d481fac973614370bf`, attempt 1, job `123959123330`, finished 2026-10-30T08:19:37Z.
- Failed source Git blob `b6272c20faa66ec811b265ae36a0d516a5975998`. Preserved artifact `12963431632`, SHA-256 `3452b82490798b7d7bb7938e79f4d730fdbfd104749abf247c096381ad65f1b4`.
- The original source pin and 134-declaration lexeme controls, Lean 4.34.1 / pinned Mathlib restoration and validated sealed 37-module/81-root ancestry succeeded. The fresh warning-as-error compilation failed in V7I and the separate 134-root type/axiom audit was SKIPPED.
- First causal problem at line 39:7: `Variable name h is not explicitly referenced`, for the dependent-if binder in the recursive list definition. All other observed errors were deprecated `dif_pos`/ `dif_neg` at lines 72, 74, 89 and 93 and an unused `dif_pos rfl` simplifier argument at line 89. Pinned Lean recommends modern `dite_eq_left`/`dite_eq_right` for dependent if. **Do not suppress unused-variable, deprecated, or unused-simp lints.**
- All five V7I candidate declaration axiom prints from the failed step had only `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`; this supports diagnosis as proof syntax hygiene, not strict acceptance or independent audit completion.

## Exactly five affected proof/source lines in Gate 2
- Line 39: `if h : u = 0 then sourceEuclideanUnitNormals tail` → `if _h : u = 0 then sourceEuclideanUnitNormals tail`.
- Line 72: `· simp only [sourceEuclideanUnitNormals, dif_pos hu, List.length_cons]` → `· simp only [sourceEuclideanUnitNormals, dite_eq_left hu, List.length_cons]`.
- Line 74: `· simp only [sourceEuclideanUnitNormals, dif_neg hu, List.length_cons]` → `· simp only [sourceEuclideanUnitNormals, dite_eq_right hu, List.length_cons]`.
- Line 89: `sourceEuclideanUnitNormals, dif_pos rfl]` → `sourceEuclideanUnitNormals]`.
- Line 93: `sourceEuclideanUnitNormals, dif_neg hu]` → `sourceEuclideanUnitNormals, dite_eq_right hu]`.

These changes only anonymize an unused dependent-if binder, replace deprecated dependent-if simp lemmas with Lean's recommended forms, and remove one unused simp argument. They do NOT alter the actual recursive function, original source matrix, Euclidean coordinates, source Q, or any theorem statement.

- New V7I source blob `b796aef91beed8b57bd1508fea178332517dd8fe`; only corresponding SHA pin is changed in `.github/workflows/bfss-kotler-k1d18v7i-cartan-zero-free-unit-list-strict.yml`. No dependency, proof-limit, linter, toolchain, axiom whitelist or accepted source changes.
- Gate 2 still requires **38 fresh warning-as-error source modules, 134 exact source declaration type/axiom audits, 81 sealed accepted ancestor roots**, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- A new strict green plus actual inspection of compiler and axiom logs is mandatory. A red requires identification of its earliest real error and preservation of that SHA and artifact.

## Source-exact mathematical boundary
V7I aims to remove zero-normal identity factors from an arbitrary ordered Cartan reflection list, replace remaining nonzero normals with equal-reflection unit normals, retain list length bounds, and preserve the whole product. It does not prove determinant parity, Q-unit source lifting, original sourceSO generation, unconditional Spin(48) surjectivity, global Spin(9) or BFSS spectral existence. The previously accepted V7H remains unchanged. **No changes to main, original FCP provenance or upstream community.**
