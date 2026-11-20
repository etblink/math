# RHOPF-P9C3D2G1D1B R1 — original Gamma9/standard Euclidean two-sided inverse identities strict GREEN

**Pacific date:** 2026-11-20 (CI completed 2026-11-20T10:07:34Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108` (not `main`).  
**Original strict run:** [#44714313095](https://github.com/etblink/math/actions/runs/44714313095), attempt 1 SUCCESS.  
**Exact tested SHA:** `8974f5445f0f3913492e9132861622f81d0b53c0`.  
**Original job:** `136213662176`.  
**Original artifact:** [#14619198303](https://github.com/etblink/math/actions/runs/44714313095/artifacts/14619198303).  
**Independently downloaded and SHA256-verified ZIP:** `3f2ffe1ba49cfe51e4de95ce33e4fb89c1d0ba826f83c7dfd92026815f2f35fe`; matches original CI-upload digest.  
**Archive-embedded exact-tested-commit.txt:** `8974f5445f0f3913492e9132861622f81d0b53c0`, independently verified.  
**Disposition:** ACCEPT all three G1D1B native-source and independently imported original-source consumer declarations as strict GREEN.

## Exact checks

- Frozen original BFSS/Gamma9 matrices, projector, Circle, G0A/B/C, G1A/B/C0/C1/C2/C3/C4/C5/C6/C7/C8/C9/D0/D1A exact source hashes and new D1B native+consumer pins: PASS.
- Frozen source structural preflight and original-source-independent signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original 9048-job accepted dependency build: PASS.
- Native original D1B `-DwarningAsError=true` compilation: PASS.
- Separately imported source-typed D1B consumer `-DwarningAsError=true` compilation: PASS.
- Six original native/consumer `#print axioms` reports for all three theorems: exactly `[propext, Classical.choice, Quot.sound]`; no `sorryAx`: PASS.
- Original artifact independently downloaded; SHA256 matched CI uploader; six ZIP files listed; original native and independent imported logs inspected; exact tested commit embedded: PASS.
- Six original files: `exact-tested-commit.txt`, `native-inter-sphere-inverses-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.
- No new axioms, proof-budget increases, alternate Gamma9 matrices or coordinate-plane assumption, physical Fock changes or modification to `main`.

## Accepted source-exact mathematics

```lean
theorem standardCoordinateRadius_eq_one_of_dotSelf_eq_one
    (v : StandardUnitCoordinates) :
    standardCoordinateRadius v.1 = 1

theorem standardUnitToRelationalQUnit_comp_relationalQUnitToStandardUnit
    (v : RelationalQUnitCoordinates) :
    standardUnitToRelationalQUnit (relationalQUnitToStandardUnit v) = v

theorem relationalQUnitToStandardUnit_comp_standardUnitToRelationalQUnit
    (v : StandardUnitCoordinates) :
    relationalQUnitToStandardUnit (standardUnitToRelationalQUnit v) = v
```

`RelationalQUnitCoordinates` is the exact `Q=1` level set in `Fin 4→ℝ`, where `Q` is the original real-16-spinor Euclidean dot-self transported from the **actual Gamma9 projector image** via the accepted continuous real-linear equivalence. `StandardUnitCoordinates` is the **standard Euclidean dot-one sphere**, not the Pi-function space's default sup-norm sphere. G1D0 already strictly certified both radial maps `F` and `G` continuous. G1D1B strictly certifies `G(F(x))=x` and `F(G(y))=y`.

## Next formal topological milestone

**Do not promote a bundled `Homeomorph` yet.** Next bounded G1D2 gate should construct an actual Lean `Homeomorph` between these **two unit sphere subtypes**, consuming qualified D0 continuity and D1B two-sided identities and auditing it with an original-source native and independent imported consumer. This is an actual homeomorphism between the unit spheres only; not from punctured R4 to a sphere (radial normalization there is noninjective), and not an isometry of the original coordinate model.

After that, explicitly connect the standard dot-one sphere to standard sphere topology, and separately test source-original Circle equivariance and Hopf quotient. Physical 48-Majorana Fock action, Hamiltonian/gauge covariance and stable physical hopfion remain OPEN. Preserve all earlier REDs.
