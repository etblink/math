# RHOPF-P9C3D2G1A R4 — original Gamma9 relational range-unit-sphere equiv strict GREEN

**Pacific date:** 2026-11-19; CI completed 2026-11-20T05:53:06Z.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Run:** [#44682661002](https://github.com/etblink/math/actions/runs/44682661002), attempt 1 SUCCESS.  
**Exactly tested commit:** `6aed1d99ff1a9a75220c8044cba1e83b1da89a37`.  
**Original job:** `136109504709`.  
**Original artifact:** [#14605532346](https://github.com/etblink/math/actions/runs/44682661002/artifacts/14605532346).  
**Independently downloaded artifact ZIP SHA-256:** `344d9281afb3f6b64b54fce78e6a7693f790be750ccc0c49c4366180b9210a3b`, exact match with CI-upload digest.  
**Embedded original `exact-tested-commit.txt`:** `6aed1d99ff1a9a75220c8044cba1e83b1da89a37` (independently verified).  
**Disposition: ACCEPT G1A as original-source-native and independently imported strict GREEN.**

## Qualification

- Frozen original BFSS, Gamma9, relational projector, Circle, rank, source-original G0A/B/C exact hash pins: PASS.
- Source/consumer preflight, independent original signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original accepted dependency build: 9034 jobs, PASS.
- G1A native Lean source `-DwarningAsError=true`: PASS.
- Independently imported original-source typed consumer `-DwarningAsError=true`: PASS.
- Both original axiom reports for `FCP.RHOPFP9C3D2G1A.relationalUnitSpinorEquivRange`: exactly `[propext, Classical.choice, Quot.sound]`; neither reports `sorryAx`: PASS.
- ZIP checksum independently recomputed, ZIP six-file manifest inspected, embedded tested SHA checked, native/independent logs checked: PASS.
- No proof-resource enlargement, new axioms, modified original Gamma9 matrix or preferred basis.

## Qualified source-exact result

```lean
abbrev RelationalRangeUnitSphere : Type :=
  {v : LinearMap.range (Matrix.toLin' relationalProjector) //
    v.1 ⬝ᵥ v.1 = 1}

noncomputable def relationalUnitSpinorEquivRange :
    RelationalUnitSpinor ≃ RelationalRangeUnitSphere
```

This is a basis-independent `Equiv` between the original fixed-point unit spinors `v` with `P.mulVec v = v` and `v ⬝ᵥ v = 1` and the unit sphere of the **actual original** linear projector range. It is proved using `LinearMap.isProj_range_iff_isIdempotentElem`, which relies on source-qualified idempotence. The construction does not use an unproved coordinate-plane equality. Since prior G0C established `Nonempty RelationalUnitSpinor`, both are inhabited.

## Negative knowledge preserved

- G1A R1 [#44680410958](https://github.com/etblink/math/actions/runs/44680410958): original mathematical source native GREEN but independently imported consumer RED due to missing `noncomputable` context.
- G1A R2 [#44682082979](https://github.com/etblink/math/actions/runs/44682082979): strict preflight RED because workflow still required one `end` instead of two after consumer `noncomputable section` was correctly added.
- G1A R3 [#44682518923](https://github.com/etblink/math/actions/runs/44682518923): zero jobs; invalid YAML due to accidental JavaScript replacement-string `$'` interpretation. Rebuilt R4 from last syntactically valid workflow and used literal replacement callback, preserving all contracts.
- R4 [#44682661002](https://github.com/etblink/math/actions/runs/44682661002): original native + independent consumer strict GREEN. All previous RED evidence retained.

## Next geometric boundary

The present equivalence is a type-level equivalence. Next prove that the identity-on-ambient-space equivalence is a **homeomorphism** with the inherited subtype topologies, using actual source-compiled continuous subtype embeddings. A later, separate gate should produce an isometric linear equivalence between the dimension-four original projector image and `Fin 4 → ℝ`, then restrict it to a unit-sphere homeomorphism, and only then test Circle-equivariance / genuine Hopf quotient. No physical 48-Majorana / 24-mode Fock action, gauge covariance, (S^3/S^1) Hopf classification or topological state is proven by G1A.

Do not change `main`, accepted source Mathlib/Lean pins, or historical negatives.
