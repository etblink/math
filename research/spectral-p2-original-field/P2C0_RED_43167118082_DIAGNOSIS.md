# P2-C0 red #43167118082 — bounded consumer index repair

**Date:** November 11, 2026 Pacific (run completed November 12 UTC). **Original test SHA:** `b1ae1bbb69d42f391601c7658855a37a3b4df76d`. **Disposition:** RED due solely to independent-consumer elaboration, source theorems COMPILED; no theorem qualification accepted until a new completed strict-green run.

## Evidence chain

Run [#43167118082](https://github.com/etblink/math/actions/runs/43167118082) checked out exact source, passed the ten-blob/environment preflight, restored the pinned Lean 4.34.1 / Mathlib d13f23b7 environment, and **cold-built all 8,971 jobs**, including the new actual source module. The standalone source pass printed both allowed axiom inventories (propext, Classical.choice, Quot.sound). The job failed later when compiling `lean/diagnostics/BFSSP2C0OriginalPauliPotentialConsumer.lean` at lines 22, 29 and 36: `failed to synthesize OfNat (ColorIndex 2) n` for n=0,1,2. Lean displayed downstream goals containing `sorry ()` placeholders resulting from **elaboration recovery**; those are NOT source `sorry` declarations or a new axiom. The actual source has no added sorry/admit/axiom.

## Root cause and bounded repair

`ColorIndex N` in the original `Core.lean` is `Fin (N^2-1)`. At N=2 it is definitionally `Fin 3`. Lean does not reliably resolve numeral elaboration in the abbreviated `ColorIndex 2` expected type. Replace just the nine consumer numeral occurrences with explicitly typed `(n : Fin 3)`, leaving all theorem statements, original source definitions, and source proofs unchanged. This does **not** weaken the consumer's positive/reversed/repeated color tests or nonnegative-potential consumer.

The same run's logs include known `lake env` warnings of the exact form `warning: <package>: repository '<absolute>/lean/.lake/packages/<package>' has local changes` for dependencies such as belyi and iut. These are from Lake package checkout and do not constitute Lean proof warnings. The audit now filters **only that precise format**, while still failing any other warning, error, sorryAx, or unauthorized axiom.

Update the workflow consumer Git blob pin to the exact repaired consumer. Source blobs and Lean/Mathlib pins unchanged. One new push-triggered strict qualification run is required. **Do not automatically fast-forward unified integration on source-only success**: complete the independent consumer and axiom audit first, then verify the whole C0 package's promotion scope and request owner authorization.

No new branch, FCP modification, or changes to `main`/unified integration.
