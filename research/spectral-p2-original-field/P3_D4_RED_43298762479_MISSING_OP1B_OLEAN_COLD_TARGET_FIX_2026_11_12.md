# P3-D4 second RED — incomplete cold-build target, missing accepted OP1B .olean (2026-11-12)

**Run:** https://github.com/etblink/math/actions/runs/43298762479
**Job:** `131463985255`. **Tested SHA:** `38427230507120741f81099db53a16d483bce5a0`.
**Outcome:** RED. **Previous D4 RED**: #43298557973 (workflow-only mistaken consumer import check), diagnosed and corrected in the preceding memo. **Current branch parent**: `8ad820d2889243ee32d0737ac59b0b7950ef4944`.

## First causal log and accepted facts

The 65 pinned Git blobs passed the source/consumer and ancestry preflight and the Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 environment check passed. The workflow's cold build unexpectedly built
`OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D3OriginalFockColumns`
(9173 jobs, successful) and then immediately attempted to invoke standalone Lean on
`P3D4OriginalFockCrossPairingColumns.lean`. The first and only actual Lean error:

```text
P3D4OriginalFockCrossPairingColumns.lean:1:0:
error: object file '.../P3OP1BOriginalFockTraceColumns.olean'
of module OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1BOriginalFockTraceColumns does not exist
```

This is **cold compilation dependency closure**, not a D4 source proof failure and not an OP1B mathematical regression. The new D4 source imports both original green D3 and OP1B; building D3 alone does not necessarily generate the OP1B object. Standalone `lake env lean` does not build its missing imports. D4 consumer was never reached.

## Bounded repair and strict retest

Modify exactly two workflow command lines:
1. target the output object `.lake/build/lib/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D4OriginalFockCrossPairingColumns.olean` rather than D3's object;
2. cold build `OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D4OriginalFockCrossPairingColumns` rather than D3.

`lake build D4` should compile all source imports in the correct dependency order, including OP1B, before separate standalone source and consumer invocations. The revised gate must still pass cold build, source axioms and warnings-as-errors, the independent consumer and axiom checks to qualify.

All **65** pinned source/consumer Git blobs (63 accepted ancestor/D3 and two candidate D4) remain byte-identical, as do D4 source `a645bd50b11324f218b76ad4bc07c20b320d4a01`, consumer `ed25e8f07d4d4438285e9ea03df0c380260137fd`, toolchain, import lists and original BFSS Hamiltonian.

## Methodological lesson

Do not assume cloning a strict workflow proves source closure. Source-import assertions and Git blob checks are insufficient: **the Lake build target must match the target Lean module**. Pre-commit workflow audit should independently compare (1) target source path, (2) object path, (3) Lake target, (4) independent consumer import and (5) every pinned content blob. Classify preflight, dependency closure, elaboration, and consumer failures separately. The mathematical D4 statement remains unqualified until full GREEN.
