# HARDY-G5 R3 RED — native zero-input scalar controls

Date: 2026-11-14 Pacific. RED_UNQUALIFIED; no new whole-gate acceptance.

[Strict #43649423110](https://github.com/etblink/math/actions/runs/43649423110), attempt 1, job 132614347356, tested `3e57aaaf3c06e4977a1f9a9824a281eb078f99b2`: completed/failure verified against run/job APIs and decoded job log.

## Progress and first causal error

Preflight PASS: 151 OAI paths, manifest SHA-256 `dd567cc044591ac898c4c12a239da76ccfe602cdf001b2635e5073f3b90deb38`. Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Isolated Mathlib-only finite operator evaluation helper passed its fresh warning-as-error and permitted-axiom audit before the model build. Cold build completed successfully (9073 jobs). Fresh G5 source compiled with all six roots using only propext, Classical.choice, Quot.sound. The earlier operator/vector evaluation mismatch is resolved.

Native consumer failed at exactly two existing zero-input examples, lines56:66 and60:70. Each residual goal is a finite sum of `(0 : Complex) smul pairedAlgebraData.theta p.1 p.2` equal to the zero operator. All six direct native source applications and other controls emit no compiler error. Consumer prints six source plus five donor allowed-axiom reports, but its unsolved example goals prevent compilation and whole-gate qualification.

These are scalar-zero simplification failures, not a CAR counterexample or a recurrence of R2 vector evaluation. No new recursion error observed. Keep zero-input controls.

| Binding | Value |
| --- | --- |
| Source | `9ada3167a5de3be647c51f0740b5998d4e6ea45a` |
| Helper | `0398bafa58b46dfbd83ec90a65be84adb03dedf8` |
| Consumer | `5e2257d149462ca507c1f9ccde2231846b4bbe65` |
| Workflow | `74b7ecda712d4841a5d7f4a0038874320e1cb5a6` |
| Reviewed donor baseline | f51357761243008201f97d9e0ef0cbefa87d0b06 |
| Artifact ID / bytes | 14136320401 / 19214 |
| Artifact ZIP digest | `sha256:881f24b85bd1e4d3d19f8739a6dc221cbccbc8b91f09402ca7dc42e8a3f873f2` |

API digest matches upload log; ZIP bytes not independently rehashed. [First-causal excerpt](diagnostics/P3_AUX_HARDY_G5_R3_NATIVE_ZERO_CONTROLS_43649423110_2026_11_14.txt).

## Bounded recovery

Preregister R4 before editing: keep each existing zero-control simp step and append `simp only [zero_smul ℂ, Finset.sum_const_zero]`. Preserve statements, source/helper bytes, twelve controls, CAR-one/wrong-two and self-adjoint controls, six/eleven audits, donors/toolchain/budgets. Workflow delta: expected consumer blob only. Repeated scalar-boundary failure requires typed minimal diagnostic and stops cosmetic retries.

G4 #43642981119 remains accepted predecessor. G5 unqualified. Literal Core potential equality, full smooth-core identity, physical Spin9, Hardy/fidelity, zero mode and gap remain open.
