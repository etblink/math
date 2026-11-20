# RHOPF-P9C3D2G1D24 — source-original Gamma9 inner-product Core intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until strict native and independent consumer CI and original artifact ZIP checks.

D23 [run #44832416237](https://github.com/etblink/math/actions/runs/44832416237) strictly verified a symmetric positive definite source-exact real bilinear form from original Gamma9 at tested SHA `e8aa04c1e137c6ad0301aedd5a805b6386cf00e7`. Original artifact SHA-256 independently verified `5d33a3a496d3797c83c606253a8136036050e3fa252b4a91ff0e773cf7dfbc8c`; archived strict-GREEN acceptance commit `a933bc9358f5e407ae7be593229ac75c44c62ab3`.

## Pin-exact Mathlib interface and architecture

Pinned Mathlib `Mathlib/Analysis/InnerProductSpace/Defs.lean` at `d13f23b723b8a846827a245b89c10fc7d3f11612` declares:
```lean
structure PreInnerProductSpace.Core (𝕜 : Type*) (F : Type*) ...
    extends Inner 𝕜 F where
  conj_inner_symm x y : conj (inner y x) = inner x y
  re_inner_nonneg x : 0 ≤ re (inner x x)
  add_left x y z : inner (x + y) z = inner x z + inner y z
  smul_left x y r : inner (r • x) y = conj r * inner x y

structure InnerProductSpace.Core (𝕜 : Type*) (F : Type*) ...
    extends PreInnerProductSpace.Core 𝕜 F where
  definite : ∀ x, inner x x = 0 → x = 0
```

The pinned Mathlib file **warns explicitly** against installing an additional induced normed-space instance on a carrier already bearing another norm. Fin4→ℝ already has a canonical coordinate norm. Accordingly D24 bundles **standalone core data** only and does **not** globally or locally install `NormedAddCommGroup`, `InnerProductSpace`, or an inconsistent duplicate norm.

## Strict D24 target

Construct `noncomputable def relationalSourceInnerCore : InnerProductSpace.Core ℝ (Fin 4 → ℝ)` with `inner := relationalSourceBilinForm`, proving conjugate symmetry by D23, positivity by D21+23, left additivity and homogeneity by D22, definite by D23 positive diagonal. Check `relationalSourceInnerCore_inner_apply` and `relationalSourceInnerCore_self_eq_quadratic` in native/independent consumer; 3+3 `#print axioms` reports limited to `propext`, `Classical.choice`, `Quot.sound`.

Strict CI: exact original Gamma9/P/J/Circle, source accepted D23 and pin-exact 4.34.1/Mathlib, original independent integer fixture, warnings-as-errors, original ZIP integrity and exact SHA manifest, no proof-budget overrides, `sorry`, `admit`, new axioms, source/main edits. Stop on RED and preserve original diagnostics.

**Open after this gate:** a topology/norm-compatible newtype or explicit local construction of full real inner product, source-compatible Hermitian complex dimension-two geometry and orthonormal coordinates for (J_4), scalar S1 conjugacy and classical Hopf quotient/Chern charge, original physical 48-Majorana Fock/Gauss/Hamiltonian and stable hopfion. No physical/topological charge claims until original-source verification.
