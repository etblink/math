# GM1A R2 — exact source native RED: boson inverse conversion, 2026-11-22

**Status: rejected / unqualified.** The separate GM0B original source quantizer covariance gate remains strict GREEN.

- [Original run #45068127143](https://github.com/etblink/math/actions/runs/45068127143), attempt 1, exact tested commit `e5d7e95353a57f0df087657246f590ef925de167`: **failure**.
- Original [artifact #14772940031](https://github.com/etblink/math/actions/runs/45068127143/artifacts/14772940031), 11,732-byte ZIP, independently downloaded and validated against ZIP SHA-256 `ac1301a253bf9eeb135a4158a61a7e816b13d00ff152fad7cf1b993d9e92d18f`, CRCs and tested SHA. Logs and source preflight independently read.
- Frozen source SHA and ancestor, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, consumer structure and environment all PASS.
- Native build reached 9,080 jobs; upstream GM0B built with only accepted `[propext, Classical.choice, Quot.sound]`. **Native GM1A target failed at line 62**; independent strict consumer never ran.
- **First-causal R2 error:** `Type mismatch: After simplification`. Term `LinearIsometryEquiv.apply_symm_apply (G.boson g) x` concludes `G.boson g ((G.boson g).symm x) = x`, while expected goal is `G.boson g (G.boson g⁻¹ x) = x`. The `simpa only [map_inv]` attempt did not identify the two inverse-action presentations.
- **What worked:** R2's typed `change ... at hf` and `change ... at hb` eliminated R1's missing-expression `rw` failure. Do not reverse those.
- **R3 decision:** use actual source `G.boson` MonoidHom law `map_mul`, the group identity `g*g⁻¹=1`, and source `map_one`/equivalence identity. This follows established, successfully compiled BFSS G2A/G7Y source patterns. Do not change hypotheses, gauge conventions, original Fock carrier, maximal-domain scope, workflow, or frozen pins. If R3 fails, preserve the new first-causal evidence and reconsider the strategy.
- Error-induced `sorryAx` in the failed native axiom outputs is not tolerated for qualification. GM1A remains **pending** until original native + independent consumer + archived evidence all green.

**No spectral/Hopfion claims:** this is a representative a.e. transport gate, not maximal domain invariance or a physical state proof.
