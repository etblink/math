# HARDY-G5 R4 prospective contract — explicit complex zero-scalar controls

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED / NOT QUALIFIED. Commit before R4 consumer edit.

## Observation and hypothesis

R3 #43649423110 at 3e57aaaf3c06e4977a1f9a9824a281eb078f99b2 passed isolated helper and all six fresh source declarations, then failed only native consumer zero examples at lines56/60. Both goals are sums of zero-scaled original theta CLMs. [Verified RED receipt](P3_AUX_HARDY_G5_R3_RED_43649423110_NATIVE_ZERO_CONTROLS_2026_11_14.md).

Hypothesis: `zero_smul ℂ` and `Finset.sum_const_zero` close these goals without further Fock unfolding.

## Exact delta and fixed controls

Retain the two current zero-control simp steps and append `simp only [zero_smul ℂ, Finset.sum_const_zero]` to each proof. No declaration or other proof change. Source `9ada3167a5de3be647c51f0740b5998d4e6ea45a` and helper `0398bafa58b46dfbd83ec90a65be84adb03dedf8` stay byte-identical. Workflow changes only consumer expected hash from `5e2257d149462ca507c1f9ccde2231846b4bbe65`. Twelve examples, six/eleven reports, native CAR-one/wrong-two, self-adjointness, imports, donor baseline, toolchain and budgets fixed.

## Verification, falsifiers and stop rule

Inspect exact two-proof delta, statement preservation, root/import/control counts, expected hashes, YAML and embedded Python/bash before CI. No local Lean toolchain; static checks are administrative. Complete strict helper/source/native consumer success required. Every warning, disallowed axiom or compiler failure blocks acceptance. Same scalar goals recurring => preserve precise scalar/action types in a minimal diagnostic and stop simp-list permutations. No deleted controls or increased limits.

Scope: pointwise original coefficient-defined Fock potential/tau anticommutator. No Core-charge equality, full smooth-core identity, physical Spin9/Hardy/fidelity/zero-mode/gap claim.
