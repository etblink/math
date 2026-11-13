# P3-M2A R3 strict GREEN — original-Fock Hilbert–Schmidt fiber acceptance
**Date:** 2026-11-12 Pacific / 2026-11-13 UTC
**Status:** ACCEPTED exactly six M2A declarations; M2B1 not staged, tested or qualified.

## Exact tested proof authority
- [Strict run #43351955062](https://github.com/etblink/math/actions/runs/43351955062), attempt 1, completed SUCCESS. Tested source SHA `b2b17d2da5e4bc1a97718665f2d9c1d1aef553f3`, on `integration/bfss-unified-research-20261108`. Later checkpoint/roadmap-only commits never change which theorem SHA was tested.
- Job `131644890628`, `source-and-independent-consumer`: all steps passed: 81/81 source+consumer pin preflight, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, **9,178 cold build jobs**, exact source with `-DwarningAsError=true`, separate genuine `Fermion 2` operator consumer, source/consumer `#print axioms` audit.
- Evidence artifact ID **14005227265**, digest `sha256:d584684aedde1c2854ba915c7bbb2575ad12eb5ba770eb06067bc681257e078b`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2AOriginalFockHSFiber.lean` Git blob `89543ae62bc971303cbb15d3a0c3207e114d57fa`.
- Independent consumer `lean/diagnostics/BFSSP3M2AOriginalFockHSFiberIndependentConsumer.lean` Git blob `098897960a993f87b5b6eed6275cc643940b5f0b`.
- Six axioms reports contain *only* `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`, unapproved axiom, added resource ceiling, or changed `Fermion 2` source representation.

## Exact scoped qualifications
1. `originalFockOperatorToHSFiber`: source original bounded `Fermion 2 →L[ℂ] Fermion 2` has a complex *linear equivalence* to the finite source Fock HS column carrier.
2. `originalFockHSFiberToOperator`: reverse complex-linear equivalence back to actual original operators.
3. `originalFockHSFiberToOperator_apply`: reconstructed operator evaluates at an actual original source ONB vector as its column.
4. `originalFockHSFiber_tracePairing`: trace of original physical-star product equals finite source Fock Hilbert-column inner product.
5. `originalFockHSFiber_traceSelf`: diagonal trace agrees with the HS column norm squared, **not** original operator norm squared.
6. `originalFockHSFiberColumnsIsometry`: isometry of separately named HS Hilbert carrier to the same true finite `PiLp 2` column type (a transparent definitional abbreviation, **not** a new type with independent inherited operator norm).

**Critical nonclaim:** `OriginalFockHSFiber ι` is definitionally a `PiLp2` Hilbert column carrier; it is NOT a new Lean norm instance installed on the original bounded-operator type. `originalFockHilbertColumns` and its inverse are linear equivalences, NOT isometries of the original operator norm.

## R1→R2→R3 negative/positive knowledge
- [R1 #43349181533](https://github.com/etblink/math/actions/runs/43349181533) FAILED before Lean: cloned manifest accidentally relabeled prior B4B pins to M2A paths, Python dict silently collapsed 81 textual entries to 79 unique paths. [Causal receipt](research/spectral-p2-original-field/P3_M2A_R1_RED_43349181533_MANIFEST_DUPLICATE_KEY_2026_11_12.md).
- [R2 #43349543790](https://github.com/etblink/math/actions/runs/43349543790) PASSED all 81 pins, then FAILED cold Lean source build: missing `AddCommMonoid`/inner/norm instances at opaque `def OriginalFockHSFiber`, heartbeat cascading, later `sorryAx` outputs on failed build. No independent consumer reached. [Causal receipt](research/spectral-p2-original-field/P3_M2A_R2_RED_43349543790_DEF_HSFIBER_TYPECLASS_CASCADE_2026_11_12.md).
- R3 changed exactly one Lean keyword `def→abbrev` plus source blob pin, preserving independent consumer and theorem statements. Entire same gate passed on an exact independent strict receipt. **Method lesson:** transparently package a known actual Hilbert carrier before introducing new normed instances; avoid unjustified maxHeartbeats or unfolding `2^24` Fock coordinates. A green never retroactively overwrites the negative knowledge.

## Handoff
Source-specific [M2B1 blueprint](research/spectral-p2-original-field/P3_M2B1_ORIGINAL_HS_L2_FIELD_BLUEPRINT_2026_11_12.md) describes finite source HS-fiber L² columns and genuine `Boson 2` independent consumer. `M2B2` actual measurable operator-valued source reconstruction and a.e. source operator equality is separate; `M3` original SU(2) left-output gauge, `M4` source Spin9 continuity, `M5` closed H and `M6-M8` spectral joins are NOT proved. Keep `main` and frozen monograph untouched.
