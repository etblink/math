# P3-D4 first RED: workflow-only consumer-import assertion — 2026-11-12

**Run:** https://github.com/etblink/math/actions/runs/43298557973,
job `131463265735`, tested candidate `d2f8923dd9b40bf661099591dcd435b9684e5a3b`.
**Conclusion:** FAILED before Lean restore, cold source compilation or consumer compilation.
**First causal diagnostic:** the 65-pin preflight Python assertion `<stdin>:16`
(`AssertionError`) in `Verify 63 accepted prior pins and both D4 blobs`.

The submitted D4 source imports D3 and OP1B; the D4 independent consumer
imports **D4**, as it must. The generated D4 workflow correctly checked
the source imports but accidentally required the D4 consumer to import
`P3D3OriginalFockColumns`, a left-over from cloning the D3 workflow.
The exact string mismatch causes the preflight assertion. No mathematical
Lean error was observed; this run did NOT compile D4.

**Bounded correction:** commit
`38427230507120741f81099db53a16d483bce5a0` changed exactly
one workflow line, asserting that the D4 consumer imports
`OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D4OriginalFockCrossPairingColumns`.
No D4 source/consumer, toolchain, historical module, or SHA was changed.
All **63 accepted D3/ancestor pins plus two candidate D4 blobs (65 total)**
remain byte-identical. Source D4 blob
`a645bd50b11324f218b76ad4bc07c20b320d4a01`,
consumer `ed25e8f07d4d4438285e9ea03df0c380260137fd`.
Corrected new strict run:
https://github.com/etblink/math/actions/runs/43298762479.

**Methodological rule:** generated strict preflights must be checked
against BOTH exact source and consumer import lists *before* push.
A red at a source-closure preflight is not evidence of a Lean
theorem failure. D4 remains unqualified pending a fresh, complete green.
