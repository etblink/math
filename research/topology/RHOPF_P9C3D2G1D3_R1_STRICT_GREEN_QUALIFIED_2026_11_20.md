# RHOPF-P9C3D2G1D3 R1 — original Gamma9 projector-range unit ↔ Q-unit sphere Homeomorph strict GREEN

**Pacific date:** 2026-11-20 (CI completed at 2026-11-20T10:47:39Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`, not `main`.  
**Original strict run:** [#44720022796](https://github.com/etblink/math/actions/runs/44720022796), attempt 1 SUCCESS.  
**Exact tested commit:** `39d0f4e26fc1b984565b5b0d50605c270d9ee44d`.  
**Original job:** `136233086986`.  
**Original artifact:** [#14621723397](https://github.com/etblink/math/actions/runs/44720022796/artifacts/14621723397).  
**Independent original ZIP SHA256:** `67bc45533d20e169bbf9ff5c849e0aec42b7626d0ec4fcd7bc0cbae551c7eafa`, equal to GitHub's original upload digest.  
**Embedded exact-tested-commit.txt:** `39d0f4e26fc1b984565b5b0d50605c270d9ee44d`, independently inspected.  
**Disposition:** ACCEPT G1D3. All exact source preflight, source-independent signed integer consumer, compiled native and imported consumer reports, and evidence checks succeeded.

## Qualification contract

- Frozen original BFSS Core, Gamma9/projector/Circle source and G0/G1 dependencies pinned by Git blob SHA: PASS.
- Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Dependency build: PASS (9,050 jobs).
- Native source `-DwarningAsError=true` compilation and independent imported consumer: PASS.
- Native plus independent `#print axioms`: three declarations in each log, **exactly** `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`: PASS.
- Original artifact contains six files: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-range-unit-coordinate-homeomorph-and-axioms.log`, `qualified-original-dependency-build.log`, and `toolchain-sha256.txt`.
- Artifact ZIP digest independently recomputed and matched the original GitHub upload; embedded commit matched exact run head: PASS.
- No source projector replacement, added axioms, proof-budget changes, history deletion, or `main` changes.

## Accepted mathematics

```lean
noncomputable def relationalRangeUnitHomeomorphQUnit :
    RelationalRangeUnitSphere ≃ₜ RelationalQUnitCoordinates

theorem relationalRangeUnitHomeomorphQUnit_apply
    (v : RelationalRangeUnitSphere) :
    (relationalRangeUnitHomeomorphQUnit v).1 =
      relationalRangeContinuousLinearEquivFinFour v.1

theorem relationalRangeUnitHomeomorphQUnit_symm_apply
    (v : RelationalQUnitCoordinates) :
    (relationalRangeUnitHomeomorphQUnit.symm v).1 =
      relationalRangeContinuousLinearEquivFinFour.symm v.1
```

G1D3 is the exact restriction of the accepted continuous real-linear equivalence `E` and `E.symm` between the source-original Gamma9 rank-four projector image and its transported quadratic-form coordinates. Its inverse laws and continuity are checked on the original subtype spheres. This proof does **not** assume that `E` is isometric or Circle-equivariant.

## Next gate and unresolved physical claims

G1B already provides `RelationalUnitSpinor ≃ₜ RelationalRangeUnitSphere`; G1D3 provides `RelationalRangeUnitSphere ≃ₜ RelationalQUnitCoordinates`; G1D2 provides `RelationalQUnitCoordinates ≃ₜ StandardUnitCoordinates`. The next small gate is an explicitly compiled `Homeomorph.trans` composition with an imported independent consumer.

The original source Gamma9 Circle action is already algebraic, free, and jointly continuous by F1/F2/F4. These properties can be transported by **conjugation** after the composite homeomorphism qualifies. That tautological conjugacy must **not** be confused with identifying this action with the standard scalar Hopf action; a compatible complex structure/intertwiner, Hopf quotient, Chern class, physical 48-Majorana Fock implementation, and gauge/Hamiltonian covariance remain OPEN.
