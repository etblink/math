# P0B R3 — STRICT GREEN accepted

Date: 2026-11-16 Pacific. Internal machine-checked gate qualification; no peer review or independent human mathematical review is asserted.

## Exact execution and immutable bytes

- Run: https://github.com/etblink/math/actions/runs/43962066769
- Exact tested commit: becb76924cabe59681dade936eda971ec1254ee3
- Job: 133631788981; all job steps PASS.
- Source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P0BOriginalSource48SkewPlaneNormalization.lean, Git blob 1c47a8645bb8ae18110f29083c95887b8a0e3a15.
- Independent consumer: lean/diagnostics/BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalizationIndependentConsumer.lean, Git blob 056d7692125f723c91e1d4a50540b9bcfaaf09da.
- Strict workflow: .github/workflows/bfss-m4-lb1p0b-source48-skew-plane-normalization-strict.yml, Git blob 9192b1045aa478c2f03f3635d21d150dc8afdfb1.
- Lean 4.34.1; Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Original donor/input pins unchanged.

## Qualification evidence

Exact source/donor/toolchain/checkpoint preflight PASS. Cold original source build 8964/8964 PASS. Separate warning-as-error source and independent consumer compilations PASS. Exactly two source + two consumer root reports, each depending only on propext, Classical.choice and Quot.sound. All three independent consumer controls compile: coincident-label zero, reversed-plane sign and concrete distinct paired-label half-product. The checkpoint positive/six negative controls and auditor positive/six negative controls PASS. No errors, sorryAx or unallowlisted source/consumer warnings. Existing package-local-change notices remain governed by the unchanged explicit allowlist.

Executed final marker: BFSS_M4_LB1P0B_ORIGINAL_SOURCE48_NORMALIZATION_2_SOURCE_2_CONSUMERS_3_CONTROLS_STRICT_GREEN.

## Complete original evidence preserved

Original GitHub artifact 14273998605, 3944 bytes. ZIP SHA256: 4b106db2f5be4ee3717c74616f96a99633b3872d2bc3d678346c1c29127595cf.

Original ZIP: research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P0B_R3_43962066769_evidence.zip, Git blob 8a1223ca0f7f9aa68d03bbf063d0b37fd4b17b9e. Five entries: tested-commit.txt, preflight.log, cold-source.log, source-axioms.log and consumer.log. Complete original proof job log: research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P0B_R3_43962066769_complete_job.log, Git blob b25374a7c879b6afe178255ec9a6ab98f0566e1a.

Separate hosted preservation/reaudit run https://github.com/etblink/math/actions/runs/43965370829, job 133643294316, executed at fae9cd7387f777a5f49dde1261453e2f6bba6f15. It retrieved the original ZIP, independently rehashed it against the provider digest, checked ZIP integrity and tested SHA, and reaudited the archived cold/source/consumer logs with the frozen axiom/warning policy. This separately executes evidence integrity and log checks; it is not an independent mathematical review. Per-entry hashes, all four actual root reports and the complete preservation job log are retained beside the ZIP. No archive reconstruction or partial excerpt substitutes for original bytes.

## Accepted mathematical scope

For arbitrary original Source48Label i,j:

K(E i j) = (1/4 : ℝ) • (Γi * Γj − Γj * Γi).

For i ≠ j:

K(E i j) = (1/2 : ℝ) • (Γi * Γj).

All operators are the original Fermion 2 continuous complex-linear operators, with the unchanged real scalar bridge, normalized original gamma CAR and K coefficient 1/4. The arbitrary-label result includes coincident labels; the half-product result retains its distinctness premise.

## Negative knowledge and claim ceiling

R1 #43957825299 preflight-only HEAD^/shallow-checkout RED and R2 #43958703251 underspecified sub_smul/deprecated-lemma RED remain preserved. R3 changes exactly three source expressions: explicit complex sub_smul arguments and current conditional lemma names. Consumer, theorem statements, donors, resources and acceptance policy are unchanged.

P0B becomes last qualified; P0A, LB1C1 and LB1L2 remain accepted. No full bivector Lie bracket, Spin9 Fock-vector representation, Hamiltonian symmetry of all so(48), gauge/closed-charge covariance, G16, Hardy/fidelity or spectral existence follows from this gate. Edition 0.8 stays a dated consolidated snapshot.

Next prospective bounded finite gate: research/spectral-p2-original-field/BFSS_M4_LB1P1_PROSPECTIVE_FOUR_MAJORANA_CONTRACT_2026_11_16.md. Four-Majorana commutator algebra before plane brackets/linear extension. Retain the independent equal-norm square-difference/Gauss energy route as comparator. No new Lean source or expensive strict run is launched by this acceptance record.
