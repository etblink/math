# RHOPF-P9C3D2F4 R3 — original relational unit Circle action joint continuity strict GREEN

**Pacific date:** 2026-11-19; UTC completion 2026-11-20T03:24:51Z.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44665814739](https://github.com/etblink/math/actions/runs/44665814739), attempt 1, completed **SUCCESS**.  
**Exact tested commit:** `a3b055c903a88ad98dabaab74973b81cd4d750f2`.  
**Original job:** `136054704274`.  
**Native/independent original artifact:** [#14598586288](https://github.com/etblink/math/actions/runs/44665814739/artifacts/14598586288).  
**Original ZIP SHA-256 (independently verified):** `257ed50a0afc74a0d3a3da52fb5b7a502dd7f0aa21ec8bb5c8746306f0823225`.  
**Disposition:** **ACCEPT** `FCP.RHOPFP9C3D2F4.relationalUnitCircleAction_joint_continuous` as original source-native and independent consumer strict GREEN.

## Original exact-source qualification

- Frozen original BFSS/Gamma9/relational source Git blob preflight, exact source and consumer proof contracts, and original signed-permutation integer fixture: PASS.
- Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted predecessor dependency source built (9030 jobs): PASS.
- Native `lake env lean -DwarningAsError=true` original source: PASS.
- Independently imported original-source type consumer `lake env lean -DwarningAsError=true`: PASS.
- Both complete `#print axioms` reports list exactly `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`: PASS.
- Original artifact independently downloaded, local ZIP SHA-256 matches CI uploaded ZIP digest: PASS.
- Extracted `exact-tested-commit.txt` contains `a3b055c903a88ad98dabaab74973b81cd4d750f2`: PASS.

Archive contents: `exact-tested-commit.txt`, `native-relational-unit-continuity-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Exact qualified mathematical statement

```lean
theorem relationalUnitCircleAction_joint_continuous :
    Continuous (fun p : Circle × RelationalUnitSpinor =>
      relationalUnitCircleAction p.1 p.2)
```

This is the original Gamma9-derived circle action on the **exact norm-one rank-four projector image**, with its subtype topology. Together with P9C3D2F1 algebraic action laws and P9C3D2F2 trivial stabilizers, it establishes a free continuous Circle action in the **explicit-map-and-laws sense**. No global `ContinuousSMul` instance was constructed.

## Negative knowledge and hard boundaries

R1 [#44661894999](https://github.com/etblink/math/actions/runs/44661894999) failed deterministic `isDefEq` at 200000 heartbeats with a nested composition. R2 [#44664003925](https://github.com/etblink/math/actions/runs/44664003925) failed an unknown helper name and persisted `isDefEq` timeout. Their exact RED diagnostics remain committed and are not superseded as historical evidence. R3 succeeded through a typed `Function.comp` composition and correct `continuous_subtype_val` lemma, without increasing the proof resource limit.

The unit-sphere subtype's nonemptiness is not yet accepted. A source-exact real-four-dimensional range/rank theorem already exists, but a fixed-coordinate identification and an explicit/equivariant `S³` homeomorphism remain unproved. The Hopf quotient `S³/S¹ ≅ S²`, original 48-Majorana/24-mode Fock implementation, Spin(9), gauge and Hamiltonian covariance, stable vortex/hopfion physics, and Standard Model observables remain separate open obligations. The full real-16-spinor carrier action is not free, due to its fixed complement. Preserve all negatives and leave `main` unchanged.

**Recommended next bounded target:** prove `Nonempty RelationalUnitSpinor` using the strictly qualified rank-four original projector image, extracting a nonzero vector and normalizing it without assuming the selected four-coordinate plane is the original image.
