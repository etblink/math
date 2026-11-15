# HARDY-G10 R2 — source clean, four native control proof tails fail

Date: November 15, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43700520096](https://github.com/etblink/math/actions/runs/43700520096), attempt1, tested `232c40b89bbdc3579f9ba59f5063967351c644cd`, job `132770419918`, completed with failure. G9 remains accepted.

## Verified result and first causal failures

R2's compiler-recommended lemma rename resolves R1's deprecation failure. Preflight163, early helper1+3 audits, cold9,085-job build and fresh strict original source PASS. All six source reports use only standard axioms. The complete native consumer is executed for the first time.

Four native proof tails fail:

| Control | Location | Exact issue |
| --- | --- | --- |
| Positive coordinate coefficient +1, example7 | 59:66 | Simplification leaves `not (j = i)` under `hij : not (i = j)` |
| Negative coordinate coefficient -1, example8 | 68:12 | `PiLp.single_apply` is unused in `simp_all` |
| Swapped plane coefficient -1, example10 | 78:67 | The same reverse-inequality goal remains |
| Distinct color zero, example12 | 93:12 | `PiLp.single_apply` is unused in `simp_all` |

All twelve requested root reports are standard-axiom-only; no sorryAx, recursion or resource failure appears. Failed anonymous examples still make the consumer fail. Final scope/qualification is not reached. Do not infer acceptance from the clean named reports.

## Exact evidence

- Source `59aaed1da894e8b91b2df51eda6f47a37cf4c517`; consumer `ed4507504ac58eef9bcb4299bb8092c9b9679b75`; workflow `5e126c42ae799170ee6d4aeca33172747eaa3fc4`.
- Manifest SHA256 `cb3bf548628c0368cc648a905a7969308b2a760f7e4eb7d1af1c3df6f829aa62`,163 recursive pins. Exact tested SHA and local source/consumer bytes checked against manifest.
- Artifact `14156322640`,22,078 bytes; downloaded and independently rehashed SHA256 `4c2836a467aebc33cd0b2ae2ed5d96f0c8d43a8106909d68479f218262284c21`, matching GitHub's digest. [Complete thirteen-file ZIP](diagnostics/P3_AUX_HARDY_G10_R2_43700520096_evidence.zip); [complete native log with four failures and twelve reports](diagnostics/P3_AUX_HARDY_G10_R2_NATIVE_INEQUALITY_AND_UNUSED_SIMP_43700520096_2026_11_15.txt).

## Two-red review and bounded decision

R1 was a deprecated source lemma; R2 resolves it and reaches a new, previously untested consumer stage. The failures do not contradict the source CAR identity. They expose two finite control-proof issues: symmetry of inequality must be supplied explicitly, and unnecessary simp arguments must be removed. No repeated native conversion or resource boundary has occurred.

[R3 preregistration](P3_AUX_HARDY_G10_R3_PRE_GATE_EXPLICIT_NATIVE_CONTROL_TAILS_2026_11_15.md) freezes the now-clean source. Append `exact Ne.symm hij` after the existing simplification in examples7/10; remove only the flagged simp argument in examples8/12. Keep all twelve statements and the other eight proof bodies fixed. If the same native control boundary recurs, stop full-gate retries and isolate the exact residual before further changes.
