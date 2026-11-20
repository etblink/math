# RHOPF-P9C3D2G1A R1 — native GREEN, imported independent consumer RED

**Date:** 2026-11-19 America/Los_Angeles (CI completed 2026-11-20T05:34:21Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** https://github.com/etblink/math/actions/runs/44680410958  
**Exact tested commit:** `4979cfb1875a464d356611ff04e148f994a0eb91`.  
**Original job:** `136102164674`.  
**Original archive:** https://github.com/etblink/math/actions/runs/44680410958/artifacts/14604736639  
**Independently computed original artifact ZIP SHA-256:** `0aa409e19467ed56ac63ba526d244d42859cac3feda9760a7eb18a41113e7a14`.  
**Verified embedded original exact-tested-commit.txt:** `4979cfb1875a464d356611ff04e148f994a0eb91`.  
**Disposition:** **RED, NOT QUALIFIED**, because strict independent consumer compilation failed.

## Stage-by-stage results

- Original frozen-source and independent proof-contract preflight, signed-permutation integer fixture: PASS.
- Lean 4.34.1 + Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted original dependency build: PASS (9034 jobs).
- New G1A original Lean source compilation with warnings-as-errors: PASS.
- New source native `#print axioms FCP.RHOPFP9C3D2G1A.relationalUnitSpinorEquivRange`: exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Independently imported source-type audit: **RED**.
- Both required reports and strict independent certification together: NOT YET QUALIFIED.
- ZIP hash and embedded exact tested commit: independently verified.

## Exact failure (independent consumer only)

```text
diagnostics/RHOPFP9C3D2G1AOriginalGammaRelationalRangeUnitSphereEquivIndependentAudit.lean:11:0:
error(lean.dependsOnNoncomputable): failed to compile definition,
consider marking it as 'noncomputable' because it depends on
'relationalUnitSpinorEquivRange', which is 'noncomputable'
```

The source theorem/definition was introduced as `noncomputable def relationalUnitSpinorEquivRange` because its proof relies on the original idempotent projection and noncomputable structures. The independent consumer contains an `example : RelationalUnitSpinor ≃ RelationalRangeUnitSphere := relationalUnitSpinorEquivRange` without noncomputable context, so Lean rejects generating a computable definition from a noncomputable equivalence. This is a correctly-enforced native-vs-independent boundary and not a contradiction or failure of the accepted projector.

## Bounded R2 repair

Change only the independent consumer by wrapping it in an explicitly `noncomputable section`; preserve its imported source-typed `example`, theorem and `#print axioms` tests. Update only the consumer blob pin in strict workflow. Preserve original G1A mathematical source file and hash byte-for-byte, all original accepted Gamma9/G0A/G0B/G0C, original integer fixture, pinned toolchain and strict proof limits. Full strict original native + imported independent GREEN, both axiom checks and archived SHA remain mandatory.

No `S³` homeomorphism, equivariance, Hopf quotient, physical Fock state or physical hopfion is certified by this gate.
