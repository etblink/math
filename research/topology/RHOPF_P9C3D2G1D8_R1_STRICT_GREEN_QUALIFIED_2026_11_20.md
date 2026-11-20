# RHOPF-P9C3D2G1D8 R1 — original Gamma9 projector-image complex structure identities strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** **ACCEPTED_STRICT_GREEN**.  
**Canonical branch:** `integration/bfss-unified-research-20261108`; `main` unmodified.  
**Original workflow:** [#44776928692](https://github.com/etblink/math/actions/runs/44776928692), attempt 1 SUCCESS, completed 2026-11-20T17:01:39Z.  
**Exact tested SHA:** `8dcb52be0e5e392debb0fbd18bacd200ca8aa4a6`, job `136429099905`.  
**Original evidence ZIP:** [#14650970639](https://github.com/etblink/math/actions/runs/44776928692/artifacts/14650970639).  
**Independently calculated artifact ZIP SHA256:** `cc80d39191f434d604dccdf6da0c0385b1a8836f425d21d671422515b742eaef` equal to GitHub artifact digest and original job upload log. Original archive `exact-tested-commit.txt` matches `8dcb52be0e5e392debb0fbd18bacd200ca8aa4a6`.

## Original-source and independent evidence

- Frozen original Gamma9/projector/phase/Circle and accepted G1D1–D7 Git blobs: PASS.
- Independent signed integer Clifford/Gamma9 fixture: PASS.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build: **9,055 jobs**, PASS.
- Native warnings-as-errors Lean compilation: PASS.
- Independent imported consumer rechecks both typed identities: PASS.
- Two original and two independent `#print axioms`: each restricted to `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, no Lean compilation errors.
- Independently downloaded original ZIP includes six files: `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `independent-lean-types-and-axioms.log`, `native-projector-image-phase-complex-structure-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. SHA and embedded commit match original upload.

## Qualified native Lean statements

```lean
theorem relationalPhaseJ_mulVec_preserves_projector_image
    (v : SpinIndex → ℝ) (hv : relationalProjector.mulVec v = v) :
    relationalProjector.mulVec (relationalPhaseJ.mulVec v) = relationalPhaseJ.mulVec v

theorem relationalPhaseJ_mulVec_square_on_projector_image
    (v : SpinIndex → ℝ) (hv : relationalProjector.mulVec v = v) :
    relationalPhaseJ.mulVec (relationalPhaseJ.mulVec v) = -v
```

These source-Gamma9 identities follow from accepted P9C2C `P*J=J` and P9C2A `J*J=-P`. They show that original phase `J` preserves the real four-dimensional projector image and squares to `-I` on that image, **without** an unproved coordinate basis.

## Boundary and next research goal

G1D4–D7 qualify the original relational unit sphere `≃ₜ S³` with a **free jointly continuous source-derived** Circle action. D8 independently qualifies the algebraic complex-structure square/preservation identities on its defining four-dimensional projector-image carrier.

Next microgate: define a canonical linear endomorphism `J_range` on the original `LinearMap.range (Matrix.toLin' relationalProjector)` by composing `relationalPhaseJ` and prove its square `J_range ∘ J_range = -id`. Explicitly check the original real inner product/skewness before claiming a compatible Hermitian or unitary complex basis. The noncanonical G1C0 real-four equivalence is not automatically equivariant, so do not infer the standard complex scalar Hopf action without an actual intertwiner. The Hopf quotient, Chern classes/topological charge, physical Fock implementation, Gauss/Hamiltonian covariance and stable hopfion remain OPEN.
