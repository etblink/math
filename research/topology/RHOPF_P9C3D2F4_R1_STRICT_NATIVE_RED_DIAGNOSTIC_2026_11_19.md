# RHOPF-P9C3D2F4 R1 — source-native RED diagnostic (preserved)

**Date:** 2026-11-19 America/Los_Angeles (completed 2026-11-20 02:50 UTC).  
**Branch:** `integration/bfss-unified-research-20261108`  
**Exact tested commit:** `9699019082ad3ea53492a4a2268d9666aad0d317`  
**Run:** https://github.com/etblink/math/actions/runs/44661894999  
**Artifact ID:** `14596711137`  
**Artifact:** https://github.com/etblink/math/actions/runs/44661894999/artifacts/14596711137  
**Downloaded original ZIP SHA-256:** `b9eb07e874efe362503eabbee02362abdf7a61fb5384ea8f97745f6c3dcaa117`  
**Status:** **RED — NOT QUALIFIED**.

## Verified stage boundaries

- Frozen original-source contract and original integer-source fixture: PASS.
- Lean v4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored: PASS.
- Accepted original Gamma9 dependencies built successfully (9030 jobs): PASS.
- Native P9C3D2F4 Lean source: RED.
- Independent imported consumer: SKIPPED.
- Independent strict axiom checks: SKIPPED.
- RED artifact uploaded and SHA-256 matched original GitHub Actions log: VERIFIED.

## Exact source failure

```text
OAI/MathematicalPhysics/BFSS/Contrib/Kotler/RHOPFP9C3D2F4OriginalGammaRelationalUnitCircleJointContinuity.lean:36:4:
error: (deterministic) timeout at `isDefEq`, maximum number of heartbeats (200000) has been reached

'FCP.RHOPFP9C3D2F4.relationalUnitCircleAction_joint_continuous' depends on axioms:
[propext, sorryAx, Classical.choice, Quot.sound]
```

Line 36 is the nested `(continuous_subtypeVal.comp continuous_snd)` inference inside `continuous_fst.prodMk`. This is a proof elaboration/resource failure, not evidence against the mathematical continuity statement. The axiom report includes `sorryAx` because compilation failed; no acceptance or partial theorem promotion is allowed.

## Bounded R2 recovery contract

Split the original nested continuity composition into separately typed local hypotheses for the product's second projection, subtype inclusion, carrier projection, pair map and original qualified joint continuity; retain the exact theorem statement, source imports, original Gamma9 representation, subtype, consumers, pinned dependencies, warnings-as-errors, and the **200000-heartbeat limit**. No new axiom, alternate representation, or enlarged resource budget. Update only the gate-specific source blob pin in the preflight to match the R2 implementation. Require new strict native and independent GREEN, clean axiom reports, and independently verified original R2 artifact before acceptance.

**Last accepted predecessor:** P9C3D2F3 R1 GREEN #44659929627; P9C3D2F4 remains unqualified.
