# GM5E10 R1 pointwise rewrite failure and R2 repair

[Strict run #45231545024](https://github.com/etblink/math/actions/runs/45231545024) tested `acca603a28094254b02314a54e989c2eef639e37`, attempt 1, job `137892099662`. Frozen-source preflight and pinned Lean 4.34.1 and Mathlib restoration passed. The build reached the final target, job 9,170 of 9,170.

In three proofs, `integral_mono` left pointwise goals written as applications of lambda expressions. The first failure at 28:6 was a rewrite by `realCutoff_norm_sq` in the cutoff norm bound. The same match failed at 45:33 in the ball probability bound. At 58:8 the support rewrite for `f x = 0` failed on the weighted norm bound for the same reason. The squared native charge bound reported only the permitted axioms. The main theorem's diagnostic report included generated `sorryAx` and the paired independent consumer was never reached.

The [original provider artifact #14850445142](https://github.com/etblink/math/actions/runs/45231545024/artifacts/14850445142) is preserved as an [unmodified ZIP](evidence/gm5e10-r1-original-red.zip). Its 19,853 bytes hash to `11ac818ad843f35008f546abea165875cf93f67e5ebb3f027ec8a39ca8984047`, matching GitHub's metadata and upload log. All six ZIP members passed CRC. The tested SHA, source, consumer, workflow and Lean environment hashes match the tested checkout. See the [evidence manifest](evidence/gm5e10-r1-original-red-manifest.json) and [complete job log](evidence/gm5e10-r1-original-red-complete-job.log).

R2 makes the pointwise goals explicit using three definitional `change` steps immediately after `intro x`. The cutoff, ball-indicator and support rewrites then see the evaluated functions. The theorem statements, original imports, independent consumer, strict workflow and resource limits carry forward from R1. The radial partition remains a hypothesis of the criterion. R2 awaits strict verification.

A local Lean 4.34.1 check passed for the two repaired integral helpers on the original cutoff definitions and for the repaired pointwise support inequality. The full native module and the independent paired consumer remain subject to strict CI.
