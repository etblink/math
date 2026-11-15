# G0C native Z-axis generator — bounded source-adapter gate

**Status:** STAGED / NOT QUALIFIED until separate cold strict CI.
**Research branch:** `research/bfss-incidence-unified-20261114`.
**Decision date:** 2026-11-15 Pacific.

## Motivation and source boundary

The newly [accepted G0C inverse-Pauli interface](https://github.com/etblink/math/actions/runs/43750250997) proves actual original gauge inverse is star and original adjoint matrix equals inverse Pauli trace. The next missing source-to-cover step is a **genuine native generator** realizing a specified coordinate-axis SO(3) rotation, not an arbitrary textbook SU2 surrogate.

This first small gate only constructs a smooth-parameterized-in-form (continuity not proved here) diagonal **native** `GaugeGroup 2` witness and proves exact membership and identity at angle zero. The matrix is

```text
Z(θ) = diag(exp(-i θ/2), exp(i θ/2))
```

and is a candidate future preimage of the standard `rotZ θ`. Do not treat the rotation image as a theorem until the separate original G3A-adjoint axis-image gate passes.

## Donor provenance and alternatives

- Public [LionSR/QICLean EulerAngles.lean](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean), commit `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`, Apache-2.0; its `su2Diag` and `su2Diag_mem_specialUnitaryGroup` pattern motivates the standalone local proof. It is **not imported** and must not be treated as BFSS-qualified code; it pins Lean 4.36.0-rc1 vs original BFSS Lean 4.34.1.
- The original BFSS `GaugeGroup 2` is exactly `Matrix.specialUnitaryGroup (Fin 2) ℂ`. New `sourceZGauge θ` lives in this genuine subtype.
- Older S1V52-L7C5 provides `originalNativeZCircle` and `originalNativeYCircle` in source gauge but imports L7C4/L7C3 and old B1/C1/C2C chains; header explicitly says STAGED / NOT QUALIFIED. L7C7 constructs SU2-native ZYZ for arbitrary SU2 inputs, **not** arbitrary SO3 targets, and is likewise staged. L9C3 quaternion-adjoint matrix is also staged. Do not import those chains as accepted proofs.
- The sign convention matters: existing positive-`i` quaternion native Z(a) has `diag(exp(+ia),exp(-ia))`, so this chosen standard positive `rotZ θ` witness corresponds to `a=-θ/2`, not `a=+θ/2`. Verify source G3A indices and signs at the separate axis-image gate.
- For full surjectivity, a corresponding native X-axis generator, its image and an arbitrary-`SO(3)` ZXZ decomposition with gimbal-lock branch must also be independently proven. QICLean's Euler decomposition is research evidence, not a qualified in-repo donor.

## Gate controls

- Only source `IBIG0CNativeZGenerator.lean`, independent consumer and strict workflow added; frozen G0B1, G0C-PAULI-TRACE and G0C-INV-PAULI source bytes unaffected.
- Exact native source/consumer blob pins, frozen parent blob, Lean 4.34.1/Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold compilation, independent consumer, standard axiom audits and preserved diagnostics.
- Source statements are **candidate** until independent exact-source CI GREEN.
- Stop after two analogous compiler/consumer failures and preserve red diagnostics. No integration/main/FCP changes.
