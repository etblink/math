# RHOPF-P9C3D2G1D23 — original Gamma9 source-real bilinear form packaging intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until native and independent Lean strict GREEN with original evidence artifact verified.

D22 [run #44829697615](https://github.com/etblink/math/actions/runs/44829697615) strict qualified all four real bilinearity equations at tested commit `6a4477a975a120dcd5b1d6a53edd5fe22f45a763`; independently recalculated ZIP SHA-256 `8735cccc5ec0a33aa3a688e3a75b39a707240bd8b01c0790223b3233534f43df`. Accepted D22 at `0ef81388eef4efe2a5845e3f0801c67175bd459e`.

## Narrow D23 original-source contract

Using the pinned Mathlib `LinearMap.mk₂` and the *accepted* D22 add/smul left/right theorems, package `relationalSourceTransportedDot` (previously equal to original Gamma9 Q polarization D20) as
```lean
noncomputable def relationalSourceBilinForm :
    LinearMap.BilinForm ℝ (Fin 4 → ℝ)
```
and prove source-preserving application, symmetry, original Q diagonal and strict positive diagonal:
```lean
relationalSourceBilinForm_apply
relationalSourceBilinForm_symm
relationalSourceBilinForm_self_eq_quadratic
relationalSourceBilinForm_self_pos_of_ne_zero
```
This is **only** bundling a real symmetric positive definite bilinear form, **not** yet installing a source-defined real `InnerProductSpace` instance globally. The accepted noncanonical source coordinate map `E` remains nonisometric for ordinary `Fin 4 → ℝ` dot unless proven.

Do not add replacement Gamma9 entries, postulated complex scalar action, global theory-changing instances, `sorry`, `admit`, `axiom` or override Lean proof budgets. The original physical 48-Majorana BFSS Fock/Gauss/Hamiltonian and stable hopfion remain open. Standard scalar Circle-equivariant ℂ² isometry, Hopf quotient and Chern class also remain unproved.

Strict workflow freezes original Gamma9/P/J/Circle source and D20–D22, exact independent original signed-permutation fixture, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, preflight blob hashes and declared theorem signatures, warnings-as-error native and separately imported consumer, 5+5 allowed axiom reports restricted to `propext`, `Classical.choice`, `Quot.sound` and original RED/GREEN ZIP archive with exact commit SHA and SHA-256 audit. All original source Gamma9 and `main` untouched.
