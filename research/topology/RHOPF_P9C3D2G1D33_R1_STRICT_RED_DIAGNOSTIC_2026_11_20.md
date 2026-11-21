# RHOPF-P9C3D2G1D33 R1 — original Gamma9 native RED retained

**Date (Pacific):** 2026-11-20. **Disposition:** REJECTED_NATIVE_RED.  
**Exact tested commit:** `a73e484c999028829eec55157e2b4b73ade52ff2` on `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44858066562](https://github.com/etblink/math/actions/runs/44858066562), attempt 1 failure, job `136704809502`.  
**Original artifact:** [#14689306233](https://github.com/etblink/math/actions/runs/44858066562/artifacts/14689306233); downloaded original five-file ZIP and independently computed SHA-256 `ede54ce107ed644cebb306f73dc8e975c5721f1655bf24754d053b76c0bbd6ae`. ZIP digest matches upload and GitHub metadata, and embedded `exact-tested-commit.txt` matches.

## Source-original failure, not infrastructure

Original Gamma9 source-contract/pinned source hashes PASS; original source-independent signed-permutation integer fixture PASS. Exact Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore PASS. 9,080 dependency build jobs PASS.

Native D33 original-source compilation **RED**:
- line 64 `change` fails for `(↑a * relationalSourceHermitianCandidate x y).re`; the intended real form `a * H(x,y).re` is propositionally, not definitionally, reduced without `Complex.re_ofReal_mul`.
- line 69 `change` fails for `(↑a * relationalSourceHermitianCandidate x y).im`; requires `Complex.im_ofReal_mul`.
- Native `#print axioms` for `relationalSourceHermitianCandidate_real_smul_left` includes `sorryAx`, so all D33 R1 declarations are **unqualified as a gate**. Native `add_left` and wrapper-add-left did not incur errors, but no partial D33 promotion.
- Independent source-typed consumer SKIPPED after native RED.

Pinned Mathlib `Mathlib/Basic/Complex/Basic.lean` confirms both named lemmas. Bounded R2: add one real/imaginary rewrite before each failing `change`; do not alter theorem statements, original source Gamma9/P/J/Circle, accepted metrics, any norm or module instance, independent consumer, or original failures. Update D33 source blob pin in strict workflow; qualify only with native+independent strict GREEN, six clean axiom reports, original evidence ZIP integrity and exact tested SHA.

Original Gamma9 and `main` unchanged. No real-homogeneity acceptance yet, no full complex sesquilinearity, classical Hopf quotient/Chern class or physical BFSS Fock/hopfion claimed.
