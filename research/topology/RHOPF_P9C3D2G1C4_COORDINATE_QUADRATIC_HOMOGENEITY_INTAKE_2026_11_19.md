# RHOPF-P9C3D2G1C4 — source-exact scalar homogeneity intake

**Pacific date:** 2026-11-19.  
**Branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending original native and separately imported strict GREEN.

## Accepted source context

G1C3 [#44693041458](https://github.com/etblink/math/actions/runs/44693041458), exact tested `2c6764ebcd8b45c9fe021bf01f65b648d3573c87`, was strictly verified and its GREEN acceptance preserved in `43cbe4e254e396805e019e8da19736fe15c32018`. Accepted G1C1 proves positive-definiteness of the source original dot-self transported through the inverse of the accepted real-four linear map; G1C2 its continuity and G1C3 continuity and positivity of its square-root radius.

## Bounded new proof

Prove only:
```lean
theorem relationalRangeCoordinateDotSelf_smul (t : ℝ) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (t • x) =
      t * (t * relationalRangeCoordinateDotSelf x)
```

Take the exact accepted continuous linear equivalence `E := relationalRangeContinuousLinearEquivFinFour`, use its inverse real-linearity `map_smul E.symm`, then project onto the **actual original Gamma9 projector image** real-spinor carrier by `Subtype.val` and apply pinned `smul_dotProduct` / `dotProduct_smul`. This uses no preferred four-coordinate original Gamma plane and does not postulate isometry. Preserve the multiplicative association instead of a nonlinear approximation.

This is only a quadratic homogeneity theorem. It does not yet prove `Q(x/r(x)) = 1`, continuity of a radial normalizer, the continuous inverse of the normalization, standard (S³), the Hopf quotient, physical Fock-space implementation, or observables. Retain original Gamma source, toolchain pins, historical REDs, independent consumer discipline and frozen resource limits.

## Strict controls

Original BFSS/Gamma9 source pins through G1C3, original source-independent integer fixture, new exact native source and independently imported consumer pins; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; warnings-as-errors native and imported consumer; native and consumer `#print axioms` restricted to `propext`, `Classical.choice`, `Quot.sound`, without `sorryAx`; original artifact ZIP checksum and embedded tested SHA independently verified. No proof-budget increases or writes to `main`.
