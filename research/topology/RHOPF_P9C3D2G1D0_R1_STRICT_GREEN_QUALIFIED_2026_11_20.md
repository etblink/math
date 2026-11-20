# RHOPF-P9C3D2G1D0 R1 — source-exact Gamma9/standard Euclidean continuous inter-sphere maps strict GREEN

**Pacific date:** 2026-11-20 (GitHub Actions completion 2026-11-20T09:32:26Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`; no edit to `main`.  
**Original strict run:** [#44709845743](https://github.com/etblink/math/actions/runs/44709845743), attempt 1 SUCCESS.  
**Exactly tested SHA:** `997db333ad121db2a70fca7995ccb9fc23587c1a`.  
**Original job:** `136198474172`.  
**Original archive:** [#14616718782](https://github.com/etblink/math/actions/runs/44709845743/artifacts/14616718782).  
**Original artifact ZIP SHA256, independently computed:** `61b7c624a441519009bc59e592ab59a14bc7f49a6fca779ea3755b2b7e9d1361`; matches CI artifact-upload log.  
**ZIP embedded `exact-tested-commit.txt`:** `997db333ad121db2a70fca7995ccb9fc23587c1a`, independently verified.  
**Disposition:** **ACCEPT G1D0** as original-native and separately imported source-typed strict GREEN.

## Strict qualification

- Exact frozen original BFSS, Gamma9, projector/Circle, accepted G0A/B/C and G1A/B/C0/C1/C2/C3/C4/C5/C6/C7/C8/C9 source hash pins: PASS.
- New G1D0 original source and independent consumer exact pinned hashes and bounded source-contract preflight: PASS.
- Source-independent original signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Dependency build (9046 jobs): PASS.
- Native G1D0 warnings-as-errors Lean compilation: PASS.
- Independently imported source-typed consumer warnings-as-errors Lean compilation: PASS.
- Six native and independent `#print axioms` reports for three theorems show precisely `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Original downloaded ZIP checksum matches upload digest. Archive has six evidence files (`exact-tested-commit.txt`, `native-continuous-inter-sphere-maps-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`), and exact tested commit matches: PASS.
- No added axioms, proof-budget expansions, preferred original Gamma coordinate plane, alternate projector, physical Fock changes or `main` writes.

## Accepted mathematical source declarations

```lean
abbrev StandardUnitCoordinates : Type :=
  {x : Fin 4 → ℝ // x ⬝ᵥ x = 1}

theorem standardUnitCoordinates_ne_zero
    (v : StandardUnitCoordinates) : (v.1 : Fin 4 → ℝ) ≠ 0

noncomputable def relationalQUnitToStandardUnit :
    RelationalQUnitCoordinates → StandardUnitCoordinates

noncomputable def standardUnitToRelationalQUnit :
    StandardUnitCoordinates → RelationalQUnitCoordinates

theorem relationalQUnitToStandardUnit_continuous :
    Continuous relationalQUnitToStandardUnit

theorem standardUnitToRelationalQUnit_continuous :
    Continuous standardUnitToRelationalQUnit
```

Exact radial formulas: `F(x) = s(x)⁻¹ • x` with `s(x) = sqrt(x ⬝ᵥ x)`, and `G(y) = r(y)⁻¹ • y` with `r(y)=sqrt(Q(y))` and Q transported from the actual original Gamma9 projector range. Both maps are well-defined and continuous between the inherited Q-unit subtype and standard **Euclidean dot-one** subtype (not the Fin Pi sup-norm sphere).

## Missing inverse and physical statements

G1D0 does **not** prove `G(F(x))=x` or `F(G(y))=y` and therefore does not yet certify an actual homeomorphism, an isometry, Circle-equivariant Hopf quotient, Fock lift, Hamiltonian/gauge covariance or stable hopfion.

Next bounded theorem target: radius **positive-scalar homogeneity** on both models `r(t•x)=t*r(x)` and `s(t•x)=t*s(x)` for `t≥0`, using source-qualified quadratic homogeneity, `Real.sqrt_mul` or `Real.sqrt_mul_self`, and positive radii. This provides the direct algebra to establish two-sided inverse identities in a follow-up strict gate. Avoid launching an enormous inverse gate that depends on untested normalization coercions. Preserve original RED evidence.
