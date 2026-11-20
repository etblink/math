# RHOPF-P9C3D2G1C7 R1 — continuous original Gamma9 Q-unit radial retraction strict GREEN

**Pacific date:** 2026-11-20 (CI completed UTC 2026-11-20T08:39:24Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108` (not `main`).  
**Original strict run:** [#44702819736](https://github.com/etblink/math/actions/runs/44702819736), attempt 1 SUCCESS.  
**Exactly tested commit:** `72eb7f492f45e3ff99491b9b11d2fd8d91fbf23f`.  
**Original job:** `136175055969`.  
**Original artifact:** [#14613878063](https://github.com/etblink/math/actions/runs/44702819736/artifacts/14613878063).  
**Independently downloaded original ZIP SHA256:** `9c27d8adb0edb885683e4bd6da354a91f4feb59549dbb419159330b6d5ac1474`, exact match with original GitHub Actions uploaded digest.  
**Archive embedded `exact-tested-commit.txt`:** `72eb7f492f45e3ff99491b9b11d2fd8d91fbf23f`; independently inspected and verified.  
**Disposition:** **ACCEPT** all three source-original G1C7 native and independent-consumer statements as strict GREEN.

## Strict controls and evidence

- Exact original BFSS Core, Gamma9 real projector, original Circle action and all accepted G0A/B/C and G1A/B/C0/C1/C2/C3/C4/C5/C6 source byte SHA pins: PASS.
- New G1C7 source and independent consumer blob hashes plus bounded proof-contract preflight: PASS.
- Source-independent original signed-permutation Gamma9 integer fixture: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build (9043 jobs): PASS.
- Original G1C7 native `-DwarningAsError=true` compilation: PASS.
- Independently imported source-typed G1C7 consumer `-DwarningAsError=true` compilation: PASS.
- Six native and independent original `#print axioms` reports for three declarations: exactly `[propext, Classical.choice, Quot.sound]` and no `sorryAx`: PASS.
- Original ZIP independently SHA256 checked against CI upload, six evidence files listed, original source + independent reports inspected, embedded exact tested commit matched: PASS.
- Six original files: `exact-tested-commit.txt`, `native-continuous-quadratic-retraction-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.
- No modified Gamma9 matrices, alternate projector/coordinate plane, additional axioms, proof-budget increases, physical Fock edits, or main-branch writes.

## Qualified mathematical declarations

```lean
abbrev RelationalNonzeroCoordinates : Type :=
  {x : Fin 4 → ℝ // x ≠ 0}

abbrev RelationalQUnitCoordinates : Type :=
  {x : Fin 4 → ℝ // relationalRangeCoordinateDotSelf x = 1}

noncomputable def relationalRadialNormalize :
    RelationalNonzeroCoordinates → RelationalQUnitCoordinates :=
  fun v => ⟨(relationalRangeCoordinateRadius v.1)⁻¹ • v.1,
    relationalRangeCoordinateDotSelf_inv_radius_smul v.1 v.2⟩

noncomputable def relationalQUnitIntoNonzero :
    RelationalQUnitCoordinates → RelationalNonzeroCoordinates :=
  fun v => ⟨v.1, relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2⟩

theorem relationalRadialNormalize_continuous :
    Continuous relationalRadialNormalize

theorem relationalQUnitIntoNonzero_continuous :
    Continuous relationalQUnitIntoNonzero

theorem relationalRadialNormalize_retract
    (v : RelationalQUnitCoordinates) :
    relationalRadialNormalize (relationalQUnitIntoNonzero v) = v
```

The abstract `Fin 4 → ℝ` real-coordinate model is attached to the **actual original** Gamma9 projector image via the previously accepted continuous linear equivalence. `Q` remains the original Euclidean real-spinor dot-self transported through that inverse linear map. This theorem certifies that normalization is continuous, lands in `Q=1`, and is the identity on the Q-unit level set. The inclusion is also continuous, hence the Q-unit subset is a continuous retract of the punctured coordinate space.

**Noninjectivity guard:** the radial retraction is NOT a homeomorphism between punctured R⁴ and the Q-unit level set; radial positive multiples coincide.

## Next boundary

Construct and strictly qualify a **different map** between the Q-unit subtype and the **standard real-four dot-one sphere**. The standard Euclidean radius `s(x) = sqrt(x ⬝ᵥ x)` must be handled with its own positivity, continuity and homogeneity; do not substitute the default finite Pi sup norm. For `x : QUnit`, `x / s(x)` lies in the standard dot-one sphere. Inverse: for `y : StandardUnit`, `y / r(y)` lies in Q-unit. Their inverse identities follow positive 1-homogeneity of both radii and careful denominator cancellation. Separate typed continuity and inverse gates before promoting a `Homeomorph`. Later link to the topology of the standard `S³`, then separately test source circle equivariance and Hopf quotient. Original physical Fock, gauge/Hamiltonian covariance and stable physical hopfion remain OPEN.

Preserve all prior RED evidence.
