# IBI-G0C Pauli trace — R4 RED audit and exact independent-consumer repair

**Date:** 2026-11-15 (Pacific)
**Branch:** `research/bfss-incidence-unified-20261114`
**Verdict:** RED_NOT_QUALIFIED (strict source GREEN, consumer RED).

- [Run #43746595679](https://github.com/etblink/math/actions/runs/43746595679), tested commit `400b7bb96ead55c666f6f25fe34c6d3d03d7c2cc`, job `132911146205` completed FAILURE.
- Exact pin preflight, Lean 4.34.1 / Mathlib restoration, 9016-job cold native source build and strict source `-DwarningAsError=true` compilation PASSED.
- `originalAdjointColorMatrix_normalizedPauliTrace` and `originalAdjointColorMatrix_pauliTrace` printed accepted axioms `propext`, `Classical.choice`, `Quot.sound`; neither used `sorryAx`.
- Independent consumer `diagnostics/BFSSIBIG0CPauliTraceIndependentConsumer.lean:41:44` FAILED with `unexpected token 'ᴴ'; expected ')', ',' or ':'`.
- This was an uncorrected **identity-case** source gauge expression `((1 : GaugeGroup 2) : ColorMatrix 2)ᴴ`. Earlier repairs in R2 replaced only expressions whose cast was `(g : ColorMatrix 2)ᴴ`, leaving this third test case behind.
- The downstream identity test at lines 37-46 was audited against the G3A source theorem `adjointColorMatrix_one` and its rewrite orientation: the trace RHS equals `Matrix.one_apply B A`, and `h.symm` has the required direction. This is a source exact consumer, not a surrogate mathematical model.
- **R5 bounded repair:** replace only that remaining identity test's `ᴴ` with explicit `.conjTranspose`. Add a preflight guard asserting neither G0C source nor consumer retains an unscoped `ᴴ` token. Update consumer blob pin. Do not edit theorems, donor source or mathematical proofs.
- [R4 diagnostic artifact #14174608142](https://github.com/etblink/math/actions/runs/43746595679/artifacts/14174608142), GitHub-reported ZIP SHA256 `63193da4d04856f59f9920d020b4b75eb3427f8088e880058ec82332d107b20a` (not downloaded/rehashed).
- Stop rule applied: exact source and consumer notation reviewed, and a static preflight regression check added before trying R5; no speculative tactic changes. If R5 hits a substantive consumer/type mismatch, record the typed goal and do not rework proof architecture blindly.
- No edits to unified integration or main.
