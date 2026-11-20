# RHOPF-P9C3D2G1D8 — original Gamma9 projector-image complex-structure source bridge intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until original-source native strict GREEN, imported consumer strict GREEN and original archive verified.

D7 [#44772927582](https://github.com/etblink/math/actions/runs/44772927582), tested `f984adc850c3d8c234098049938fccfb1b6bb677`, independently verified ZIP SHA256 `81d87ba628f5fccadf19136442daf250c61036fcc35027baf9c401dc9b467b39`; accepted in [`3bc08a27`](https://github.com/etblink/math/commit/3bc08a2730cf0ed54e37c0abf9b1e385ef4ff69a). Combined G1D4–D7 proves the original Gamma9 rank-four relational unit sphere homeomorphic to Euclidean S³ and the transported circle action is free and jointly continuous; but no classical Hopf equivariance.

## Source exact basis-independent microgate

Accepted original source `RHOPFP9C2A` proves `relationalPhaseJ * relationalPhaseJ = -relationalProjector` and `RHOPFP9C2C` proves `relationalProjector * relationalPhaseJ = relationalPhaseJ`. D8 restricts those to the actual original real 16-spinor vectors satisfying `P.mulVec v = v` and proves only:
```lean
theorem relationalPhaseJ_mulVec_preserves_projector_image
  (v : SpinIndex → ℝ) (hv : relationalProjector.mulVec v = v) :
  relationalProjector.mulVec (relationalPhaseJ.mulVec v) =
    relationalPhaseJ.mulVec v

theorem relationalPhaseJ_mulVec_square_on_projector_image
  (v : SpinIndex → ℝ) (hv : relationalProjector.mulVec v = v) :
  relationalPhaseJ.mulVec (relationalPhaseJ.mulVec v) = -v
```
No arbitrary R4 orthonormal basis, equivariance or physical conclusion. This is an exact intermediate adapter for subsequently defining the linear complex structure on `LinearMap.range (Matrix.toLin' P)`, then transporting through G1C0 to `Fin 4 → ℝ` while explicitly checking compatibility of metric radial normalization G1D2.

The strict CI has source exact Git blob pins for original Gamma9, accepted P/J and G1D1–D7; independent signed-permutation integer fixture; pinned Lean 4.34.1 Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; native and independently imported consumer warnings-as-error builds; four axiom reports restricted to `propext, Classical.choice, Quot.sound`; original artifact preserving RED or GREEN tested commit and logs. No original source edits, no `main` writes, no new axioms or proof budgets.

**Future falsifiable target:** Does a source-compatible complex orthonormal basis identify the transported action with scalar circle multiplication? We must construct and verify an intertwiner before claiming Hopf quotient, Chern class, physical Fock lift or stable hopfion. Negative gates should be retained.
