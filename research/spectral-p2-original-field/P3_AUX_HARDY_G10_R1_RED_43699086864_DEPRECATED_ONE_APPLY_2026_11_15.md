# HARDY-G10 R1 — source proofs elaborate, deprecated lemma fails strict compilation

Date: November 15, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43699086864](https://github.com/etblink/math/actions/runs/43699086864), attempt 1, job `132765991969`, tested `2d7fabb4c83808c46cf0401cbd48e69a03da14fe`, completed with failure. G9 remains accepted.

## First causal failure

Preflight163, pinned toolchain restoration, early helper1+3 audits and the full cold 9,085-job build PASS. All six source roots elaborate and report only propext/Classical.choice/Quot.sound, both during the build and in fresh source.log. No unsolved goal, sorryAx or recursion failure appears.

The build emits a deprecation warning at source78:28. The fresh `-DwarningAsError=true` compiler rejects it: `ContinuousLinearMap.one_apply` is deprecated; use the root lemma `one_apply_eq_self`. The native consumer and final strict scope audit are not executed. Clean source proof reports do not qualify G10 without those stages.

## Exact evidence

- Source `911ff8824b9c95005511aed22f25da4d0edb97f0`; complete consumer `ed4507504ac58eef9bcb4299bb8092c9b9679b75`; workflow `7ac3353e6415918cd08ae2c0c3e19202dd5abfe4`.
- Preflight163 manifest SHA256 `9f8d89f87571dba21fd345fd730ea4c062f78a8d3f50236091407fd8ec411ac8`.
- Artifact `14156365431`, 21,507 bytes; independently downloaded and rehashed SHA256 `de7411a7a7e429a43e0252fa611a915b9225eeb13f93cd5d50a4feca09f322fe`, matching GitHub's digest. [Complete twelve-file ZIP](diagnostics/P3_AUX_HARDY_G10_R1_43699086864_evidence.zip), [fresh first-causal source log and all six reports](diagnostics/P3_AUX_HARDY_G10_R1_SOURCE_DEPRECATED_ONE_APPLY_43699086864_2026_11_15.txt). Tested SHA, manifest and source/consumer pins independently checked.

## Bounded decision

Follow the compiler's explicit rename in the vector-evaluation proof; preserve every declaration, explicit statement, all other proof text and the entire native consumer. Change only the workflow's expected source hash. [R2 preregistration](P3_AUX_HARDY_G10_R2_PRE_GATE_CURRENT_ONE_APPLY_LEMMA_2026_11_15.md) must be committed before repair. No warning suppression or budget increase. If the replacement exposes the same boundary again, isolate it before another full retry. All physical and spectral conclusions remain outside G10.
