# IBI G0C-X-IMAGE R1 — original source X-axis image candidate

**Date:** November 15, 2026 Pacific  
**Branch:** `research/bfss-incidence-unified-20261114`  
**Verdict at creation:** STAGED_NOT_QUALIFIED. Do not promote to GREEN absent independent source-pinned strict CI.

The newly [qualified G0C-X-GEN0](https://github.com/etblink/math/actions/runs/43757062017) at tested commit `34a93dae68577726cb8099b58d7f7cc47b815be6` constructs a genuine upstream BFSS `sourceXGauge β : GaugeGroup 2`. The accepted [G0C-INV-PAULI](https://github.com/etblink/math/actions/runs/43750250997) identifies the original G3A action with the inverse-based Pauli trace. The accepted [Z-image](https://github.com/etblink/math/actions/runs/43755443223) supplies the real-valued trace-extraction architecture.

The separate target is exact source-native
```lean
FCP.BFSSSU2GaugeG3A.adjointColorMatrix
   (FCP.BFSSIBIG0CNativeXGenerator.sourceXGauge β) =
  !![1, 0, 0;
     0, Real.cos β, -Real.sin β;
     0, Real.sin β, Real.cos β]
```
Rows represent output colors and columns input colors. The independent consumer checks arbitrary β matrix identity, (2,1)=sin β, and (1,2)=-sin β; the auxiliary complex trace is proved before taking real parts. The finite calculation is adapted from [QICLean SpinCover EulerAngles](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean) at pinned donor `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`, but no donor module is imported or treated as verified in the source's Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` environment.

Bounded proof strategy: use the already accepted native X-source matrix membership to rewrite its inverse as its 2×2 adjugate, then finite Pauli component expansion; use real cosine/sine half-angle identities and the Pythagorean identity, checking sign orientation. Reuse the independent accepted inverse-Pauli source theorem, not a new group. Preserve the exact source and consumer SHA preflight, standard-only axiom reports, cold build, independent consumer and archive. Stop after two analogous REDs and retain failures with typed goals. No global SO(3) Euler decomposition or universal surjectivity follows from an X-axis result alone. No changes to unified integration, main, earlier accepted source bytes or frozen FCP.
