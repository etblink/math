# RHOPF-P9C3D2G1C0 R1 — source-exact continuous R4 model strict GREEN

**Pacific date:** 2026-11-19 (CI completed 2026-11-20T06:29:04Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44686566937](https://github.com/etblink/math/actions/runs/44686566937), attempt 1, SUCCESS.  
**Original exact tested SHA:** `0de91009f7657eb6ac6ba11c4900a3464dc4c827`.  
**Original job:** `136122181214`.  
**Original archive:** [#14607805420](https://github.com/etblink/math/actions/runs/44686566937/artifacts/14607805420).  
**Original artifact ZIP SHA-256:** `1717ef2f10d15121d0e73980c82e4666eedc318a0baabb36084219ca75404f6e`, independently downloaded and checked against CI-upload digest.  
**Embedded `exact-tested-commit.txt`:** `0de91009f7657eb6ac6ba11c4900a3464dc4c827`, verified.  
**Disposition: ACCEPT original-source G1C0 as native and independently imported strict GREEN.**

## Qualification

- Exact source blob pins from BFSS Core/original Gamma9 projector/Circle through qualified G0A/B/C and G1A/B: PASS.
- Source and consumer new exact hash pins and structured proof-contract preflight: PASS.
- Source-independent signed-permutation original integer fixture: PASS.
- Pinned Lean `4.34.1` and exact Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build (9036 jobs): PASS.
- G1C0 original native Lean compilation with `-DwarningAsError=true`: PASS.
- Independent imported source-typed consumer `-DwarningAsError=true`: PASS.
- Both native and independent `#print axioms` show `[propext, Classical.choice, Quot.sound]`; neither has `sorryAx`: PASS.
- Original artifact ZIP independently SHA-verified, archived files inspected, and embedded exact commit matches: PASS.
- Exactly six archived evidence files: `exact-tested-commit.txt`, `native-range-continuous-linear-equiv-fin-four-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.
- No proof-budget enlargement, added axioms, alternate projection, original source edits or write to `main`.

## Accepted mathematical statement

```lean
noncomputable def relationalRangeContinuousLinearEquivFinFour :
    LinearMap.range (Matrix.toLin' relationalProjector) ≃L[ℝ] (Fin 4 → ℝ)
```

The source original projector range has accepted real `finrank = 4`. The pinned Mathlib `Module.finrank_fin_fun` and `ContinuousLinearEquiv.ofFinrankEq` supply a noncanonical continuous real-linear equivalence to standard `Fin 4 → ℝ`. This constructs an abstract linear/topological model with no assumed coordinate-plane identity.

## Critical mathematical limitation

The equivalence is **not proven isometric**, and it need not preserve the source Euclidean dot-one sphere. The source `RelationalUnitSpinor` remains defined by `v ⬝ᵥ v = 1` in the original 16-real-spinor space, not the product sup norm. The appropriate next bounded step is to pull back source dot-self along the inverse of the accepted continuous linear equivalence, and prove the resulting coordinate quadratic is strictly positive away from zero. Only after establishing positivity, continuity, and radial inverse formulas can we claim that coordinate norm-one spheres are homeomorphic. A true orthonormal-basis isometry is an alternative route, not established by this gate.

No canonical original coordinate basis, `S³` homeomorphism, standard Hopf circle action or quotient, physical Fock lift, gauge/Hamiltonian covariance or stable vortex is proven by G1C0. Preserve all earlier RED knowledge and source hashes unchanged.
