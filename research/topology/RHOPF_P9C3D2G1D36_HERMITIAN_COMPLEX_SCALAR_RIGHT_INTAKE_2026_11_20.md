# RHOPF-P9C3D2G1D36 — exact original Gamma9 Hermitian second-variable conjugate-linearity intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`. **Disposition:** UNQUALIFIED until original native+independent strict GREEN and original ZIP SHA-256 verification.

D35 original strict [run #44863568310](https://github.com/etblink/math/actions/runs/44863568310) at exact tested SHA `3aa1689e37d528f3ea862e0daa2eb6ece0733997`; independent original ZIP SHA256 `47df8618660f6b2eb157fc5ad3638a32a685b0fc5720b7718b3fe3160cbe4bb5`. D35 accepted at `b057ceb16aa3d5f97d92fc2e06a0411635954846`.

## Bounded D36 proof scope

D26 original Gamma9 source Q-Hermitian candidate has qualified conjugate symmetry `star (H y x)=H x y`. D35 qualified arbitrary complex first-variable linearity on source real coordinates and D31 isolated `Module ℂ`. Pinned Mathlib `Mathlib.Algebra.Star.Basic` provides `star_mul'` for commutative star rings, yielding `star(z*H(y,x))=(star z)*star(H(y,x))`. Derive precisely:
```lean
relationalSourceHermitianCandidate_complex_smul_right
    (z : ℂ) (x y : Fin 4 → ℝ) :
    H x (relationalSourceComplexScalarAction z y) =
      star z * H x y

relationalSourceComplexFourHermitian_smul_right
    (z : ℂ) (x y : RelationalSourceComplexFour) :
    H x (z • y) = star z * H x y
```
Independent consumer tests both, plus combined `H(z•x,w•y)=z*(star w)*H(x,y)` using D35 and D36. This establishes algebraic Hermitian sesquilinearity **only if** original native and imported consumer strict prove, not before.

Frozen exact source Gamma9/P/J/Circle, every accepted D35 source and previous, independent original signed-permutation integer fixture. Exact Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source and independent consumer warnings-as-errors, 2+2 axiom reports only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` or proof budget overrides. Original evidence ZIP and exact tested SHA independently inspected before acceptance. Preserve historical RED.

No claim of bundled `InnerProductSpace ℂ`, norm or completeness, Q-isometric `ℂ²` frame, original Gamma9-source Circle action intertwining / Hopf quotient / Chern charge, 48 Majorana physical Fock / Gauss / Hamiltonian / stable hopfion. Keep original Gamma9 and `main` untouched.
