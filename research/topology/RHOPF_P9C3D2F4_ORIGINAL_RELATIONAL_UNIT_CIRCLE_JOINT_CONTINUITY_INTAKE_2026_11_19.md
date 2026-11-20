# RHOPF-P9C3D2F4 — exact source relational unit Circle joint continuity intake

**Date:** 2026-11-19 (America/Los_Angeles).
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED source-native Lean theorem and independently imported consumer until strict original GREEN.
**Accepted predecessor:** P9C3D2F3 R1 strict GREEN [#44659929627](https://github.com/etblink/math/actions/runs/44659929627), exact tested `8d8d1644e9b59487325255105458e86dbf1d57fe`, acceptance `5f4ad0ad0c90ec1b625e18964f758fa64cd3fbff`.

## Mathematical target and qualified inputs

The original BFSS Gamma9 real 16-spinor source-derived `Circle` action `relationalCircleVector` is strictly qualified jointly continuous on `Circle × (SpinIndex → ℝ)` (P9C3D2F3). The exact rank-four projector image norm-one subtype `RelationalUnitSpinor` and restricted `relationalUnitCircleAction` are already accepted with source-exact closure, identity and product equations (P9C3D2F1). Trivial point stabilizers on the unit subtype were independently accepted in P9C3D2F2.

Prove only one new theorem:
```lean
theorem relationalUnitCircleAction_joint_continuous :
    Continuous (fun p : Circle × RelationalUnitSpinor =>
      relationalUnitCircleAction p.1 p.2)
```

Use the accepted original `relationalCircleVector_joint_continuous` precomposed with `continuous_fst.prodMk (continuous_subtypeVal.comp continuous_snd)`, then Mathlib `Continuous.subtype_mk` into the induced topology on the original norm-one subtype. Do not introduce a new circle representation, alternative matrix basis, new global `MulAction` typeclass, new Gamma9 coordinates, original Fock source alteration, tactic resource expansion, or mathematical axioms.

This gate supplies exact **joint continuity on the intrinsic relational norm-one unit-sphere subtype**, not a new algebraic law. In conjunction with already qualified action and stabilizer theorems it would establish a free continuous action in the explicit map-and-laws sense, without yet bundling a global `ContinuousSMul` instance.

## Source native and independently imported strict qualification

The strict CI gate pins all accepted original BFSS Core / Gamma9 and original P/J/Q phase/Circle sources, frozen R1/R2 predecessor imports, exact new source/consumer Git blob hashes, exact imports/declaration/namespace/noncomputable section preflight, original signed-permutation integer fixture, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original source and independent imported type consumer must compile with warnings-as-errors. Both `#print axioms` reports must show at most `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`; do not claim acceptance without downloaded original artifact SHA-256 and exact embedded tested commit. Any RED remains preserved in the negative-knowledge corpus before any bounded corrective R2 attempt.

## Distinct open obligations and scientific bounds

A free continuous circle action on a source-defined set does **not** by itself identify that set with the standard (S³) or certify a Hopf fibration. Separately establish that the rank-four P image has a source-exact four-real-dimensional model, exhibit a norm-one point (nonemptiness), construct a continuous/equivariant homeomorphism to (S³), then prove the actual quotient `S³/S¹ ≅ S²` and any Hopf-compatible charge/topology. The full ambient 16-real-spinor action fixes its P-complement and is not free. Original physical BFSS 48-Majorana/24 complex-mode Fock lifting, full Spin(9) compatibility, SU(2) gauge/Hamiltonian covariance, stable vortex/hopfion physics and Standard Model observables remain independent unproved research directions. Preserve all historical RED diagnostics and do not touch `main`.
