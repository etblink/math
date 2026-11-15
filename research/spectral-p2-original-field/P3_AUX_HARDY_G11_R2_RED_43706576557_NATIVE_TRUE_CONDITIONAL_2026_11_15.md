# HARDY-G11 R2 — source clean, one native conditional-normalization failure

Date: November 15, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43706576557](https://github.com/etblink/math/actions/runs/43706576557), attempt1, tested `2092258396c549f3076d10ebcc4b0537ff1053dd`, job `132788867782`, completed with failure. G10 remains accepted.

## Verified result and first causal failure

R2 resolves all R1 warnings. Preflight164, helpers1+3, cold9,086-job build and fresh strict source PASS. All six source reports are standard-axiom-only. The native consumer executes for the first time and has one error at53:2, in matching-color example7.

`simpa only [ite_eq_left rfl] using originalHardyY_basis_spin_contraction ... A A ...` simplifies the theorem to the correct finite sum but leaves its right side as `if True then quarter * gammaEntry else 0`. The expected target has the branch value directly. The compiler reports this precise presentation mismatch, with no recursion or resource failure.

All twelve named consumer reports are standard-axiom-only; the other eleven examples emit no error. The complete consumer and final scope still fail, so G11 is not accepted. Do not promote clean named reports or the lack of other diagnostics to full qualification.

## Exact evidence

- Source `fae4dc32dee27c5542f7fffddf217b276ed2bfef`; consumer `51cebb400a0da2cf35998888bdd81dfbaa591ec4`; workflow `81bcb1651f66b105b2b140162b5ab75ff4503c86`.
- Manifest164 SHA256 `1bdf0f07ecdfce11e6266dd4f7975bd68395a8f803110db9d98ff7245572885b`; tested SHA and candidate bytes independently checked against pins.
- Artifact `14159251635`,22,125 bytes; independently downloaded and rehashed SHA256 `cab0ba1f71a814d4169127a40fa87e1c773a1528302f9ccee5e338c3d476896c`, matching GitHub's digest. [Complete thirteen-file ZIP](diagnostics/P3_AUX_HARDY_G11_R2_43706576557_evidence.zip); [complete native log, one failure and twelve reports](diagnostics/P3_AUX_HARDY_G11_R2_NATIVE_TRUE_CONDITIONAL_43706576557_2026_11_15.txt).

## Two-red review and stop-rule decision

R1's deprecated/unused-name boundary is resolved; R2 reaches a new native proof stage. This is the first G11 native conditional-normalization failure, not a recurrence of the source-warning boundary. The mathematical source statement already qualifies at the strict source stage. Rewriting the exact source theorem followed by its positive conditional branch is already used in the source and in other native controls, including the factor-four example.

The bounded repair should therefore reuse that explicit rewrite pattern in example7 only. [R3 preregistration](P3_AUX_HARDY_G11_R3_PRE_GATE_EXPLICIT_MATCHING_COLOR_REWRITE_2026_11_15.md) freezes the entire source and all statements/other eleven proofs. If the same native conditional or conversion boundary recurs after this explicit rewrite, stop full-gate retries and preregister an isolated typed diagnostic before any further candidate. No warning suppression, control deletion or resource escalation.
