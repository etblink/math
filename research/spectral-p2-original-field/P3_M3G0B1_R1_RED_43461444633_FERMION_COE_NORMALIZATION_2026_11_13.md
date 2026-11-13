# P3-M3G0B1 R1 — strict RED: final source gauge-equivalence coercion mismatch
**Recorded:** 2026-11-13 Pacific. **Verdict:** real Lean cold-build RED, M3G0B1 NOT mathematically qualified. Original M3G0B0 remains accepted.

## Exact immutable strict evidence
- [Run #43461444633](https://github.com/etblink/math/actions/runs/43461444633) **completed/failure**, attempt 1, immutable tested SHA `f163921f3363be9154a2ffbe0d3c10e94d0c8e75`; failed job #132009112218, `original-source-operator-and-consumer`.
- Successful 463-pin original source+consumer preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore. Failure in `Cold original bounded-operator source, real Fock consumer and root axioms`. Consumer and source axiom audit did not complete and cannot qualify the new gate.
- First causal Lean error: `P3M3G0B1OriginalGaugeAEFullOperator.lean:78:2` `Type mismatch: After simplification, term hx i has type … pairedGaugeData.fermion g (…) but is expected … ↑↑(pairedGaugeData.fermion g) (…)`. In the **third and final** B1 theorem, `simpa only [ContinuousLinearMap.comp_apply] using hx i` did not normalize the source fermion action's coercion through `toContinuousLinearEquiv.toContinuousLinearMap`.
- First two B1 source declarations compiled and `#print axioms` gave only `propext`, `Classical.choice`, `Quot.sound`. Third had `sorryAx` due to the failed elaboration, so B1 is unequivocally RED.
- Preserved artifact #14057579425, 73,689 bytes, SHA256 `afc1ccc068640839a6941a719b3089a1bc35692df69af96bc0f7c5e036c4db65`.
- Frozen R1 source blob `e923a019ceac801b981e3fd22920f1cb5c0458f3`; frozen independent real-Fock consumer blob `42e12c82dcf854fa0be0c73dbd38b0fd13f12692`. No failures in the actual M2B2B0 injectivity lemma or `Filter.eventually_all` finite-index intersection were observed.

## Proposed minimal R2 experiment
- Change **only** the final theorem's last proof step from `simpa only [ContinuousLinearMap.comp_apply] using hx i` to `simpa [ContinuousLinearMap.comp_apply] using hx i`. The default `simp` set should normalize the pointwise coercion of `pairedGaugeData.fermion g` through its exact continuous-linear equivalence. This is a **testable tactic hypothesis**, not a presumption of success. If R2 RED, inspect the precise coercion type, source functor/continuous linear map and add only the verified simp lemma or source-specific `change … at` transformation.
- No changes to any theorem statement, mathematics, original operator-valued Lp norm, finite common a.e. condition, original source bosonic inverse, HS-column equivalence, original gauge action or accepted proof. Independent consumer remains byte-identical.
- Update only the B1 source blob pin in two workflow locations; keep 463 exact deduplicated paths, frozen old 459 source + 2 accepted B0 pins, immutable baseline `c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5`, 96-deep checkout and Lean 4.34.1 unchanged.
- On R2 GREEN verify cold build, independent original-Fock consumer and all three audited roots before acceptance. On RED preserve first new causal failure and repair narrowly. No promotion of basis independence, original operator-norm isometry, M3G0C physical fixedness, nonzero physical witness, closed Hamiltonian, spectrum or mass gap.

**Project Lead:** preserve the real RED before source edits, then do one bounded R2 tactic preflight. M3G0B0 #43422546945 is the last accepted mathematical proof.

## R2 one-tactic experiment staged
- Exact R1 source `e923a019ceac801b981e3fd22920f1cb5c0458f3` → R2 `095e63582a5f04a9dd2be0a192fb42586d97dd2f`, only final theorem last line `simpa only [ContinuousLinearMap.comp_apply] using hx i` → `simpa [ContinuousLinearMap.comp_apply] using hx i`. This permits qualified `simp` coercion normalization while keeping the original left fermion action and all three theorem statements unchanged.
- Original genuine Fock independent consumer stays frozen at `42e12c82dcf854fa0be0c73dbd38b0fd13f12692`. Workflow changes only the two exact source blob references; new workflow blob `b3a7a888b89908a170aa4d1a690b11ef5f5ba9aa`. 463-path predecessor/new pin inventory and pinned Lean/Mathlib stay unchanged.
- **R2 is an explicit falsifiable experiment**: no proof is qualified by this staging. If the source fails again, retain the first actual Lean diagnostic before any new tactic change.
