# RHOPF-P9C3D2G1D29 — original Gamma9 source complex scalar action intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Disposition:** UNQUALIFIED until original native/independent strict GREEN with archive SHA verification.

D28 [run #44849029523](https://github.com/etblink/math/actions/runs/44849029523) original strict GREEN at tested SHA `c3427a7707d763b721b0ccb608a0b353c24b246b` qualified the exact original Gamma9 full complex identities `H(J4x,y)=i H(x,y)` and `H(x,J4y)=-i H(x,y)`. The original archive independently recalculated SHA-256 is `e09ab6c9263ce749c28e1b2d060687a83e196f798f0050b6ed76223fc008434a`. Acceptance commit: `2477abebbe2a107bd99a08fb7d69e7ed7c0cafa6`.

## Narrow mathematical scope

Define only a standalone candidate scalar-action function (not an instance):

```lean
noncomputable def relationalSourceComplexScalarAction
    (z : ℂ) (x : Fin 4 → ℝ) : Fin 4 → ℝ :=
  z.re • x + z.im • relationalPhaseJFourLinear x
```

Prove six source-exact declarations: the candidate definition, zero action, one action, imaginary-unit action equals exact original Gamma9 `J4`, additive scalar law and additive vector law. No assumed standard Euclidean complex-coordinate action. Uses accepted original D10 linear `J4` and pinned Mathlib complex `re/im` plus additive module API. The unproved associativity `(zw)⋅x=z⋅(w⋅x)`, complete module laws, complex sesquilinearity and bounded `Module ℂ` construction require separate strict gates.

## Controls

Exact frozen original Gamma9/P/J/Circle and source D27/D28 hash pins, source-independent original signed-permutation integer fixture, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Native and imported independent consumer use warnings-as-error; 6 native and 6 independent `#print axioms` limited to `propext`, `Classical.choice`, `Quot.sound`; reject `sorryAx`, source signature drift, budget overrides. Archive the original ZIP and exact commit, independently verify ZIP SHA-256 before accepting; preserve negative RED knowledge if failure.

No global typeclass/standard norm replacement, original Gamma9 changes, `main` edits, classical Hopf scalar quotient/Chern class, or physical original BFSS 48-Majorana Fock/Gauss/Hamiltonian/soliton claims.
