# V10H F10N Gate 2 RED — unreachable extra tactic; Gate 3 exact source repair

Date 2026-11-01 UTC, corresponding 2026-10-31 PDT. Research branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## Immutable strict Gate 2 result
- [F10N Gate 2 #41282891158](https://github.com/etblink/math/actions/runs/41282891158) completed FAILURE, attempt 1, exact SHA a8ee42c9b575f667fb6a6098f44be21a938bd93b, job 124778244795, F10N source blob 5da6a2fe82c520f55abe7fb442c674cc7b051999.
- [Immutable Gate 2 artifact #13074561398](https://github.com/etblink/math/actions/runs/41282891158/artifacts/13074561398), SHA-256 740dc1d23923e65e26d37c51dda4959eeb8ec0a7d03acfc07321783e1e11ba00.
- Exact original public gamma and F9/F10E–F10M ancestor hashes preflight PASS, pinned Lean v4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored PASS, qualified F10M full source ancestor rebuild PASS.
- Fresh F10N -DwarningAsError=true compiler FAILED at line 81 col 27: `this tactic is never executed` (linter.unreachableTactic). The zero-vector second branch ran `simp [hQ] at h ⊢ <;> exact h`, where the `simp` sequence ALREADY solved the entire goal; the trailing `exact h` was unreachable.
- All four F10N original theorem `#print axioms` outputs mention only `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`. Nevertheless Gate 2 is RED and independent exact four-declaration types/root axiom audit SKIPPED, so all four F10N declarations remain UNQUALIFIED.

## Causal contrast, previous red
- Gate 1 [#41282125837](https://github.com/etblink/math/actions/runs/41282125837) was RED because at the same original source line the `simpa [hQ] using h` proof was rejected by linter.unnecessarySimpa (`try simp instead`). Gate 1 artifact #13074091748, sha256 6227873a4fe428353583206aad7bce2ef32f8021987a6af4cf2d9dcfd0296637. Gate 2 respected its suggestion but included an unnecessary fallback tactic. This was our proof-edit issue, not a mathematical or pinned API failure.
- Avoid treating the axioms prints as proof qualification when warning-as-error compiler fails. Do not disable either linter, escalate resources, or change theorem statements to bypass the failure.

## Gate 3 minimal fix, still pending
- In the exact original F10N file, delete ONLY the unreachable suffix ` <;> exact h` in the universal determinant zero-vector negative-branch. The source now reads `· simp [hQ] at h ⊢`. All accepted ancestry, all four F10N theorem statements, all other proof branches and original SpinIndex/gamma basis remain bit-identical.
- Update the F10N strict workflow exact Git blob pin and mandatory preflight to require `simp [hQ] at h ⊢` without the unreachable suffix. Keep full pinned dependency restoration, source hashes, fresh warning-as-error, four independent exact theorem type/axiom audits and always-uploaded compiler logs.
- This is a source-exact proof repair: F10N becomes accepted ONLY when new strict gate PASS and all four independent declaration-type and root axiom checks are verified against that exact commit.

## Other frozen results and open hypotheses
- F1–F9 and F10E–F10M remain QUALIFIED, with genuine original gamma spectral 8/8 eigenvalue multiplicities, full original product decomposition and its determinant product bridge. No F10N original positive determinant theorem accepted yet.
- Earlier original F10 private table Gates #41266215820, #41266892206, #41267510559, F10D import all #41268424166, F10E deprecated if_neg #41269330982, F10F invalid entrywise matrix sum #41270798888, and F10H missing WithLp #41273184444 remain preserved RED evidence.
- Global Spin(9) character, paired SO(48) covariance, Spin(48) lift/cover and physical BFSS spectral claims stay separate OPEN obligations. No main or upstream publication authorization.
