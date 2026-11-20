# RHOPF-P9C3D2G1D23 R1 — original Gamma9 source bilinear form strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`; original Gamma9 and `main` unchanged.  
**Original strict run:** [#44832416237](https://github.com/etblink/math/actions/runs/44832416237), attempt 1 SUCCESS, exact tested SHA `e8aa04c1e137c6ad0301aedd5a805b6386cf00e7`; job `136620375222`.  
**Original archive:** [#14677981228](https://github.com/etblink/math/actions/runs/44832416237/artifacts/14677981228).  
**Independently recalculated original ZIP SHA-256:** `5d33a3a496d3797c83c606253a8136036050e3fa252b4a91ff0e773cf7dfbc8c`; exactly matches Actions upload and GitHub artifact digest. `exact-tested-commit.txt` confirms tested SHA.

## Original strict evidence

- Frozen source-original Gamma9/P/J/Circle, Mathlib constructor interface and accepted D22 source hashes: preflight PASS; original independent signed-permutation integer fixture PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original source dependency build **9,070 jobs** PASS.
- Native warning-as-error and imported independent consumer warning-as-error: PASS.
- Ten `#print axioms` reports (five native, five independent), each restricted to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` or Lean error.
- Original ZIP independently downloaded and SHA-256 recomputed using local `sha256sum`; six entries inspected: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-original-source-bilin-form-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified source-exact mathematics

```lean
noncomputable def relationalSourceBilinForm :
    LinearMap.BilinForm ℝ (Fin 4 → ℝ)

theorem relationalSourceBilinForm_apply (x y : Fin 4 → ℝ) :
    relationalSourceBilinForm x y = relationalSourceTransportedDot x y

theorem relationalSourceBilinForm_symm (x y : Fin 4 → ℝ) :
    relationalSourceBilinForm x y = relationalSourceBilinForm y x

theorem relationalSourceBilinForm_self_eq_quadratic (x : Fin 4 → ℝ) :
    relationalSourceBilinForm x x = relationalRangeCoordinateDotSelf x

theorem relationalSourceBilinForm_self_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalSourceBilinForm x x
```

The bundled `LinearMap.BilinForm` uses the native accepted D22 four bilinearity laws and exactly original Gamma9 D20 transported dot. It preserves the original `Q`, not an assumed ordinary Euclidean coordinate norm, and has native D21 positive-definite diagonal. It is a source-specific, proved real symmetric positive-definite bilinear form without global `InnerProductSpace` instance.

## Controlled next route

Inspect frozen Mathlib's `InnerProductSpace.ofCore`, `InnerProductSpace.Core`, or suitable constructor rather than inventing one; define a **local, non-global** real inner-product-space instance from the qualified D23 bilinear form, with exact evaluation and Q-diagonal tests in independent consumer. Only after that obtain original (J_4) complex-compatible Hermitian geometry and explicit isometric `ℂ²` coordinates. No classical scalar Hopf quotient or topological Chern charge, and no original physical 48-Majorana BFSS Fock/Gauss/Hamiltonian or stable hopfion are yet established. Preserve Gamma9, `main`, Mathlib pins, previous GREEN/RED evidence.
