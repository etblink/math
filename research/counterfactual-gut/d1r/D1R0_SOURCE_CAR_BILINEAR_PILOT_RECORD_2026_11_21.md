# D1R0 — original-source CAR/gauge-bilinear strict pilot, launch and first-causal diagnosis

**Date:** 2026-11-21. **Research branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Disposition (as of this checkpoint):** One strict **PRE-FLIGHT RED**, one corrected strict run **LAUNCHED / NOT YET QUALIFIED**. No spectral/Hopfion/GUT conclusion. No original BFSS sources, main, unified integration, or live RHOPF changed.

## Why this bounded gate

D1P/D1Q's mathematically described 48-Majorana Gaussian projector is not yet a Lean-checked `Fermion 2` operator. Rather than beginning with a degree-24 polynomial, Kato transport, smooth quotient or original closed form all at once, D1R0 isolates source original `pairedAlgebraData.theta` CAR and the **ordered theta-pair gauge intertwining** already implied by the literal `pairedGaugeData.fermion_adjoint` law.

This is the minimum useful bridge to a subsequent quadratic-operator coefficient pushforward theorem. The source root `originalCARQuadratic` is the literal complex-linear operator on original `Fermion 2`, with coefficient `(-i/2)` times the full 48×48 theta-theta double sum (matching `H_C=-(i/4) Σ C_ab γ_aγ_b` for `γ=sqrt(2)θ`). The initial gate only checks its zero-coefficient specialization; it **does not** prove Hermiticity, rank-one, polynomial projectors or spectrum.

## Original and independent source targets

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1R0OriginalCARGaugeBilinearPilot.lean`, original SHA-1 Git blob `b141e620bc35cdfaae2795aa3f305cace157c5e5`.
- `lean/diagnostics/BFSSD1R0OriginalCARGaugeBilinearConsumer.lean`, SHA-1 Git blob `80ac7d3170746b77c99782d056bbf2fc63a33a90`.
- Exact source roots: `originalThetaCAR`, `originalThetaPair_covariant`, `originalCARQuadratic_zero`. Independent consumer roots: `exact_original_theta_car`, `exact_original_theta_pair_gauge`, `exact_original_quadratic_zero`. All roots have `#print axioms`; no `sorry`, `admit`, new `axiom` or `unsafe`.
- Frozen original dependencies include `GaugeCore` blob `e4990dadf1d8bde849e351467282ab3f14989c3b`, paired G1A `152204ef15a6569534e0503824a697cb9ae8e4ce`, G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Workflow: `.github/workflows/bfss-d1r0-original-car-bilinear-strict.yml`; frozen dependency preflight, cold native Lean build, warning-as-error source and independent consumer, allowed-axiom report parser, unconditional artifact preservation. No change to any preexisting workflow.

## R1 — exact first-causal STRICT RED, preflight only

[GitHub run #44958704889](https://github.com/etblink/math/actions/runs/44958704889), tested commit `92c6d9a57df539b603a65295d38186338495a5d7`, first attempt, job `137012467893`: checkout PASS; strict preflight **RED** at Python line 32. The static token checker expected the literal string `pairedGaugeData.fermion` in the new Lean source, whereas the actual source uses the definitionally identical local abbreviation `G.fermion g`. This is an overrestrictive textual-guard mismatch—not a mathematical proposition or Lean failure. Earlier pinned original Git blob checks and import/proof-root checks passed. Mathlib setup, Lean native source compilation, and independent consumer were **not run**.

Archived original evidence [artifact #14728751866](https://github.com/etblink/math/actions/runs/44958704889/artifacts/14728751866), GitHub-reported ZIP SHA-256 `715c6fb734ef43307fb05ceae6bc18dc77b9049e7005fd5986c266b4b49d6b69` (650 bytes). No source theorem was qualified.

## R2 — controlled preflight-only correction

Only the workflow's static text check was changed from `pairedGaugeData.fermion` to the source's literal `G.fermion g`; original Lean files were **byte-identical to R1**. Workflow repair commit `08054d640561aab0815da86d93d102ba58970bea`, new workflow Git blob `a21354d217e1cc7ffb2f7cd3e2ffe882be098d20`.

[GitHub run #44958805038](https://github.com/etblink/math/actions/runs/44958805038), tested at this corrected commit, **launched**. At this checkpoint the runner was in checkout; its strict qualification has **not** been observed. Follow the exact job logs, six source/consumer axiom reports and original CI archive, and promote only if all strict checks pass.

## Next dependency gates (not launched)

If D1R0 qualifies: (1) prove finite coefficient pushforward for the original source 48×48 theta-quadratic using the two-theta covariance; (2) transport through the **source** `originalCARQuadratic`, prove skew-C self-adjointness and polynomial projector covariance; (3) prove rank-one trace in original carrier; (4) only then Kato section and `pairedGaugeData.invariantCore` compact support and normalized form bound. Do not import prospectively unqualified Clifford-equivalence modules merely because their source files exist.

**Stop rule:** do not count an in-progress run or RED as a mathematical theorem. After two native Lean REDs on a proof target, stop and change proof architecture; preserve all negative knowledge. D1F and D1K1A strict RED histories remain frozen.

## R2 — native strict RED, exact first-causal evidence

Run [#44958805038](https://github.com/etblink/math/actions/runs/44958805038), tested commit `08054d640561aab0815da86d93d102ba58970bea`, job `137012773505`, conclusion **FAILURE**. Original source pinned preflight PASS; Lean 4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restoration PASS. First native Lean error `D1R0OriginalCARGaugeBilinearPilot.lean:77:47: unsolved goals`:

```lean
⊢ (-Complex.I / 2) • ∑ x, ∑ x_1,
    0 • (M.theta x.1 x.2 * M.theta x_1.1 x_1.2) = 0
```

The original `simp [originalCARQuadratic]` did not simplify nested zero scalar multiples and sums. The first two source theorems COMPILED with permitted axioms only: `originalThetaCAR` and `originalThetaPair_covariant` both report `[propext, Classical.choice, Quot.sound]`. Third `originalCARQuadratic_zero` has **sorryAx** and is NOT accepted. Cold build stopped; independent consumer was NOT RUN. This is a tactic failure, not a CAR counterexample.

Native artifact [#14729665393](https://github.com/etblink/math/actions/runs/44958805038/artifacts/14729665393) preserved unconditionally: GitHub digest `sha256:7d896e1c24da07e67a42e8618d47c6b0491ceddb7d97f3733e77357a9d26e8c0`, size 10,759 bytes.

**R3 controlled second-native attempt:** change only the third theorem proof to explicitly unfold `originalCARQuadratic`, apply `zero_smul` to the inner terms, and close the finite zero sums. Do not change the successful roots, consumer, dependency pins or workflow. If the second NATIVE compilation fails, STOP and preserve negative knowledge instead of blindly launching R4. Until all independent checks pass D1R0 is RED.

## R3 — targeted one-theorem repair, second native qualification attempt

The only Lean change in research commit `00fcf97a70b52742b17cce60a0f788fe876da361` is within `originalCARQuadratic_zero`: replace `simp [originalCARQuadratic]` with an explicit `unfold originalCARQuadratic`, `simp only [zero_smul]`, then `simp`. Original source file Git blob changed from `b141e620bc35cdfaae2795aa3f305cace157c5e5` to `171dee12e60414e24a2fd25e28de7b2ef14bb7ba`. Original two preceding theorem bodies, the entire independent consumer and the exact strict workflow are unchanged.

[Run #44960222120](https://github.com/etblink/math/actions/runs/44960222120) is the newly started native gate at exact tested commit `00fcf97a70b52742b17cce60a0f788fe876da361` and should not be labeled GREEN until cold compilation, independent consumer, three+three source/consumer axiom checks, exact pins, and archive all qualify. The run launched automatically via the existing isolated-branch workflow trigger. If this attempt is another native RED, honor the two-native-RED stop rule. No additional repair/retry authorized automatically.
