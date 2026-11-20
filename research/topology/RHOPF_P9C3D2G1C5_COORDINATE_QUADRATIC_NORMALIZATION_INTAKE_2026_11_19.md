# RHOPF-P9C3D2G1C5 — exact transported radial quadratic normalization intake

**Pacific date:** 2026-11-19.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending original native source and independent imported consumer strict GREEN.

G1C4 strict original [#44696104945](https://github.com/etblink/math/actions/runs/44696104945) tested at `280d888c23a7ca4a623da495528a593720176a90` has accepted `Q(t • x) = t * (t * Q(x))` and was preserved at `a493e2d7327faa28babd8e4beeeee1396f9c8218`. G1C1 and G1C3 provide exact source-original positive-definiteness and positive, continuous radius `r(x)=sqrt(Q(x))`.

## Bounded statements

```lean
theorem relationalRangeCoordinateRadius_mul_self
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateRadius x * relationalRangeCoordinateRadius x =
    relationalRangeCoordinateDotSelf x

theorem relationalRangeCoordinateDotSelf_inv_radius_smul
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateDotSelf
      ((relationalRangeCoordinateRadius x)⁻¹ • x) = 1
```

First use pinned `Real.mul_self_sqrt` under accepted Q positivity. Then apply accepted G1C4 scalar homogeneity at `r(x)⁻¹`, rewrite `Q(x)=r(x)*r(x)`, cancel with `r(x)≠0` supplied by accepted G1C3 positivity. This follows the accepted earlier G0C sqrt normalization proof: preserve exact source and no chosen coordinate subspace.

The result certifies only that this particular radial normalization lands in the `Q=1` level set. It does **not** yet construct and prove continuous mutually inverse maps between that level set and the standard dot-one sphere of `Fin 4 → ℝ`; `Fin 4 → ℝ` carries its product norm rather than automatically the desired Euclidean dot norm. It does not establish `S³`, standard Hopf Circle equivariance or quotient, or physical Fock/hopfion claims.

## Strict qualification

Exact frozen BFSS/Gamma9/Circle/projector/G0A/B/C/G1A/B/C0/C1/C2/C3/C4 pins, new native and independent consumer SHA pins, original independent integer fixture, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warnings-as-errors native and imported consumer, both original axiom reports allowing only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, exact artifact ZIP checksum and embedded tested SHA independent verification. Stop and document any RED. No proof-budget increases or `main` edits.
