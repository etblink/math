# M4-LB1P0B R1 — prospective sparse normalization contract

Date: 2026-11-16 Pacific. Authority: Project Lead, owner-authorized continuation. Unified integration only. No code staged or theorem qualified by this contract.

## Fixed targets and original data

Use the accepted original Source48Label = Fin 24 × Fin 2, original sourceNormalizedGamma, originalSource48SkewPlane, and unchanged originalSource48BivectorK.

1. For arbitrary i,j, prove K(E i j) = (1/4 : ℝ) • (Γ_i * Γ_j - Γ_j * Γ_i).
2. For i ≠ j, prove K(E i j) = (1/2 : ℝ) • (Γ_i * Γ_j).

Prove the opaque finite coefficient contraction before source gamma substitution. Use the existing real-to-complex Fock scalar bridge; preserve original 1/4 normalization. The first theorem includes coincident labels; the second must retain its distinctness premise.

## Exact planned files

- Source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P0BOriginalSource48SkewPlaneNormalization.lean
- Independent consumer: lean/diagnostics/BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalizationIndependentConsumer.lean
- Strict workflow: .github/workflows/bfss-m4-lb1p0b-source48-skew-plane-normalization-strict.yml
- Public audited roots: originalSource48BivectorK_plane_antisym and originalSource48BivectorK_plane_half.
- Consumers: the same two native statements with _consumer suffixes.
- Three additional native consumer controls: diagonal zero, reversed-index sign, and a concrete distinct paired-label half-product.

## Frozen donor and execution boundary

P0A source 7eb090ab82be47ecae18ae0d091716188cb2db79; LB1S d7d460fc8d2806234816e8bd2088f9cebb6addd4; LB0 d08200fae8ef6c9c9544414307ad537f1eeaa4a4; normalized gamma 7abc03723b3111e4a03389b722054e50d6a9bf30; the existing qualified import closure remains unchanged.

Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Retain the preceding strict workflow's 65-minute job, 36-minute restoration and 26-minute proof step; cold source 1100s and fresh source/consumer 360s each. Require original-source cold build, separate warning-as-error source and independent consumer compilations, exactly 2+2 standard-only reports, no sorryAx/errors/unallowlisted warnings, and complete failure/success logs.

The local executor is unavailable in this session. GitHub's preflight and strict CI will execute the checks; source review and generated-file checks must not be described as local Lean compilation. No alternate unpinned runtime is introduced.

## Metadata adaptation

The schema-2 watchdog currently requires a previous_red_run even for a first attempt. Permit a first R1 only when its prospective contract exists, its exact contract commit is recorded, and accepted_predecessor_run equals last_qualified.run_id. Retry attempts retain a prior-red requirement. This corrects first-attempt semantics without inventing a red predecessor.

## Decision and stop line

P0A R4 #43951949627 remains last qualified until P0B passes. Preserve the first causal red and complete artifact before changing the proof; two analogous native-conversion failures require architecture review. No resource increase, donor edit, new global scalar instance, fake commutative algebra, or weakened warning/axiom policy.

Acceptance proves elementary source Fock normalization only. Lie closure, coherent physical Spin9 action, charge domains, G16, Hardy/fidelity and spectrum remain open. Edition 0.8 remains a dated snapshot.
