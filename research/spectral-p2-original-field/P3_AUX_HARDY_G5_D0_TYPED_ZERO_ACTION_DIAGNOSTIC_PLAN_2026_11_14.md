# HARDY-G5 D0 preregistration — typed zero-action diagnostic collection

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED. Diagnostic collection only; strict G5 remains RED_UNQUALIFIED. Commit this plan before diagnostic code.

## Question and boundaries

R3 leaves displayed zero-scaled theta sums; R4's explicit complex zero_smul/sum_const_zero does not rewrite them. Test actual types and canonical witnesses before any new strict proof attempt. All original G5 source/helper/native consumer/strict workflow bytes remain frozen. No deleted native controls, new model or increased Lean resource limits.

Reuse `lean/diagnostics/BFSSTDC1AD2R2ExpressionInspector.lean`, already calibrated by #43562804737. Compile it before native dependencies. Its comparator observes raw syntax/metadata only, not definitional equality; an unequal expression tree is not by itself a cause or a proof obstruction.

## Eight preregistered cases

1. Mathlib-only generic finite complex CLM zero sum, explicit zero_smul per summand; fresh permitted-axiom audit.
2. Actual original Fermion2 carrier with variable operators: zero scalar and generic finite-zero-sum specialization; permitted-axiom audit.
3. Original paired theta data: canonical finite sum of explicit complex-zero coefficients equals zero; permitted-axiom audit.
4. Original paired cliffordLinear zero coefficients joined to case3 after only unfolding its definition and Complex.ofReal_zero; success/failure recorded separately.
5. Original tau zero-control residual after its exact R3 simp step, compare against case3 witness, trace_state, deliberate D2R2 stop.
6. Original potential zero-control residual, same comparison and deliberate stop.
7. Original tau zero-control residual joined by exact case3 witness, with proof/axiom success distinguished from failure.
8. Original potential zero-control residual joined by exact case3 witness, same distinction.

Cases1/2/3 are calibration gates; failure halts dependent stages and preserves evidence. Inspector+generic before Core build; then variable actual-carrier controls; native G5/G1A dependencies only afterward. Case4/7/8 results are collected independently; a failed join is negative diagnostic evidence, not a green proof.

## Workflow and evidence

Use a separate manifest-triggered workflow, pinned donor baseline f51357761243008201f97d9e0ef0cbefa87d0b06, exact strict source/helper/consumer/workflow hashes, immutable D2R2 inspector, Lean4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Recursively validate original OAI imports and diagnostic candidate hashes. No modification of the original strict workflow.

Build controls once. Bound each fresh Lean case at120 seconds; native dependency build retains3600 seconds. Preserve per-case stdout/stderr/return codes, exact reports, workflow and manifest, source closure and tested SHA. Fresh proof cases must be error/warning-free with only propext/Classical.choice/Quot.sound to count PASS. Expected observation cases require a comparator report and deliberate marker, and may contain no unexpected compiler error. Collector outcome always says strict_G5_qualification=false, including a successful collection. Overall collection success may contain separately labelled failed joins; never call these qualified.

## Decision and stop conditions

Inspect scalar/action and first differing typed subexpression; compare against positive controls. If calibration fails, repair or explain the instrument/interface before native collection. If native canonical sum passes but residual exact join fails, retain the reciprocal typed difference and design a source-bound adapter; do not cosmetically alter strict simp lists. If join passes, review its exact proof bytes and source assumptions before preregistering a separate strict candidate. No conditional witness assumption may enter the original public G5 theorem.

Static hash/import/root, YAML/Python/bash checks precede execution; no local Lean toolchain is available. This experiment changes no mathematical acceptance state.
