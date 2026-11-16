# P0B R2 — RED confirmed, exact evidence preservation in progress

Run https://github.com/etblink/math/actions/runs/43958703251, tested d235bf1bba640ffa6b3caa4fbea9b33cbe86b103, job 133620014176. Preflight and Lean 4.34.1 / pinned Mathlib restoration PASS. All predecessor modules through P0A build; P0B fails at target 8964/8964. This is not a successful cold build.

First causal error: P3M4LB1P0BOriginalSource48SkewPlaneNormalization.lean:35:37, type mismatch at sub_smul _ _ _. The expected expression is the complex scalar action on Op; the elaborated theorem application retains unresolved metavariables. The existing accepted LB1C1 hterm uses explicitly typed complex coefficients and an explicit original Fock operator argument.

Warnings at 45:15 and 46:15 deprecate if_pos / if_neg in favor of ite_eq_left / ite_eq_right. Both new source root reports contain compiler-recovery sorryAx. Source warning-as-error pass and independent consumer are NOT REACHED; no root is qualified. There is no timeout or counterexample in this evidence.

Complete decoded job log: research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P0B_R2_43958703251_complete_job.log, Git blob be309e080a96e1e2f72af4560326ad9c1a970eb0.

Original GitHub artifact 14272854442, 3745 bytes, provider SHA256 46b201bd2b46e29a3650d3982fd9e605d9cd54ede30f8aca4019d7887a9e7ec2. Archive was downloaded through the GitHub connector; direct local byte inspection is unavailable because this session has no executor. A bounded hosted preservation job will retrieve the same original ZIP, independently rehash its bytes, test ZIP integrity and expose its base64 bytes for exact repository preservation. Until that check completes, checkpoint status is BLOCKED, qualification false; original ZIP hash is a provider claim rather than a completed independent check.

## Prospective bounded R3 correction

After preserving and rehashing the complete original ZIP, replace only sub_smul _ _ _ by sub_smul (a : ℂ) (b : ℂ) x and replace the two deprecated conditional lemma names with ite_eq_left / ite_eq_right. Preserve both theorem statements, independent consumer bytes, all ten donor/input pins, original data and constants, warning/axiom policy and resources. Update source/workflow blob pins, use this exact pre-gate receipt commit as R3 contract, then launch a fresh strict run. P0A R4 remains last qualified. This is the first P0B Lean proof failure; R1 was an administrative preflight failure, so two analogous native failures have not occurred.
