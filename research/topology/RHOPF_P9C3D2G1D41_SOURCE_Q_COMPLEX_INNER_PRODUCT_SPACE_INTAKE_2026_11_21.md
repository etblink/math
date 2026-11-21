# RHOPF-P9C3D2G1D41 — source-Q detached complex InnerProductSpace intake

**Pacific date:** 2026-11-21. **Branch:** `integration/bfss-unified-research-20261108`. **Disposition: UNQUALIFIED, pending strict native and independent consumer GREEN and independently hashed original archive.**

## Accepted prerequisites
- D39 accepted [strict #44873258244](https://github.com/etblink/math/actions/runs/44873258244) at `97e3013aaa8245075c2aae670580d99eb6051967`, evidence SHA256 `11626f4a44a59d04cb4214c4a59734d76cd34c60e248ba1a258f235ecca95515`.
- D40 R2 accepted [strict #44876271777](https://github.com/etblink/math/actions/runs/44876271777) at `990c0d9de516ec40ef2192c0f40e0cbbcb368d66`; independently verified original artifact SHA256 `0bf29aed8a331c2a371012a1b5cbbd62c128a89052c4734bd7cedd43fec39923`; acceptance commit `ba8f9a193076bea9227f5f32d303991983d0a670`.
- R1 D40 RED (#44874693459) documented and preserved.

## Bounded proof
Use pinned Mathlib `InnerProductSpace.ofCore`, exact D37 Hermitian `InnerProductSpace.Core ℂ`, D38 detached `NormedAddCommGroup`, and D40 detached `NormedSpace ℂ`. Construct only a detached `InnerProductSpace ℂ RelationalSourceComplexFour` value with local typeclass expressions in its declaration type.

Qualified targets after future strict GREEN:
```lean
relationalSourceComplexFourInnerProductSpace
relationalSourceComplexFourInnerProductSpace_inner
relationalSourceComplexFourInnerProductSpace_norm_sq
```

Tests demand that bundled `inner ℂ x y` is **exactly** original Gamma9-source Hermitian `H(y,x)` (Mathlib conjugate-linear-first convention), and bundled squared norm is **exactly** original source `Q(x)`. No global instance, no unexamined replacement with coordinate Euclidean dot.

## Controls
Preflight pins original frozen Gamma9, all accepted ancestors, D40 source SHA, new D41 source/consumer SHA, exact Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original integer signed-permutation fixture, native and separate imported consumer both warnings-as-errors, six axiom reports restricted to `propext`, `Classical.choice`, `Quot.sound`, original evidence archive and exact tested SHA required. Preserve RED diagnostics as first-class evidence.

No global `InnerProductSpace`, completeness, Q-isometric ℂ² frame, Hopf quotient/Chern charge, or physical BFSS Fock/Gauss/Hamiltonian and stable soliton claim.
