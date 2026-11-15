# G12 R2 verified RED — zero-scalar rewrite and two-red review

November 15, 2026 Pacific. [Strict #43730966120](https://github.com/etblink/math/actions/runs/43730966120), attempt1, tested `2eea49ab254b0c328e130b5a646bf881acd7d19d`, job132863074490. Source `80ea179d9e2afa223bda77ce0d62af6ab61db422`, helper `2c0b07a603a94ad18342a53a5d88eaad5345cb5d`, consumer `13f5557809b7ecce2dfeb60d2988febcd85bf529`, workflow `a90a4f2b04623abdfe7b1db860b3716f0d60d570` match the checkpoint and measured pin manifest.

166-pin preflight PASS, manifest SHA256 `2e93cecf32df8b1e6687cbb0f8db80b082c71dbc16531e42de664a6da8b89995`. Early helpers1+3+1 PASS; all three original embedded auditors independently replayed successfully on full downloaded logs. The cold source build fails only at source92:36: after eliminating the off-color conditional, rewrite zero_smul cannot match the displayed 0-scalar action on the theta product. This is a proof elaboration/rewrite boundary; the log does not establish whether namespace resolution or scalar inference causes it.

R2's ordered expansion now reports standard axioms, as do the kinetic equality, definition and contracted-sum root. The bilinear and evaluation roots still contain recovery sorryAx and are not accepted. Fresh strict source and all native consumer controls were not reached. Neither source.log nor consumer.log exists. The cold target total9088 is not a successful build claim.

[Complete 14-file artifact](diagnostics/P3_AUX_HARDY_G12_R2_43730966120_evidence.zip):14169267067,23369bytes; independently rehashed SHA256 `62fd68bee2d6cbfbc947cea7c74f585c155f406ede48db9e9e2f746bc0c55a3f`. [Audit](diagnostics/P3_AUX_HARDY_G12_R2_RED_43730966120_AUDIT_2026_11_15.json). [Verbatim causal excerpt](diagnostics/P3_AUX_HARDY_G12_R2_ZERO_SCALAR_REWRITE_43730966120_2026_11_15.txt).

## Two-red architecture review and stop

The isolated finite coefficient helper succeeded twice. Explicit ordered expansion removed R1's first failure. Both attempts still meet the off-color zero-action boundary: R1 broad simp left the zero action untouched; R2 explicit rewrite did not match it. Further full G12 source/consumer retries are blocked. Freeze the full source/helper/consumer/workflow. Isolate zero action at two levels before any R3: Mathlib-only generic complex continuous-linear products and actual original carriers/import context. Inspect unqualified/root-qualified lemma types and complex scalar typing; test an explicitly typed proof and selected-color finite sum. No model replacement, warning suppression, axiom insertion or resource escalation.

D0 diagnostic green would qualify only its isolated tests. It would permit a separately preregistered minimal R3 source repair; it would not qualify G12, its twelve controls, the core rotation or any physical certificate. D0 red requires diagnosis in that smaller harness, without reopening the full gate. G11 stays last accepted; physical symmetry/energy-domain research stays highest forward priority.
