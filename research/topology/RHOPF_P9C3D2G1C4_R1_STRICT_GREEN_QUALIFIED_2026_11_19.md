# RHOPF-P9C3D2G1C4 R1 — original Gamma9 coordinate quadratic homogeneity strict GREEN

**Pacific date:** 2026-11-19 (CI completed 2026-11-20T07:50:06Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44696104945](https://github.com/etblink/math/actions/runs/44696104945), attempt 1 SUCCESS.  
**Exact tested commit:** `280d888c23a7ca4a623da495528a593720176a90`.  
**Original job:** `136153105116`.  
**Original archive:** [#14611726855](https://github.com/etblink/math/actions/runs/44696104945/artifacts/14611726855).  
**Independently verified ZIP SHA256:** `ce8c29e16f90e462a06105055dba9a1b9f4de4a4b0523fc6a530ce6abc39d6e8`; matches original GitHub Actions artifact-upload digest.  
**Embedded `exact-tested-commit.txt`:** `280d888c23a7ca4a623da495528a593720176a90`, independently read and verified.  
**Disposition: ACCEPT** `FCP.RHOPFP9C3D2G1C4.relationalRangeCoordinateDotSelf_smul` as original-source-native and independently imported strict GREEN.

## Qualification

- Original frozen BFSS Core, source-original Gamma9, relational projector/Circle and accepted G0A/B/C and G1A/B/C0/C1/C2/C3 hash pins: PASS.
- Exact G1C4 native source and independent consumer blob pins plus strict source structural preflight: PASS.
- Source-independent original signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build (9040 jobs): PASS.
- Native source `-DwarningAsError=true` compilation: PASS.
- Separately imported source-typed consumer `-DwarningAsError=true` compilation: PASS.
- Both original `#print axioms` reports for the qualified theorem exactly `[propext, Classical.choice, Quot.sound]` without `sorryAx`: PASS.
- Original artifact independently downloaded and SHA-256 matched upload; six evidence files inspected; tested SHA exact match: PASS.
- Archive files: `exact-tested-commit.txt`, `native-coordinate-quadratic-homogeneity-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, and `toolchain-sha256.txt`.
- No alternate Gamma matrices, coordinate-plane assumption, extra axiom, proof-budget override, physical Fock change or `main` write.

## Accepted mathematical statement

```lean
theorem relationalRangeCoordinateDotSelf_smul (t : ℝ) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (t • x) =
      t * (t * relationalRangeCoordinateDotSelf x)
```

For `Q(x) := (E.symm x).1 ⬝ᵥ (E.symm x).1` with `E` the accepted G1C0 continuous real-linear model of the **actual original** Gamma9 projector image, this proves the quadratic homogeneity `Q(t • x) = t * (t * Q(x))`. It uses linearity `map_smul E.symm`, original spinor `Subtype.val`, and the pinned native scalar dot product identities, not any unproved isometry or selected R4 plane.

## Next bounded mathematical boundary

G1C1–C3 also certify `x ≠ 0 → 0 < Q(x)`, `Continuous Q`, `r(x) = sqrt(Q(x))`, `Continuous r`, and `x ≠ 0 → r(x)>0`. The next bounded native gate should first prove `r(x) * r(x) = Q(x)` and the exact unit-normalization identity `Q((r(x))⁻¹ • x) = 1` for each nonzero x. This needs a real division cancellation justified by positivity; do not skip its denominator nonzero proof. Continuity and inverse of the radial normalization map belong to later gates.

This is **not** a standard `S³` identification, Circle-equivariant standard Hopf action, quotient `S³/S¹ ≅ S²`, physical 48-Majorana Fock action, gauge/Hamiltonian covariance or a physical topological excitation. Keep original source and all RED evidence frozen.
