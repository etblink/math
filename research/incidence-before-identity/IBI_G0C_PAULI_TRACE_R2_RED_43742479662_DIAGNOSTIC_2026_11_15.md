# IBI-G0C Pauli trace — R2 RED diagnostic, preserved

**Date:** 2026-11-15 Pacific.
**Research branch:** `research/bfss-incidence-unified-20261114`.
**Verdict:** RED_NOT_QUALIFIED; no G0C surjectivity or Pauli trace acceptance.

- [Strict run #43742479662](https://github.com/etblink/math/actions/runs/43742479662) at exact tested commit `c36d725f3b24004272f8ab133067867b4fbdfa3a`; job `132898455386`.
- Checkout, strict preflight, Lean 4.34.1 / pinned Mathlib restore and cold compilation of all original donor dependencies passed. R1's `ᴴ` syntax errors were resolved by exact native `.conjTranspose` spelling.
- New native source `IBIG0CPauliTrace.lean:51:4`: `exact_mod_cast` left the source `ℝ` lemma `pauliScale ^ 2 = 1 / 2` while the goal required the complex-coerced statement. Original `SU2ColorCrossProbe.lean` already proves exactly this conversion using `simpa using congrArg (fun t : ℝ => (t : ℂ)) pauliScale_sq`; reuse that source-exact pattern.
- At `:47:57`, final normalization left the scalar ring equality `(1 / 2) * trace.re = trace.re / 2` unsolved; close explicitly with `ring` after existing normalizations.
- `originalAdjointColorMatrix_normalizedPauliTrace` printed standard axioms only; `originalAdjointColorMatrix_pauliTrace` was contaminated by `sorryAx` as the result of the proof failures. The independent consumer was not reached. No qualified bridge theorem was obtained.
- [RED artifact #14173671277](https://github.com/etblink/math/actions/runs/43742479662/artifacts/14173671277); GitHub-reported artifact ZIP SHA256 `fc0d12dbbb5099fa86082623a26b72e4aa013db13c24adaebb6ef810312a4549` (not locally rehashed).
- R2's failure is **different** from R1's parser-scoping failure: it is a local type-coercion and scalar-normalization proof error, not another identical source/consumer error.
- R3 candidate is a tightly scoped proof-script repair of those two lines only, plus workflow source-content hash update; no theorem statement, import, external donor, original source, or consumer changes.
- Preserve existing stop rule: if the same type of proof failure repeats, stop and perform an explicit proof-architecture/typed-goal audit; no automatic broad proof changes. Surjectivity remains open.
- Unified integration and main untouched.
