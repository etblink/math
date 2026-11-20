# RHOPF-P9C3D2G0C R1 — source native RED preserved

**Date:** 2026-11-19 America/Los_Angeles (CI completed 2026-11-20T04:47:59Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Exact tested commit:** `c7c9efa892d07ac22a579f9ac09123bbb773c942`.  
**Original CI run:** https://github.com/etblink/math/actions/runs/44675202671  
**Job:** `136085275486`.  
**Artifact:** https://github.com/etblink/math/actions/runs/44675202671/artifacts/14601529153  
**ZIP SHA-256 (independently downloaded and verified):** `da4d6263a9b3f1f19f27df0c18113cc78d2ea435f914146d77c36c1e56823f0d`.  
**Archive embedded exact tested commit:** `c7c9efa892d07ac22a579f9ac09123bbb773c942` (verified).

**Disposition: RED — NOT QUALIFIED.**

## Stage boundaries

- Frozen original source, integer fixture and proof-contract preflight: PASS.
- Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Frozen original Gamma9 and P9C3D2G0B dependency build: PASS (9033 jobs).
- Native G0C proof compilation: RED.
- Imported independent consumer: SKIPPED.
- Native/independent strict axiom qualification: NOT ESTABLISHED. The generated native `#print axioms` reports `sorryAx` because elaboration failed.
- Original archival artifact: PRESENT, downloaded, ZIP checksum and embedded commit independently verified.

## Exact diagnostic

```text
RHOPFP9C3D2G0COriginalGammaRelationalUnitSphereNonempty.lean:49:8:
error: Tactic `rewrite` failed: Did not find an occurrence of the pattern
  ?f (?c • ?x)
in the target expression
  Matrix.mulVec relationalProjector (r⁻¹ • v) = r⁻¹ • v
```

The direct `rw [map_smul, hfixed]` cannot match the linear-map syntactic head because Lean has definitionally exposed the original `Matrix.mulVec` implementation. No mathematical counterexample was obtained; the independently accepted G0B nonzero source-original fixed spinor remains valid.

## Bounded R2 correction

Keep exact theorem `relationalUnitSpinor_nonempty : Nonempty RelationalUnitSpinor`, all original source pins, linear map, nonzero vector, dot-self positivity, inverse square-root normalization and original independent consumer unchanged. Correct **only** `hu_fixed` by a typed `calc`: apply `map_smul (Matrix.toLin' relationalProjector) r⁻¹ v` to an explicit linear-map expression, then substitute the previously accepted `hfixed` and close by definitional equality. Maintain default heartbeat limits; no linter overrides, no alternate physical/Fock definitions, no new axioms. Update only new source hash in workflow and preserve R1 artifact.

**Stop if R2 fails**: retain the RED and diagnose the actual remaining compiler message before a further change. Do not accept nonemptiness until native and independently imported strict GREEN plus archived original SHA verification.
