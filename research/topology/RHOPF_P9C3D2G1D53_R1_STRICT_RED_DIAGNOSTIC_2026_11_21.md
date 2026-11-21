# RHOPF-P9C3D2G1D53 R1 — strict RED, detached standard-Circle SMul instance scope

**Pacific date:** 2026-11-21. **Disposition: STRICT RED; D53 NOT QUALIFIED.** Original [run #44957165588](https://github.com/etblink/math/actions/runs/44957165588), job `137007723495`, attempt 1, exact tested commit `69d85d9a3e1877ef5f59804299d0329669da6ae1`.

## Original evidence
Original [artifact #14728850825](https://github.com/etblink/math/actions/runs/44957165588/artifacts/14728850825) independently downloaded. Its SHA-256 is `ccfa58dd06c2c5368de16b845a71557f46a617545e9c70253ee067d5112d21d8`, matching the original GitHub published artifact digest. ZIP integrity PASS; five members; embedded `exact-tested-commit.txt` exactly `69d85d9a3e1877ef5f59804299d0329669da6ae1`. Archive contains original native Lean diagnostic output and 9,100-job accepted dependency build.

## Reproducible failure
- Frozen original Gamma9 SHA/contract preflight PASS and independent signed-permutation integer fixture PASS.
- Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 9,100 dependency jobs PASS.
- D53 first theorem `relationalEuclideanUnitCircleAction_continuous` elaborated and its native axiom report is exactly `propext`, `Classical.choice`, `Quot.sound`. It proves the exact D49 standard unit-C² action is jointly continuous.
- D53 second theorem `relationalEuclideanUnitCircleContinuousSMul` RED at source line 49: `failed to synthesize ... SMul Circle {y // ‖y‖ = 1}` on `refine ⟨?_⟩`. Followed by `No goals to be solved` at line 50. Its native axiom report has `sorryAx`. Independent D53 consumer SKIPPED. **The overall R1 theorem remains unqualified.**
- Root cause is local typeclass-scope elaboration for detached D52 `MulAction Circle` when constructing the Prop-valued `ContinuousSMul` certificate, not a failure of the already-completed standard continuity theorem or source Gamma9.

## Bounded R2 repair
Inside the second theorem proof only, bind exactly `relationalEuclideanUnitCircleMulAction` as a local non-instance `let : MulAction Circle {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}` before the continuity-class constructor. The theorem's TYPE still locally fixes the detached D52 instance. This follows Mathlib's pattern for Prop-valued instance-transfer theorems and avoids redundant `letI` triggering `linter.style.haveILetI` under warnings-as-errors. Keep the same two D53 theorem statements, first theorem and imported consumer bytes, pinned original source, all axioms and workflow checks untouched except for exact D53 source SHA pin. No style warnings disabled.

R2 must separately pass original strict native CI, independent imported consumer, exact allowed axiom checks, and independent archive ZIP hash/integrity/commit inspection. If RED, preserve its negative diagnostics. No global instances installed; no source-Q Circle action continuity, quotient topology, CP¹/S² Hopf, Chern or physical BFSS hopfion yet. `main` and accepted D45–D52 unchanged.
