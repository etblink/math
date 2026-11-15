# IBI-G0C Pauli trace — R3 RED diagnostic (strict linter), preserved

**Date:** November 15, 2026 Pacific
**Branch:** `research/bfss-incidence-unified-20261114`
**Verdict:** RED_NOT_QUALIFIED. No G0C acceptance or SO(3) surjectivity claim.

- [Run #43745356624](https://github.com/etblink/math/actions/runs/43745356624) at exact tested commit `df66cd654a6d74821687fdbaac8d9981e8de4982`; job `132907337150`, completed/failure.
- Source pin preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore passed.
- The two original-source theorems `originalAdjointColorMatrix_normalizedPauliTrace` and `originalAdjointColorMatrix_pauliTrace` **both elaborated and printed standard axioms only:** `propext`, `Classical.choice`, `Quot.sound` (no `sorryAx`).
- Strict `-DwarningAsError=true` source compilation failed at `IBIG0CPauliTrace.lean:64:41` due exclusively to Lean linter diagnostic: `Used tac1 <;> tac2 where (tac1; tac2) would suffice`. The statement and mathematical proof logic are not the failure.
- The independent consumer was NOT reached. Do not call the gate GREEN_QUALIFIED.
- [R3 failure artifact #14174126988](https://github.com/etblink/math/actions/runs/43745356624/artifacts/14174126988); GitHub-reported ZIP SHA256 `34caa41c905f614e7e312fae9d451e007163d1cc12bf5539e369db5314d5fff2` (not independently downloaded/rehashed).
- R4 bounded repair: replace final `norm_num [...] <;> ring` with `norm_num [...]; ring`, update only the strict source SHA pin, and preserve this diagnostic. Freeze source definitions, original donors, theorem contracts, and independent consumer.
- Stop after any analogous warning/consumer failure and inspect typed diagnostics rather than blindly adding tactics. R1 parser, R2 real-to-complex coercion, and R3 linter are distinct failure classes.
- No unified-integration, main, or frozen FCP edits.
