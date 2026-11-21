# RHOPF-P9C3D2G1D30 — original Gamma9 complex scalar associativity intake

**Date:** 2026-11-20 Pacific. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until native and independently imported original-source strict GREEN and original evidence verification.

D29 original strict [run #44850914416](https://github.com/etblink/math/actions/runs/44850914416) at tested SHA `db70ef9dfae8654c6393f5eb4ebf42e6acee9d4a` qualified the original Gamma9 source-derived action `z⊙x=z.re•x+z.im•J₄x` and zero/one/I/additivity laws. Original evidence ZIP SHA256 independently recalculated `8a8c7583e01ccc92f7783e52ab25d8df4db3e42c0e41a2d200a64fe984d287ec`. D29 acceptance commit `3ebb778f1c75a254836d8f9704b645a440431206`.

## D30 bounded mathematical proof target

The accepted source-original real-linear `J₄` (D10) satisfies `J₄²=-I`. Define no new complex action, metric or gamma data. Prove, for D29's *same source action*:
```lean
relationalPhaseJFourLinear_complexScalarAction
    (w : ℂ) (x : Fin 4 → ℝ) :
    J4 (relationalSourceComplexScalarAction w x) =
      w.re • J4 x - w.im • x

relationalSourceComplexScalarAction_mul
    (z w : ℂ) (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction (z*w) x =
      relationalSourceComplexScalarAction z (relationalSourceComplexScalarAction w x)

relationalSourceComplexScalarAction_zero_vector
    (z : ℂ) :
    relationalSourceComplexScalarAction z (0 : Fin 4 → ℝ) = 0
```
Use pin-exact `Complex.mul_re/mul_im`, original source J4 `map_add/map_smul` and `J4²=-I`, and algebraic module rewriting. Both native and independent consumer must compile as exact Gamma9 source.

## Strict proof contract

Frozen source Gamma9/P/J/Circle, accepted D29 and prior source hashes, independent original signed-permutation integer fixture, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; warning-as-error native and independent consumer; 3+3 `#print axioms` restricted to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, no proof-budget overrides. Independent audit of original artifact ZIP and exact tested SHA before acceptance; preserve RED diagnostics if failure.

Even a GREEN leaves *explicit bundled Module ℂ, full Hermitian sesquilinearity and `ℂ²` Q-isometric frame*, standard scalar Circle Hopf quotient/Chern charge, and physical original BFSS 48-Majorana Fock/Gauss/Hamiltonian/soliton **unqualified**. Never alter original Gamma9, `main` or history.
