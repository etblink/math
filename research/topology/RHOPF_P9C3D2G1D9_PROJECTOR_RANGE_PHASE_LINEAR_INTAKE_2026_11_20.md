# RHOPF-P9C3D2G1D9 — source-exact J linear endomorphism on original projector image intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending original-source native and independent consumer strict GREEN.

G1D8 [run #44776928692](https://github.com/etblink/math/actions/runs/44776928692), exact tested `8dcb52be0e5e392debb0fbd18bacd200ca8aa4a6`, artifact ZIP SHA256 `cc80d39191f434d604dccdf6da0c0385b1a8836f425d21d671422515b742eaef`, was independently verified and accepted at [`e2c9eca9`](https://github.com/etblink/math/commit/e2c9eca9e65d0435c78df3fbc159eec52c21ef75). Its accepted exact projector-image identities assert `P(Jv)=Jv` and `J(Jv)=-v` for `P v=v`.

## Bounded D9 goal

Define `relationalPhaseJRangeLinear` on the exact `LinearMap.range (Matrix.toLin' relationalProjector)` using only the source-original `Matrix.toLin' relationalPhaseJ`, accepted `LinearMap.IsProj` characterization from G1A and D8 preservation. Prove the square theorem pointwise:
```lean
noncomputable def relationalPhaseJRangeLinear :
    (LinearMap.range (Matrix.toLin' relationalProjector)) →ₗ[ℝ]
      (LinearMap.range (Matrix.toLin' relationalProjector))

theorem relationalPhaseJRangeLinear_square
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalPhaseJRangeLinear (relationalPhaseJRangeLinear v) = -v
```

Independent imported consumer checks the concrete real-linear map type and source-original square law. Both native and independent `#print axioms` must be free of `sorryAx` with only `propext`, `Classical.choice`, `Quot.sound`. Preserve frozen original Gamma9 and accepted chain Git blob pins, signed-permutation integer fixture, Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, warning-as-error compilation and all original failure or success artifacts with hashes.

No original Gamma9 edits, no source matrix expansion, no scalar conjugacy or imaginary-basis assumptions, no changes to `main`, no enlarged proof budgets.

Following a strict GREEN, investigate the induced real-four complex linear map and original metric/skewness/orthonormal basis. The classical Hopf intertwiner, quotient S³/S¹≅S², topological charge, physical Fock implementer, gauge/Hamiltonian covariance, and stable hopfion remain OPEN.
