# IBI→P3 downstream original BFSS utility test: potential as Gram minors

Date: 2026-11-15 Pacific.  
Research branch: `research/bfss-ibi-p3-potential-consumer-20261115` (frozen candidate input `48b666b5f53992e4e9b2471cb032cfd4689e30ef`).  
**Status: P1_STAGED_UNQUALIFIED pending dedicated native strict CI.** Do not report this as a successful Lean consumer until the run qualifies.  
Original source import bundle green: [#43788864430](https://github.com/etblink/math/actions/runs/43788864430), tested `bbc22c6e7dbb46b09db5f0b11a6ef25270a3b8e4`.

## Named existing BFSS theorem and exact source binding

- Existing unified source `FCP.BFSSP2C0OriginalPauliPotentialBinding.originalPauli_masslessPotential_eq_wedge`, `BFSSP2C0OriginalPauliPotentialBinding.lean` blob `3a2aa136e97bb907ac0d36a7b1559523f42c4d14`, identifies the original paired normalized Pauli `concreteAlgebraData.deformedBosonicPotential 1 0` as the sum of exact 3-color wedge squares (no redefined Hamiltonian).
- Imported source `FCP.BFSSIBIG0AOriginalBosonGram.originalGram_gauge`, `IBIG0AOriginalBosonGram.lean` blob `382315f9e9442f8506bcbe5b42dbc2bad4e7d86d`, proves the exact original `G2A.bosonGauge` action preserves each Gram coordinate.
- Proposed bridge source `IBIP3OriginalPotentialGramConsumer.lean` blob `a04cb0e2babcf5b6d0567cf802e9e73f9740294e`; independent consumer blob `877b934221f69bee4737d92e3d2d65f5623434ea`.
- Three claimed targets, each source-exact and with a separate consumer:
  (a) `colorWedgeSquared(u,v) = originalGram(x,i,i) * originalGram(x,j,j) - originalGram(x,i,j)^2` for (u=X_i,v=X_j);
  (b) original `deformedBosonicPotential 1 0 x` equals summed Gram minors;
  (c) that **same original potential** is invariant under the **same original G2A** gauge action, using the actual imported `originalGram_gauge`, not a parallel textbook SO3 representation.
- Fresh [strict workflow #43791435059](https://github.com/etblink/math/actions/runs/43791435059) is the specific source/consumer and restricted-axiom qualification test. Completion/conclusion is NOT predicted.

## Scientific comparison / claim ceiling

This is a genuine candidate for *nontrivial use of an imported theorem in an existing original source energy expression*: the P2C0 identity produces the genuine Pauli potential; the IBI source Gram invariant gives its invariant-coordinate expression and an alternate proof of gauge invariance.

**Null/control:** the existing source may already prove gauge covariance using `AlgebraData.GaugeData` directly. If so, the Gram proof should be assessed for reuse in classical commuting-valley or energy-lower-bound analysis, not counted as an independent discovery of physical gauge symmetry. The rewritten potential vanishes on rank-one commuting valleys and by itself gives no coercivity there; it supplies no Hardy spinor estimate, physical Fock state, source closed-domain identity, gap, normalizable zero mode or quantitative fidelity bound. A successful mathematical consumer would justify keeping a small source bundle in unified integration for reuse but does not satisfy the **stronger** strategy-adoption burden without identified operator/domain payoff.

## Integration branch protection and unexpected gate

The experimental files were initially committed to `integration/bfss-ibi-qualified-candidate-20261115` **after** the qualified 17-module import and receipt. The earlier 17-module strict gate was over-narrowly triggered on any `IBI*.lean` addition: [#43791313109](https://github.com/etblink/math/actions/runs/43791313109) RED at **preflight only** (`AssertionError: ({'IBIP3OriginalPotentialGramConsumer'}, set())`), because the test intentionally expects the old exact 17-module set. This is not a Lean red or a regression of the already qualified 17 modules. The new P3 source has its **separate** strict gate above. No unified integration ref or `main` ref was modified.

The research branch preserves this experimental proof and its first-causal diagnostics. Return the draft promotion PR to the exact qualified 17-module file set if the new consumer has not passed and been explicitly included under an updated contract. No force/history-rewrite; protect original red and green evidence.
