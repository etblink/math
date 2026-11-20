# RHOPF-P9C3D2G1B R1 — original source-exact relational sphere homeomorphism strict GREEN

**Pacific date:** 2026-11-19 (completed UTC 2026-11-20T06:10:01Z).  
**Branch:** `integration/bfss-unified-research-20261108` (never main).  
**Original strict workflow:** [#44684434666](https://github.com/etblink/math/actions/runs/44684434666), attempt 1, SUCCESS.  
**Exact tested SHA:** `e98303a043c27316aa326552b0765633c37dd920`.  
**Original job:** `136115289537`.  
**Original archive:** [#14605768960](https://github.com/etblink/math/actions/runs/44684434666/artifacts/14605768960).  
**Original artifact ZIP SHA256:** `7d14cc83042e50d6c22c7951f7456a2f265933f48c3708b12d5cde8b8a0ec699` — independently downloaded, computed, and matched original GitHub Actions digest.  
**Embedded `exact-tested-commit.txt`:** `e98303a043c27316aa326552b0765633c37dd920`, independently inspected.  
**Disposition:** **ACCEPT** `FCP.RHOPFP9C3D2G1B.relationalUnitSpinorHomeomorphRange` as native original Gamma9 and independently imported strict GREEN.

## Qualification against exactly tested source

- Frozen exact original BFSS Core, Gamma9 projector and related Circle representation, original source rank, accepted G0A/B/C, and G1A hashes: PASS.
- Both new native and independently imported consumer hashes and structural proof-contract preflight: PASS.
- Original source-independent signed permutation integer fixture: PASS.
- Lean 4.34.1 and exact Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original accepted dependency build (9035 jobs): PASS.
- Original new G1B source compile under `-DwarningAsError=true`: PASS.
- Separately imported original source-typed G1B consumer compile under `-DwarningAsError=true`: PASS.
- Both `#print axioms` reports list exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Original archive ZIP independently SHA-verified against CI and embedded tested commit checked: PASS.
- Archive manifest contains `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-relational-range-sphere-homeomorph-and-axioms.log`, `qualified-original-dependency-build.log`, and `toolchain-sha256.txt`.
- No Gamma source rewrite, extra axioms, changed theorem statement, linter bypass, proof budget increase, private source replacement, or write to `main`.

## Verified mathematical statement

```lean
noncomputable def relationalUnitSpinorHomeomorphRange :
    RelationalUnitSpinor ≃ₜ RelationalRangeUnitSphere
```

The homeomorphism is the accepted type equivalence `relationalUnitSpinorEquivRange` with native source topology. The forward and inverse maps leave each real-16-spinor vector unchanged and are continuous by the inherited subtype topology (reusing the same Mathlib `continuous_subtype_val` and `Continuous.subtype_mk` interfaces qualified earlier in F4).

This establishes a **homeomorphism between two presentations of the same original Gamma9 norm-one rank-four projector image**, without basis selection. Together with accepted F1/F2/F4 and G0C the original relational unit spinors form a nonempty space carrying an accepted algebraically free, jointly continuous Circle action. No `S³` homeomorphism, circle-equivariant standard Hopf structure or quotient classification is asserted by this gate.

## Next boundaries

1. Find a **source-exact, basis-independent linear isometry** from the original four-dimensional projector range (with inherited real inner product) to standard `Fin 4 → ℝ` or `EuclideanSpace ℝ (Fin 4)`. Verify the pinned Mathlib interfaces first. Do not equate the existing *conditional* selected coordinate plane with the original image without its witness.
2. Restrict such an isometry to norm-one subtypes and certify the resulting `S³` homeomorphism, then separately test how the original Circle action transforms.
3. Prove Circle-equivariance before any assertion of a standard Hopf quotient (S^3/S^1≅S^2).
4. Physical Fock/Gauss/Hamiltonian covariance, Majorana implementation, and stable topological configurations remain independent unproved obligations.

All earlier G1A RED evidence and original frozen sources are preserved.
