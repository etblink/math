# RHOPF-P9C3D2G1C1 R1 — original Gamma9 coordinate quadratic positivity strict GREEN

**Pacific date:** 2026-11-19 (CI completed 2026-11-20T06:47:28Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44688527281](https://github.com/etblink/math/actions/runs/44688527281), attempt 1 SUCCESS.  
**Exact tested commit:** `446fe80d307e19c990136696c82d350b6b65778e`.  
**Original job:** `136128506312`.  
**Original archive:** [#14607549165](https://github.com/etblink/math/actions/runs/44688527281/artifacts/14607549165).  
**Independently verified original ZIP SHA-256:** `e92341b2fc2ee267f82b4d84d1c11c92d506e496113f5f12199f9cba4076de47`, exact match to the original CI-upload digest.  
**Original archive `exact-tested-commit.txt`:** `446fe80d307e19c990136696c82d350b6b65778e`, independently verified.
**Disposition: ACCEPT** `FCP.RHOPFP9C3D2G1C1.relationalRangeCoordinateDotSelf_pos_of_ne_zero` as original-source-native and independent-consumer strict GREEN.

## Strict qualification

- Exact original BFSS Core, original Gamma9, relational projector/Circle and frozen G0A/B/C/G1A/B/C0 source hash pins: PASS.
- Exact G1C1 native and independently imported consumer hashes, proof-contract preflight: PASS.
- Source-independent original Gamma9 signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original qualified dependency build (9037 jobs): PASS.
- Native source `-DwarningAsError=true` compilation: PASS.
- Independently imported source-typed consumer `-DwarningAsError=true` compilation: PASS.
- Both native and independent `#print axioms` reports exactly `[propext, Classical.choice, Quot.sound]` and no `sorryAx`: PASS.
- Original ZIP independently downloaded and sha256sum matched CI. Archive contains exactly `exact-tested-commit.txt`, `native-coordinate-quadratic-positivity-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. Exact tested commit matches: PASS.
- No new axioms, proof-budget overrides, alternate matrices, preferred coordinate plane, physical Fock changes or writes to `main`.

## Qualified source-exact mathematical result

```lean
noncomputable def relationalRangeCoordinateDotSelf (x : Fin 4 → ℝ) : ℝ :=
  let w : LinearMap.range (Matrix.toLin' relationalProjector) :=
    relationalRangeContinuousLinearEquivFinFour.symm x
  w.1 ⬝ᵥ w.1

theorem relationalRangeCoordinateDotSelf_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalRangeCoordinateDotSelf x
```

For the actual original projector image, the accepted G1C0 continuous linear equivalence maps it to `Fin 4 → ℝ`. The source real-16-spinor Euclidean quadratic `v ⬝ᵥ v`, pulled back via the **inverse** of this exact chosen equivalence, is strictly positive at every `x ≠ 0`. Proof uses injectivity of the accepted equivalence, exact submodule carrier, pinned `dotProduct_self_eq_zero`, and finite sum-of-real-squares nonnegativity.

## Remaining boundary

This is positive-definiteness, not yet continuity of the scalar `Q(x)`, radial normalization, homeomorphism with a standard (S^3), Circle-equivariance, Hopf fibration quotient, or physical BFSS/Fock topological state. Next bounded gate should establish `Continuous relationalRangeCoordinateDotSelf` using the actual continuous linear inverse, original finite real Pi-vector dot product, and source-compatible pinned Mathlib continuity interface. Keep both definitions source-exact and proof budgets frozen.

All historical RED evidence is retained unchanged.
