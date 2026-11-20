# RHOPF-P9C3D2G1C3 R1 — original Gamma9 coordinate radius strict GREEN

**Pacific date:** 2026-11-19 (GitHub Actions UTC completion 2026-11-20T07:22:41Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44693041458](https://github.com/etblink/math/actions/runs/44693041458), attempt 1 SUCCESS.  
**Exact tested commit:** `2c6764ebcd8b45c9fe021bf01f65b648d3573c87`.  
**Original job:** `136143163343`.  
**Original archive:** [#14609952116](https://github.com/etblink/math/actions/runs/44693041458/artifacts/14609952116).  
**Independently downloaded original ZIP SHA-256:** `9e3ab63829b84f690944c4cf816a94deb52389d19771b9251bc13c36c62fbaa3`; independently computed and matched original CI upload digest.  
**Embedded original `exact-tested-commit.txt`:** `2c6764ebcd8b45c9fe021bf01f65b648d3573c87`, independently read.  
**Disposition: ACCEPT** both G1C3 declarations as original-native and independently imported strict GREEN.

## Exact qualification

- Frozen BFSS Core, Gamma9 original matrices, projector, relational Circle, qualified G0A/B/C and G1A/B/C0/C1/C2 exact source pins: PASS.
- New source and consumer SHA pins, bounded proof-contract preflight: PASS.
- Source-independent original signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build (9039 jobs): PASS.
- Native original G1C3 source warnings-as-errors compilation: PASS.
- Separately imported source-typed G1C3 consumer warnings-as-errors compilation: PASS.
- All four original native and independent `#print axioms` reports: exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Original ZIP independently downloaded; checksum matched original upload; archive listed six files and embedded exact-tested-commit matched: PASS.
- Original files include `native-coordinate-radius-continuity-positivity-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `exact-tested-commit.txt` and `toolchain-sha256.txt`.
- No new axioms, proof-budget increase, alternate original Gamma matrices, coordinate-plane assumption, physical Fock changes or changes to `main`.

## Qualified source statements

```lean
noncomputable def relationalRangeCoordinateRadius (x : Fin 4 → ℝ) : ℝ :=
  Real.sqrt (relationalRangeCoordinateDotSelf x)

theorem relationalRangeCoordinateRadius_continuous :
    Continuous relationalRangeCoordinateRadius

theorem relationalRangeCoordinateRadius_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalRangeCoordinateRadius x
```

The accepted real-4 model uses an arbitrary continuous linear equivalence `L` to the actual original Gamma9 projector image. The original real-16-spinor dot-self `Q(x) = (L.symm x).1 ⬝ᵥ (L.symm x).1` is positive-definite (G1C1) and continuous (G1C2). This strict G1C3 gate proves its square root radius is continuous everywhere and strictly positive away from zero using pinned `Real.continuous_sqrt` and `Real.sqrt_pos`.

## Open mathematical and physical boundaries

No scalar homogeneity of this pulled-back `Q` or `r` has yet been separately qualified, no actual radial normalization or inverse built, and no `S³` homeomorphism, original Circle-equivariant standard Hopf action/quotient, Fock implementer, Gauss law or physical topological excitation has been proved by G1C3.

The next bounded target should be the **homogeneity equation for the transported quadratic form** `Q(t • x) = t * (t * Q(x))`, deriving it from the same accepted `L.symm` and source original Euclidean dot-product transport, not from a preferred coordinate basis. This prepares later `r(t • x)` and radial normalizing identity gates. Remain exact-source-native and independent-consumer strict; preserve all historical REDs.
