# P3-AUX-G0B3 R1 — strict GREEN acceptance: original physicalSpace preservation

**Date:** 2026-11-13 Pacific (workflow finished 2026-11-14T06:27:32Z).
**Branch:** `integration/bfss-unified-research-20261108`.
**Verdict:** **STRICT GREEN / ACCEPTED** solely for the original source physical-space preservation theorem.

## Exact CI authority

- [Run #43565346269](https://github.com/etblink/math/actions/runs/43565346269), attempt 1, completed **success**, head SHA `9ef31538fa47b61f2a8f577ca28782528265464c`.
- Job `132357859494` (`original-reciprocal-physical-space-preservation`) passed frozen-source preflight, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold source compile, original independent consumer, exact-root axiom audit and artifact upload.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxG0B3OriginalReciprocalPhysicalSpacePreservation.lean`, Git blob `f3369a9e7a5cbb39291184de3c8d076dd8de1c7c`.
- Native independent consumer `lean/diagnostics/BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservationIndependentConsumer.lean`, Git blob `b8a98a64cd812c600f87c5b791c6af8cde65b19e`.
- Strict workflow `.github/workflows/bfss-p3-aux-g0b3-original-reciprocal-physical-space-strict.yml`, blob `f48a862a3bcd35860f18a61d878f470d3e6c2754`.
- Exact root `FCP.BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservation.originalReciprocalFullL2CLM_preserves_physicalSpace` reported from source and consumer with permitted axioms `[propext, Classical.choice, Quot.sound]` only. No `sorryAx` or compiler error. Marker `BFSS_P3_AUX_G0B3_ORIGINAL_PHYSICAL_SPACE_PRESERVATION_STRICT_GREEN` present.
- [Retained artifact #14102487303](https://github.com/etblink/math/actions/runs/43565346269/artifacts/14102487303), 7,546 bytes, published digest `sha256:aa3313dbaebb53b2a8656c2edf17bfeb3e258abb77a60bc90a25720469198be5`. Job logs and GitHub metadata independently reviewed; artifact ZIP not independently downloaded/rehashed in this review.

## Accepted proposition and exact source lineage

For all real `ε>0` and all `f : FullL2 2` in the actual original source `pairedGaugeData.physicalSpace`, the original bounded `originalReciprocalFullL2CLM hε f` belongs to that same subspace.

Original `GaugeCore.lean` (blob `e4990dadf1d8bde849e351467282ab3f14989c3b`) defines `physicalSpace = ⨅ g, ker (bosonPullback g - fiberAction g)`. This R1 source proof explicitly extracts equality at each exact source `g`, uses separately strict accepted G0B1 bosonic commutation [#43527998761](https://github.com/etblink/math/actions/runs/43527998761) (source blob `28d0ed07`) and G0B2 Fock fiber commutation [#43532571952](https://github.com/etblink/math/actions/runs/43532571952) (source blob `0df4f07a`), and reassembles source membership. It requires no simultaneous AE-full-measure choice across all group elements.

## Strictly excluded claims

This is **input-subspace invariance**, not commutation with its orthogonal projection or a reducing-subspace theorem. It does not supply `Function.Injective Bε`, a bounded inverse on whole original L², a true sixteen-coordinate `PiLp` output lift `B16`, weighted `T` inverse-image graph, zero-regulator closure, physical Spin(9) singlet Hardy lemma, auxiliary ground-state fidelity, or original BFSS spectral gap. Original M5BF0 physical H qualification and TD-C1A RED_UNQUALIFIED remain unchanged.

## Next bounded research step

**RAD-C2A:** native original `FullL2 2` reciprocal injectivity, using G0B0 AE multiplier action, R0A pointwise weight positivity / complex inverse cancellation and `Lp.ext`. Exact source+independent consumer+strict audit required. **RAD-C2B** then builds `B16` from accepted AY `originalMinimalHilbertOutputEquiv` and pinned Mathlib `ContinuousLinearMap.piMap`. G0B3 is supportive but not a dependency of the ambient `PiLp` graph. Preserve both accepted roots and the weighted-form/zero-regulator stop rules.
