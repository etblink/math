# RHOPF-P9C3D2G1D20 R1 — exact original Gamma9 polarized Q equals transported source dot strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`. `main` and source Gamma9 untouched.  
**Original run:** [#44824967460](https://github.com/etblink/math/actions/runs/44824967460) SUCCESS, attempt 1, exact SHA `c226a93ead5d4e5a3e7fea27920d78f77891ab20`, job `136595139353`.  
**Artifact:** [#14673589460](https://github.com/etblink/math/actions/runs/44824967460/artifacts/14673589460).  
**Independently calculated original ZIP SHA-256:** `2b76b0d669683bcc5655b4ccbca4297fd0b10dfe35678b4f5e332357d40b387d`, matching Actions upload and GitHub artifact digest. The embedded `exact-tested-commit.txt` confirms `c226a93ead5d4e5a3e7fea27920d78f77891ab20`.

## Original strict qualification
- Frozen original Gamma9/P/J/Circle and accepted G1D19 source-exact hashes: PASS; independent original integer fixture PASS.
- Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build **9,067 jobs** PASS; native and independent imported consumer `-DwarningAsError=true` PASS.
- Four native/independent `#print axioms` reports list only `[propext, Classical.choice, Quot.sound]`, with no `sorryAx` or compiler errors.
- All six ZIP members independently inspected: `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `independent-lean-types-and-axioms.log`, `native-polar-equals-original-dot-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. SHA-256 verified using local `sha256sum` against both original CI upload log and GitHub digest.

## Qualified mathematics

```lean
noncomputable def relationalSourceTransportedDot
    (x y : Fin 4 → ℝ) : ℝ :=
  (relationalRangeContinuousLinearEquivFinFour.symm x).1 ⬝ᵥ
    (relationalRangeContinuousLinearEquivFinFour.symm y).1

theorem relationalSourcePolarQuadratic_eq_transported_dot
    (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic x y =
      relationalSourceTransportedDot x y
```

The original (Q(x)) from the real 16-spinor Euclidean dot self transported by accepted noncanonical `E.symm` has polarization (B_Q(x,y)) exactly the same as the native real spinor Euclidean dot product pulled back separately in both arguments. This is a concrete source-exact algebraic equality; it does NOT presume that `E` is an isometry for ordinary `Fin 4 → ℝ` coordinate dot.

## Remaining scope

The transported dot is mathematically bilinear, symmetric and positive definite by source dot and `E.symm` real-linear injectivity, but these have not yet been formalized as a complete source-specific Lean inner product. The next microgates should prove bilinearity/symmetry/positive definiteness and package a real inner product, then use qualified `J4²=-I` and (B_Q(J4x,J4y)=B_Q(x,y)) to build a complex Hilbert structure and complex-orthonormal frame. Only then prove an **explicit** intertwiner to the standard scalar Circle action on `ℂ²`, ordinary S³, Hopf quotient and Chern class. Original physical 48-Majorana Fock/Gauss/Hamiltonian implementation and stable hopfion are OPEN. Do not touch Gamma9, `main`, Mathlib pins or trust boundaries.
