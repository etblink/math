# IBI G0B1 native determinant one R1 — RED_UNQUALIFIED: sum order and original color index types

Date 2026-11-15 Pacific.
[Strict run #43730126071](https://github.com/etblink/math/actions/runs/43730126071)
at immutable tested commit `26dfb65a29bba61f63b98b9b9358d650f0b1d35f`,
attempt 1, job `132860536217`: **completed/failure**.

## Preflight and first causal errors

Exact source and imported dependency blob preflight PASS; pinned Lean 4.34.1,
Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS.
Cold source build progressed to its **9022nd** module, then failed
compilation of `IBIG0B1NativeDetOne.lean`; there was **no successful**
source build, independent consumer, or final strict-green marker.

First error `IBIG0B1NativeDetOne.lean:60:60`:
`unsolved goals` where the original column triple simplified to
`∑ A, colorCross ... A * R A 2`, while the original `PiLp.inner_apply`
simplified to `∑ A, R A 2 * colorCross ... A`. The scalar factors
commute but the specific `simp` tactic did not discharge the finite
sum. No source sign counterexample.

Next six source elaboration errors at lines `96:41,98:41,100:41,106:39,
107:39,108:39`: `OfNat (ColorIndex 2) k` for k=0,1,2 absent.
The already-qualified G1B finite-orientation gate established the
appropriate canonical `(k : Fin 3)` bridge. The final `rw` generated
an additional mismatched `sorry` metavariable goal due to these
failed elaborations.

The three affected source declarations subsequently showed `sorryAx`
in build-time `#print axioms`: `originalColumnTriple_eq_sourceInner`,
`sourceColorUnitTriple_eq_one`, `originalAdjointColorMatrix_det_one`.
These are **unqualified**, despite the four earlier helper declarations
displaying standard-only axioms. The separate independent consumer
did **not** run. Do not describe R1 as theorem-qualified.

Evidence: [artifact #14169080415](https://github.com/etblink/math/actions/runs/43730126071/artifacts/14169080415)
(5,612 bytes). GitHub reported SHA256
`a229a58918c31659f5c5830db63eec9ea958f73bb5ecd831445b1dd5ec70f1be`;
the artifact was not downloaded/rehashed independently.
Original source blob `ce78c70b1e70375c87aa3474187f41edf7cafbd9`,
untouched consumer blob `6e08594769f078946f2793c8df7e55322abc881d`,
strict workflow blob `eab2b5c8bfd5da794e3584d3b6d306d069b34f79`.

## Scientific disposition and guardrails

Failure is source proof normalization/type elaboration, not a
demonstrated counterexample to original BFSS det+1.
G1B, FIN-DET3, and source-columns/triple donor qualifications remain GREEN
on their historical immutable SHAs.
R1 **RED_UNQUALIFIED**; no promotion. Preserve exact negative artifact
and tested SHA, and apply a bounded source-only tactic/typing repair.
Any R2 RED must preserve first cause; two analogous first-causal REDs
trigger architecture review. Do not relax axioms, imports, file pins,
strict workflow, timeout or consumer. Do not claim SO3 surjectivity,
orbit classification, BFSS spectrum or ontology.
