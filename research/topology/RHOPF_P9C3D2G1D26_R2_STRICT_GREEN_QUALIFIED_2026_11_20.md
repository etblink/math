# RHOPF-P9C3D2G1D26 R2 — source Gamma9 complex Hermitian candidate strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`; original Gamma9 and `main` unchanged.  
**Original strict run:** [#44844922925](https://github.com/etblink/math/actions/runs/44844922925), attempt 1 SUCCESS, exact tested `b62f47a0c04e18ecdca76cc93da742a830eaa677`, original job `136662156620`.  
**Original artifact:** [#14683436239](https://github.com/etblink/math/actions/runs/44844922925/artifacts/14683436239).  
**Independently recalculated original ZIP SHA-256:** `aabbea78a985de02501b3b17b18a3bf1fb5a6c58bd77b0c1241e81b185073a6f`; matches GitHub's upload and artifact digest. Embedded `exact-tested-commit.txt` confirms the exact tested SHA.

## Original strict checks

- Frozen source Gamma9/P/J/Circle and accepted D25 source hashes preflight PASS; independent Gamma9 signed-permutation integer fixture PASS.
- Exact pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted dependency build **9,073 jobs** successful.
- Native source and separately imported consumer with warning-as-error: PASS.
- Fourteen `#print axioms` reports (seven native, seven imported) list only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` and no errors.
- Original ZIP downloaded independently; original ZIP bytes hashed; six members inspected: `exact-tested-commit.txt`, `native-original-hermitian-candidate-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified scope

```lean
noncomputable def relationalSourceHermitianCandidate
    (x y : Fin 4 → ℝ) : ℂ :=
  ⟨relationalSourceInnerCore.inner x y,
    -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y⟩
```

All seven declarations qualified: `relationalSourceHermitianCandidate`, `relationalSourceHermitianCandidate_re`, `relationalSourceHermitianCandidate_im`, `relationalSourceHermitianCandidate_conj_symm`, `relationalSourceHermitianCandidate_self_im_zero`, `relationalSourceHermitianCandidate_self_re_quadratic`, `relationalSourceHermitianCandidate_self_re_pos_of_ne_zero`. Thus for original source (B_Q) and (J₄), (H(x,y)=B_Q(x,y)-iB_Q(J₄x,y)) has exact real/imaginary projections, conjugate symmetry, zero diagonal imaginary part, original Q on real diagonal and strict real-positive diagonal for nonzero x. This is a function into ℂ, **not yet** a proof of complete complex sesquilinearity or bundled complex inner product.

**R1 rejected and preserved:** [#44841481734](https://github.com/etblink/math/actions/runs/44841481734), tested `11509183577c8c59ff88c33daee6e2c8c4f5c53a`, original RED SHA-256 `9381c55da2eb8ecfbcc7c861822b6b92d4ab674da6eaf83a8006cbc4f541f8be`, evidence committed at [`3c5f0d8c`](https://github.com/etblink/math/commit/3c5f0d8caed461b46cdc44a5bd9a3d0f8a83a779). R2 replaced non-existent `Complex.conj` with pinned Mathlib's `star` in native theorem and independently imported consumer only.

## Next controlled boundary

Before a complex module instance, prove (H(J₄x,y)=iH(x,y)) and (H(x,J₄y)=-iH(x,y)) for the exact source Hermitian candidate using accepted D10 (J₄^2=-I), D22 real bilinearity, D23 symmetry, D25 skew-adjointness. This can be proved as real/imaginary component identities first, reducing dependence on complex Mathlib API. Only then define and check (zcdot x=operatorname{Re}(z)x+operatorname{Im}(z)J₄x) and the module axioms. No global duplicate norm, no choice of a surrogate coordinate Euclidean metric, and no physical Fock or Hopf charge claims.
