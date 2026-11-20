# RHOPF-P9C3D2G1D5 R1 — original Gamma9 circle-action transport to standard S³: strict GREEN

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, not `main`.  
**Original strict run:** [#44766344653](https://github.com/etblink/math/actions/runs/44766344653), attempt 1 SUCCESS, completed 2026-11-20T15:56:46Z.  
**Exact tested commit:** `fa118e2096add58c9ac1c2e2d2ee373b83f32d31`.  
**Job ID:** `136391868420`.  
**Artifact:** [#14645328325](https://github.com/etblink/math/actions/runs/44766344653/artifacts/14645328325).  
**Independently calculated artifact ZIP SHA-256:** `326acb0d215097513fd6488681c5dc23001adaf5b25b7d80d1d5ceccd7693094`, matches original GitHub Actions upload digest.  
**Embedded exact tested SHA:** `fa118e2096add58c9ac1c2e2d2ee373b83f32d31` — independently matched.  
**Disposition:** **ACCEPT G1D5 R1**.

## Strict evidence qualification

- Original source Gamma9/projector/Circle and entire accepted G1 chain frozen-blob preflight: PASS.
- Independent signed-permutation integer fixture: PASS.
- Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build: 9,052 jobs, successful.
- New native `-DwarningAsError=true` Lean compilation and independent imported consumer: PASS.
- Six `#print axioms` reports for three source declarations in native and independent contexts: exactly `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`: PASS.
- ZIP SHA-256 independently checked against original upload; six evidence entries: `exact-tested-commit.txt`, `native-standard-sphere-circle-action-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`: PASS.
- No change to original Gamma9 source, underlying proofs, Lean budget, or `main`.

## Accepted source mathematics

```lean
noncomputable def relationalStandardCircleAction
    (z : Circle) (u : StandardUnitCoordinates) : StandardUnitCoordinates :=
  relationalUnitSpinorHomeomorphStandardUnit
    (relationalUnitCircleAction z
      (relationalUnitSpinorHomeomorphStandardUnit.symm u))

theorem relationalStandardCircleAction_one (u : StandardUnitCoordinates) :
    relationalStandardCircleAction 1 u = u

theorem relationalStandardCircleAction_mul
    (z w : Circle) (u : StandardUnitCoordinates) :
    relationalStandardCircleAction (z * w) u =
      relationalStandardCircleAction z (relationalStandardCircleAction w u)
```

This is the genuine algebraic group action obtained by conjugating the original-source Gamma9 relational Circle action through G1D4's strictly accepted `RelationalUnitSpinor ≃ₜ StandardUnitCoordinates`. The target `StandardUnitCoordinates` is real-four Euclidean dot-one `S³`. No claim of equality with the usual complex-scalar Hopf action follows.

## Next proof boundaries

The original unit-spinor action is already algebraically free (F2) and jointly continuous (F4), both separately qualified. **D6** should transport only freeness, using the accepted homeomorphism's injectivity. **D7** should transport joint continuity, using homeomorphism continuity in both directions and original F4 continuity. After those are independently accepted, investigate a compatible complex orthonormal basis and actual conjugacy to the standard Hopf action.

Hopf quotient `S³/S¹≅S²`, Chern class/charge, original BFSS 48-Majorana Fock action, gauge/Hamiltonian covariance, and stable physical hopfion are **not** established.
