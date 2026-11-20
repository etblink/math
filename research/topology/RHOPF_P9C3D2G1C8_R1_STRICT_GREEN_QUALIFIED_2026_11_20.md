# RHOPF-P9C3D2G1C8 R1 — standard real-four Euclidean radius strict GREEN

**Pacific date:** 2026-11-20 (CI completed UTC 2026-11-20T08:58:10Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`; do not edit `main`.  
**Original strict run:** [#44704789806](https://github.com/etblink/math/actions/runs/44704789806), attempt 1 SUCCESS.  
**Exactly tested commit:** `18a1228f85e75966786949c431ff5260c0b95a9d`.  
**Original job:** `136181589715`.  
**Original artifact:** [#14615735988](https://github.com/etblink/math/actions/runs/44704789806/artifacts/14615735988).  
**Independently downloaded original ZIP SHA256:** `2c7eb6b55aff8d92627fdbbef07b869d7803116b713b6f61c9be679f41724fee`, matches CI original artifact-upload digest.  
**Embedded `exact-tested-commit.txt`:** `18a1228f85e75966786949c431ff5260c0b95a9d`, independently inspected.  
**Disposition: ACCEPT** both source-original G1C8 theorems as strict GREEN with independently imported consumer.

## Exact qualification

- Source-original frozen BFSS Core, Gamma9, relational projector/Circle, G0A/B/C and G1A/B/C0/C1/C2/C3/C4/C5/C6/C7 exact source byte pins: PASS.
- New G1C8 native and independently imported consumer exact blob hash pins and bounded structural preflight: PASS.
- Source-independent signed-permutation original integer fixture: PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Qualified original dependency build (9044 jobs): PASS.
- Native and independent consumer `-DwarningAsError=true` compilation: PASS.
- Four native/independent `#print axioms` reports show exactly `[propext, Classical.choice, Quot.sound]`, with no `sorryAx`: PASS.
- Original artifact independently downloaded, ZIP SHA256 calculated and matched original CI digest; six evidence files listed, embedded exact tested SHA read, native/consumer logs inspected: PASS.
- Six original files: `exact-tested-commit.txt`, `native-standard-four-radius-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.
- No alternate projector or Gamma source changes, source coordinate-plane assumption, new axioms, proof-resource increases, physical Fock changes or write to `main`.

## Accepted statements

```lean
noncomputable def standardCoordinateRadius (x : Fin 4 → ℝ) : ℝ :=
  Real.sqrt (x ⬝ᵥ x)

theorem standardCoordinateRadius_continuous :
    Continuous standardCoordinateRadius

theorem standardCoordinateRadius_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < standardCoordinateRadius x
```

The standard real-four Euclidean radius is defined from finite dot-self, not the finite Pi function space's default sup norm. This is **distinct** from the accepted original Gamma9 transferred positive-definite quadratic `Q` and its radius `r=sqrt Q`.

## Source boundaries and next target

G1C7 is a continuous retraction onto `S_Q = {x : Fin 4 → ℝ // Q(x)=1}`, not a homeomorphism from the full punctured R4; positive radial multiples coincide under normalization. G1C8 proves the standard radius is continuous and positive away from zero. The next bounded gate should transfer standard dot-self homogeneity and normalization to `S_std = {x : Fin 4 → ℝ // x ⬝ᵥ x=1}`, then establish explicit typed continuous maps `S_Q → S_std` and `S_std → S_Q` with separate inverse checks. Only after both directions have strict native and independent-consumer green may the identification with the Euclidean `S³` be accepted. Standard Hopf circle equivariance, Hopf quotient, Fock implementation and physical hopfion remain unproved and require independent gates.

Historical REDs remain preserved.
