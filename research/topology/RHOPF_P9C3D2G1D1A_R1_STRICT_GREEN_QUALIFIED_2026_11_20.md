# RHOPF-P9C3D2G1D1A R1 — source-exact positive radius homogeneity strict GREEN

**Pacific date:** 2026-11-20 (completed 2026-11-20T09:47:40Z).
**Canonical branch:** `integration/bfss-unified-research-20261108`; no `main` edits.
**Original strict run:** [#44712109044](https://github.com/etblink/math/actions/runs/44712109044), attempt 1 SUCCESS.
**Exactly tested SHA:** `b06192671f63be05176a4a8e48763da3edb1d176`.
**Original job:** `136206101060`.
**Original archive:** [#14618366801](https://github.com/etblink/math/actions/runs/44712109044/artifacts/14618366801).
**ZIP SHA256 independently downloaded and recomputed:** `789ffb5ca34ac84eab0e4d30a647be3b104a7a888d3562808b6cfa4ba4797f95`; matches original CI artifact-upload digest.
**Embedded `exact-tested-commit.txt`:** `b06192671f63be05176a4a8e48763da3edb1d176`, independently inspected.
**Disposition: ACCEPT** both source-original G1D1A native and independently imported radius-homogeneity declarations as strict GREEN.

## Exact qualification

- Original frozen BFSS Core, Gamma9, projector, Circle, G0A/B/C, G1A/B/C0/C1/C2/C3/C4/C5/C6/C7/C8/C9/D0 hashes: PASS.
- New G1D1A source and independent consumer exact blob SHA pins and bounded source-contract preflight: PASS.
- Source-independent original signed-permutation integer fixture: PASS.
- Pinned Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original qualified dependency build (9047 jobs): PASS.
- Source-native and separately imported source-typed consumer warnings-as-errors compilation: PASS.
- Four native/independent `#print axioms` reports (two theorems each) exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Original artifact downloaded independently and SHA-256 matched original CI upload; all six files listed, native and consumer log tails checked, embedded tested SHA matched: PASS.
- Six original files: `exact-tested-commit.txt`, `native-positive-radius-homogeneity-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.
- No added axioms, proof resource increases, alternate gamma matrix, fake preferred original projector-coordinate plane, physical Fock changes or modifications to main.

## Accepted mathematical source statements

```lean
theorem relationalRangeCoordinateRadius_smul_nonneg
    (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateRadius (t • x) =
      t * relationalRangeCoordinateRadius x

theorem standardCoordinateRadius_smul_nonneg
    (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    standardCoordinateRadius (t • x) =
      t * standardCoordinateRadius x
```

The actual original Gamma9 transported Euclidean dot-self Q yields `r(x) := sqrt(Q(x))`. The standard real-four Euclidean radius `s(x):=sqrt(x ⬝ᵥ x)` is distinct from the finite Pi sup norm. Both are positively homogeneous, proved from accepted G1C4/G1C9 quadratic homogeneity and pinned `Real.sqrt_mul`, `Real.sqrt_mul_self`.

## Open boundaries and bounded next gate

G1D0 separately qualified continuous radial maps `F : S_Q→S_std`, `F(x)=s(x)⁻¹•x`; `G : S_std→S_Q`, `G(y)=r(y)⁻¹•y`. G1D1A does **not** yet verify `G(F(x))=x` or `F(G(y))=y`. Prove those in source-exact D1B, with positive inverse radii, exact reciprocal scalar cancellation, and subtype extensionality; do not assert a homeomorphism until both directions qualify. Follow with a separate Homeomorph packaging gate.

The retraction from the **entire punctured R4** is noninjective and must never be called a homeomorphism. Original Circle action equivariance, Hopf S¹ quotient, physical BFSS Fock lift, Hamiltonian/gauge covariance, and stable topological excitation are OPEN. Preserve historical REDs.
